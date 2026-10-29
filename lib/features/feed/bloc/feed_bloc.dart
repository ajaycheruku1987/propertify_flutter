import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/utils/custom_toast.dart';

import 'package:propertify/core/constants/app_categories.dart';
import 'package:propertify/core/failure.dart';
import 'package:propertify/core/notify_message.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/features/feed/repo/feed_repo.dart';
import 'package:propertify/core/notification_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/core/services/review_service.dart';
import 'package:propertify/core/services/block_service.dart';
import 'package:propertify/features/feed/models/like_feed_post_response_model.dart';
import 'package:propertify/features/feed/models/feed_comment_model.dart';

part 'feed_bloc.freezed.dart';
part 'feed_bloc.g.dart';
part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends HydratedBloc<FeedEvent, FeedState> {
  final FeedRepo _feedRepo;

  String? _lastCity;
  String? _lastListingType;
  String? _lastPropertyType;
  String? _lastMainCategory;
  double? _lastMinPrice;
  double? _lastMaxPrice;
  String? _lastSearch;
  double? _lastLatitude;
  double? _lastLongitude;

  /// Bumps on every similar-properties request so stale responses are ignored.
  int _similarPropertiesRequestId = 0;
  int _similarPostsByCategoryRequestId = 0;

  FeedBloc(this._feedRepo) : super(const FeedState()) {
    on<_GetFeedsEvent>(_onGetFeedsEvent);
    on<_GetPostDetailsEvent>(_onGetPostDetailsEvent);
    on<_GetSimilarPropertiesEvent>(_onGetSimilarPropertiesEvent);
    on<_LikeProperty>(_onLikeProperty);
    on<_AddCommentToProperty>(_onAddCommentToProperty);
    on<_IsLoading>(_onIsLoading);
    on<_ToggleFavorite>(_onToggleFavorite);
    on<_GetCommentsById>(_onGetCommentsById);
    on<_GetMyProperties>(_onGetMyProperties);
    on<_GetFavourites>(_onGetFavourites);
    on<_RecordPropertyView>(_onRecordPropertyView);
    on<_GetSimilarPostsByCategoryEvent>(_onGetSimilarPostsByCategoryEvent);
    on<_ResetSimilarPostsByCategory>(_onResetSimilarPostsByCategory);
    on<_DeletePropertyEvent>(_onDeletePropertyEvent);
    on<FeedEvent>((event, emit) async {
      await event.maybeWhen(
        deleteComment: (propertyId, commentId) =>
            _onDeleteComment(propertyId, commentId, emit),
        orElse: () {},
      );
    });
    on<_Reset>(_onReset);
  }

  @override
  FeedState? fromJson(Map<String, dynamic> json) {
    try {
      // Strip any legacy cached similar posts from disk.
      final cleaned = Map<String, dynamic>.from(json)
        ..remove('similarProperties')
        ..remove('similarPostsByCategory');
      return FeedState.fromJson(cleaned);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(FeedState state) {
    try {
      final json = state.toJson();
      json.remove('similarProperties');
      json.remove('similarPostsByCategory');
      return json;
    } catch (_) {
      return null;
    }
  }

  void _onReset(_Reset event, Emitter<FeedState> emit) {
    emit(const FeedState());
  }

  bool _matchesCategoryFilter(
    FeedPostsResponseModel post, {
    String? propertyType,
    String? mainCategory,
  }) {
    if ((propertyType == null || propertyType.isEmpty || propertyType == 'All') &&
        (mainCategory == null || mainCategory.isEmpty || mainCategory == 'All')) {
      return true;
    }

    final postType =
        (post.propertyType ?? post.subCategory ?? '').trim().toLowerCase();
    final postMain = (post.mainCategory ?? '').trim().toLowerCase();

    if (mainCategory != null &&
        mainCategory.isNotEmpty &&
        mainCategory != 'All') {
      final wantedMain = mainCategory.toLowerCase();
      if (postMain == wantedMain) return true;

      final subs =
          AppCategories.propertyCategoryHierarchy[mainCategory] ?? const [];
      return subs.any((s) => s.toLowerCase() == postType);
    }

    if (propertyType != null &&
        propertyType.isNotEmpty &&
        propertyType != 'All') {
      return postType == propertyType.toLowerCase();
    }

    return true;
  }

  Future<void> _onToggleFavorite(
    _ToggleFavorite event,
    Emitter<FeedState> emit,
  ) async {
    try {
      FeedPostsResponseModel? updatePost(FeedPostsResponseModel? post) {
        if (post?.id == event.propertyId) {
          final bool isFavourited = post?.isFavourited ?? false;
          return post?.copyWith(isFavourited: !isFavourited);
        }
        return post;
      }

      final updatedFeedsList = state.feedsList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
      final updatedFavouritesList = state.favouritesList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
      final updatedMyPropertiesList = state.myPropertiesList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
      final updatedSimilarProperties = state.similarProperties.map(updatePost).whereType<FeedPostsResponseModel>().toList();
      final updatedSimilarPostsByCategory = state.similarPostsByCategory.map(updatePost).whereType<FeedPostsResponseModel>().toList();
      final updatedPostDetails = updatePost(state.postDetails);

      // Optimistic update - update state instantly without setting isLoading: true
      emit(
        state.copyWith(
          feedsList: updatedFeedsList,
          favouritesList: updatedFavouritesList,
          myPropertiesList: updatedMyPropertiesList,
          similarProperties: updatedSimilarProperties,
          similarPostsByCategory: updatedSimilarPostsByCategory,
          postDetails: updatedPostDetails,
        ),
      );

      final Either<Failure, LikeFeedPostResponseModel> likeEither =
          await _feedRepo.toggleFavorite(propertyId: event.propertyId);

      likeEither.fold(
        (failure) {
          // Revert optimistic update on failure
          final revertedFeedsList = state.feedsList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final revertedFavouritesList = state.favouritesList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final revertedMyPropertiesList = state.myPropertiesList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final revertedSimilarProperties = state.similarProperties.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final revertedSimilarPostsByCategory = state.similarPostsByCategory.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final revertedPostDetails = updatePost(state.postDetails);

          emit(
            state.copyWith(
              feedsList: revertedFeedsList,
              favouritesList: revertedFavouritesList,
              myPropertiesList: revertedMyPropertiesList,
              similarProperties: revertedSimilarProperties,
              similarPostsByCategory: revertedSimilarPostsByCategory,
              postDetails: revertedPostDetails,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (likeResponse) {
          // Record happy action for in-app review
          serviceLocator<ReviewService>().recordHappyAction();
        },
      );
    } catch (e) {
      // Handle error
    }
  }

  void _onIsLoading(_IsLoading event, Emitter<FeedState> emit) {
    emit(state.copyWith(isLoading: true));
  }

  Future<void> _onLikeProperty(
    _LikeProperty event,
    Emitter<FeedState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final Either<Failure, LikeFeedPostResponseModel> likeEither =
          await _feedRepo.likeProperty(propertyId: event.propertyId);

      likeEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (likeResponse) {
          FeedPostsResponseModel? updatePost(FeedPostsResponseModel? post) {
            if (post?.id == event.propertyId) {
              final bool wasLiked = post?.isLiked == true;
              final int currentCount = post?.likesCount ?? 0;
              
              return post?.copyWith(
                isLiked: !wasLiked,
                likesCount: wasLiked ? currentCount - 1 : currentCount + 1,
              );
            }
            return post;
          }

          final updatedFeedsList = state.feedsList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedFavouritesList = state.favouritesList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedMyPropertiesList = state.myPropertiesList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedSimilarProperties = state.similarProperties.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedSimilarPostsByCategory = state.similarPostsByCategory.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedPostDetails = updatePost(state.postDetails);

          emit(
            state.copyWith(
              isLoading: false,
              feedsList: updatedFeedsList,
              favouritesList: updatedFavouritesList,
              myPropertiesList: updatedMyPropertiesList,
              similarProperties: updatedSimilarProperties,
              similarPostsByCategory: updatedSimilarPostsByCategory,
              postDetails: updatedPostDetails,
            ),
          );

          // Record happy action for in-app review
          serviceLocator<ReviewService>().recordHappyAction();
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onGetCommentsById(
    _GetCommentsById event,
    Emitter<FeedState> emit,
  ) async {
    try {
      emit(state.copyWith(commentsLoading: true, feedComments: []));

      final Either<Failure, List<FeedCommentModel>> commentsEither =
          await _feedRepo.getCommentsById(propertyId: event.propertyId);

      commentsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              commentsLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (commentsResponse) {
          // Sort comments: Group replies under their parents
          final List<FeedCommentModel> sortedComments = _groupComments(commentsResponse);
          emit(
            state.copyWith(
              commentsLoading: false,
              feedComments: sortedComments,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          commentsLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  List<FeedCommentModel> _groupComments(List<FeedCommentModel> comments) {
    if (comments.isEmpty) return [];

    // 1. Sort by date ascending to process chronologically
    final all = List<FeedCommentModel>.from(comments);
    all.sort((a, b) => (a.createdAt ?? '').compareTo(b.createdAt ?? ''));

    String normalize(String? name) =>
        (name ?? '').toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

    final List<FeedCommentModel> roots = [];
    final Map<String, List<FeedCommentModel>> repliesMap = {};
    // comment id -> id of the top-level comment of its thread
    final Map<String, String> threadOf = {};
    final Map<String, String> latestRootByUser = {};
    final Map<String, String> latestThreadByUser = {};

    for (var comment in all) {
      String? rootId;
      if (comment.parentId != null) {
        rootId = threadOf[comment.parentId];
      } else {
        // Legacy comments have no parent_id; infer the thread from "@username".
        final text = (comment.comment ?? '').trim();
        if (text.startsWith('@')) {
          final mention = normalize(text.split(' ').first);
          rootId = latestRootByUser[mention] ?? latestThreadByUser[mention];
        }
      }

      if (rootId != null) {
        repliesMap
            .putIfAbsent(rootId, () => [])
            .add(comment.copyWith(parentId: rootId));
      } else {
        // Parent missing (e.g. deleted) -> show as a top-level comment.
        roots.add(
          comment.parentId == null
              ? comment
              : FeedCommentModel(
                  id: comment.id,
                  propertyId: comment.propertyId,
                  userId: comment.userId,
                  comment: comment.comment,
                  createdAt: comment.createdAt,
                  username: comment.username,
                ),
        );
      }

      final threadId = rootId ?? comment.id;
      if (threadId == null) continue;
      if (comment.id != null) threadOf[comment.id!] = threadId;
      final user = normalize(comment.username);
      if (user.isNotEmpty) {
        latestThreadByUser[user] = threadId;
        if (rootId == null) latestRootByUser[user] = threadId;
      }
    }

    // 2. Sort threads by LATEST activity (newest reply or root time) Descending
    roots.sort((a, b) {
      String latestA = a.createdAt ?? '';
      if (a.id != null && repliesMap.containsKey(a.id) && repliesMap[a.id]!.isNotEmpty) {
        latestA = repliesMap[a.id]!.last.createdAt ?? latestA;
      }
      
      String latestB = b.createdAt ?? '';
      if (b.id != null && repliesMap.containsKey(b.id) && repliesMap[b.id]!.isNotEmpty) {
        latestB = repliesMap[b.id]!.last.createdAt ?? latestB;
      }
      
      return latestB.compareTo(latestA);
    });
    
    // 3. Flatten threads
    final List<FeedCommentModel> result = [];
    for (var root in roots) {
      result.add(root);
      if (root.id != null && repliesMap.containsKey(root.id)) {
        result.addAll(repliesMap[root.id]!);
      }
    }
    return result;
  }

  Future<void> _onAddCommentToProperty(
    _AddCommentToProperty event,
    Emitter<FeedState> emit,
  ) async {
    try {
      emit(state.copyWith(sendCommentLoading: true));

      final Either<Failure, FeedCommentModel> commentEither = await _feedRepo
          .addCommentToProperty(
            propertyId: event.propertyId,
            text: event.text,
            parentId: event.parentId,
          );

      commentEither.fold(
        (failure) {
          emit(
            state.copyWith(
              sendCommentLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (commentResponse) {
          FeedPostsResponseModel? updatePost(FeedPostsResponseModel? post) {
            if (post?.id == event.propertyId) {
              final int currentCount = post?.commentsCount ?? 0;
              return post?.copyWith(
                commentsCount: currentCount + 1,
              );
            }
            return post;
          }

          final updatedFeedsList = state.feedsList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedFavouritesList = state.favouritesList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedMyPropertiesList = state.myPropertiesList.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedSimilarProperties = state.similarProperties.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedSimilarPostsByCategory = state.similarPostsByCategory.map(updatePost).whereType<FeedPostsResponseModel>().toList();
          final updatedPostDetails = updatePost(state.postDetails);

          // Add new comment and re-sort
          final List<FeedCommentModel> updatedComments = _groupComments([
            ...state.feedComments,
            commentResponse.copyWith(
              parentId: commentResponse.parentId ?? event.parentId,
            ),
          ]);

          emit(
            state.copyWith(
              sendCommentLoading: false,
              feedComments: updatedComments,
              feedsList: updatedFeedsList,
              favouritesList: updatedFavouritesList,
              myPropertiesList: updatedMyPropertiesList,
              similarProperties: updatedSimilarProperties,
              similarPostsByCategory: updatedSimilarPostsByCategory,
              postDetails: updatedPostDetails,
              notifyStatus: NotifyStatus(
                message: 'Comment added successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onDeleteComment(
    String propertyId,
    String commentId,
    Emitter<FeedState> emit,
  ) async {
    try {
      final Either<Failure, bool> result = await _feedRepo.deleteComment(
        propertyId: propertyId,
        commentId: commentId,
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          FeedPostsResponseModel? updatePost(FeedPostsResponseModel? post) {
            if (post?.id == propertyId) {
              final int currentCount = post?.commentsCount ?? 0;
              return post?.copyWith(
                commentsCount: currentCount > 0 ? currentCount - 1 : 0,
              );
            }
            return post;
          }

          final updatedFeedsList =
              state.feedsList
                  .map(updatePost)
                  .whereType<FeedPostsResponseModel>()
                  .toList();
          final updatedFavouritesList =
              state.favouritesList
                  .map(updatePost)
                  .whereType<FeedPostsResponseModel>()
                  .toList();
          final updatedMyPropertiesList =
              state.myPropertiesList
                  .map(updatePost)
                  .whereType<FeedPostsResponseModel>()
                  .toList();
          final updatedSimilarProperties =
              state.similarProperties
                  .map(updatePost)
                  .whereType<FeedPostsResponseModel>()
                  .toList();
          final updatedSimilarPostsByCategory =
              state.similarPostsByCategory
                  .map(updatePost)
                  .whereType<FeedPostsResponseModel>()
                  .toList();
          final updatedPostDetails = updatePost(state.postDetails);

          final List<FeedCommentModel> updatedComments =
              state.feedComments.where((c) => c.id != commentId).toList();
          final List<FeedCommentModel> sortedComments = _groupComments(
            updatedComments,
          );

          emit(
            state.copyWith(
              feedComments: sortedComments,
              feedsList: updatedFeedsList,
              favouritesList: updatedFavouritesList,
              myPropertiesList: updatedMyPropertiesList,
              similarProperties: updatedSimilarProperties,
              similarPostsByCategory: updatedSimilarPostsByCategory,
              postDetails: updatedPostDetails,
              notifyStatus: NotifyStatus(
                message: 'Comment deleted successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  void _onGetFeedsEvent(_GetFeedsEvent event, Emitter<FeedState> emit) async {
    try {
      final int offset = event.offset ?? 0;
      final int limit = event.limit ?? 10;

      final String? city = event.city ?? (offset == 0 ? null : _lastCity);
      final String? listingType =
          event.listingType ?? (offset == 0 ? null : _lastListingType);
      final String? propertyType =
          event.propertyType ?? (offset == 0 ? null : _lastPropertyType);
      final String? mainCategory =
          event.mainCategory ?? (offset == 0 ? null : _lastMainCategory);
      final double? minPrice =
          event.minPrice ?? (offset == 0 ? null : _lastMinPrice);
      final double? maxPrice =
          event.maxPrice ?? (offset == 0 ? null : _lastMaxPrice);
      final String? search = event.search ?? (offset == 0 ? null : _lastSearch);
      final double? latitude =
          event.latitude ?? (offset == 0 ? null : _lastLatitude);
      final double? longitude =
          event.longitude ?? (offset == 0 ? null : _lastLongitude);

      if (offset == 0) {
        _lastCity = city;
        _lastListingType = listingType;
        _lastPropertyType = propertyType;
        _lastMainCategory = mainCategory;
        _lastMinPrice = minPrice;
        _lastMaxPrice = maxPrice;
        _lastSearch = search;
        _lastLatitude = latitude;
        _lastLongitude = longitude;
      }

      emit(
        state.copyWith(
          isLoading: true,
          feedsList: offset == 0 ? [] : state.feedsList,
        ),
      );

      Either<Failure, List<FeedPostsResponseModel>> feedsResponseEither =
          await _feedRepo.getFeeds(
            city: city,
            listingType: listingType,
            propertyType: propertyType,
            mainCategory: mainCategory,
            minPrice: minPrice,
            maxPrice: maxPrice,
            search: search,
            limit: limit,
            offset: offset,
            latitude: latitude,
            longitude: longitude,
          );

      feedsResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          // Client-side category guard — covers APIs that ignore main_category /
          // mismatched legacy property_type labels.
          var filteredSuccess = success.where((post) {
            return _matchesCategoryFilter(
              post,
              propertyType: propertyType,
              mainCategory: mainCategory,
            );
          }).toList();

          List<FeedPostsResponseModel> updatedFeedsList;

          if (offset == 0) {
            // Replace data for refresh
            updatedFeedsList = filteredSuccess;
          } else {
            // Add to existing list for pagination
            updatedFeedsList = [...state.feedsList, ...filteredSuccess];
          }

          final blockService = serviceLocator<BlockService>();
          updatedFeedsList = updatedFeedsList.where((post) {
            final isPostBlocked = blockService.isPostBlocked(post.id);
            final isUserBlocked = blockService.isUserBlocked(post.userId) ||
                blockService.isUserBlocked(post.owner?.id);
            return !isPostBlocked && !isUserBlocked;
          }).toList();

          final bool hasMoreData = success.length == limit;

          emit(
            state.copyWith(
              isLoading: false,
              feedsList: updatedFeedsList,
              currentOffset: offset + success.length,
              hasMoreData: hasMoreData,
              notifyStatus: null,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }

  void _onGetPostDetailsEvent(
    _GetPostDetailsEvent event,
    Emitter<FeedState> emit,
  ) async {
    try {
      // Clear previous post + similar lists so we never flash stale city results.
      emit(
        state.copyWith(
          isLoading: true,
          postDetails: null,
          similarProperties: const [],
          similarPostsByCategory: const [],
          similarPropertiesLoading: false,
          similarPostsByCategoryLoading: false,
        ),
      );

      Either<Failure, FeedPostsResponseModel> postDetailsEither =
          await _feedRepo.getPostDetails(postId: event.postId);

      postDetailsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (postDetails) {
          emit(
            state.copyWith(
              isLoading: false,
              postDetails: postDetails,
              notifyStatus: NotifyStatus(
                message: 'Post details loaded successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  void _onGetSimilarPropertiesEvent(
    _GetSimilarPropertiesEvent event,
    Emitter<FeedState> emit,
  ) async {
    final requestId = ++_similarPropertiesRequestId;
    try {
      emit(
        state.copyWith(
          similarPropertiesLoading: true,
          similarProperties: const [],
        ),
      );

      // Clean city name more robustly
      String? cleanedCity = event.city;
      if (cleanedCity != null && cleanedCity.isNotEmpty) {
        final parts = cleanedCity
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
        if (parts.length > 1) {
          cleanedCity = parts.last;
        }
      }

      Either<Failure, List<FeedPostsResponseModel>> similarPropertiesEither =
          await _feedRepo.getSimilarProperties(
            city: cleanedCity,
            propertyType: event.propertyType,
            listingType: event.listingType,
            excludePostId: event.excludePostId,
            limit: event.limit ?? 20,
          );

      // Drop stale responses from a previous post/city.
      if (requestId != _similarPropertiesRequestId) return;

      similarPropertiesEither.fold(
        (failure) {
          emit(state.copyWith(similarPropertiesLoading: false));
        },
        (similarProperties) {
          final filteredProperties = similarProperties.where((post) {
            final postListing = post.listingType?.trim().toLowerCase();
            final targetListing = event.listingType?.trim().toLowerCase();

            final matchesListing =
                targetListing == null || postListing == targetListing;
            final isNotCurrent = post.id != event.excludePostId;

            bool matchesCity = true;
            if (cleanedCity != null &&
                cleanedCity.isNotEmpty &&
                post.city != null) {
              final postCity = post.city!.toLowerCase();
              final targetCity = cleanedCity.toLowerCase();
              matchesCity =
                  postCity.contains(targetCity) ||
                  targetCity.contains(postCity);
            }

            return isNotCurrent && matchesListing && matchesCity;
          }).toList();

          emit(
            state.copyWith(
              similarPropertiesLoading: false,
              similarProperties: filteredProperties,
            ),
          );
        },
      );
    } catch (e) {
      if (requestId != _similarPropertiesRequestId) return;
      emit(state.copyWith(similarPropertiesLoading: false));
    }
  }

  Future<void> _onGetMyProperties(
    _GetMyProperties event,
    Emitter<FeedState> emit,
  ) async {
    try {
      final int offset = event.offset ?? 0;
      final int limit = event.limit ?? 10;

      if (offset == 0) {
        emit(state.copyWith(isPostLoading: true, myPropertiesList: []));
      }

      final Either<Failure, List<FeedPostsResponseModel>> myPropsEither =
          await _feedRepo.getMyProperties(limit: limit, offset: offset);

      myPropsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isPostLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (myProps) {
          List<FeedPostsResponseModel> updatedList;
          if (offset == 0) {
            updatedList = myProps;
          } else {
            updatedList = [...state.myPropertiesList, ...myProps];
          }

          final bool hasMore = myProps.length == limit;

          emit(
            state.copyWith(
              isPostLoading: false,
              myPropertiesList: updatedList,
              myPropertiesOffset: offset + myProps.length,
              hasMoreMyProperties: hasMore,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isPostLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }

  Future<void> _onGetFavourites(
    _GetFavourites event,
    Emitter<FeedState> emit,
  ) async {
    try {
      emit(state.copyWith(isFavouritesLoading: true));

      final Either<Failure, List<FeedPostsResponseModel>> favEither =
          await _feedRepo.getFavourites();

      favEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isFavouritesLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (favs) {
          emit(
            state.copyWith(isFavouritesLoading: false, favouritesList: favs),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isFavouritesLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }

  Future<void> _onRecordPropertyView(
    _RecordPropertyView event,
    Emitter<FeedState> emit,
  ) async {
    try {
      // Don't show loading indicator for view tracking
      await _feedRepo.recordPropertyView(propertyId: event.propertyId);
      // Silently track the view, no state changes needed
    } catch (e) {
      // Silently fail, don't notify user for view tracking errors
    }
  }

  Future<void> _onGetSimilarPostsByCategoryEvent(
    _GetSimilarPostsByCategoryEvent event,
    Emitter<FeedState> emit,
  ) async {
    final requestId = ++_similarPostsByCategoryRequestId;
    try {
      emit(
        state.copyWith(
          similarPostsByCategoryLoading: true,
          similarPostsByCategory: const [],
        ),
      );

      final int limit = event.limit ?? 20;

      Either<Failure, List<FeedPostsResponseModel>> similarPostsEither =
          await _feedRepo.getFeeds(
            propertyType: event.propertyType,
            listingType: event.listingType,
            limit: limit,
          );

      if (requestId != _similarPostsByCategoryRequestId) return;

      similarPostsEither.fold(
        (failure) {
          emit(state.copyWith(similarPostsByCategoryLoading: false));
        },
        (similarPosts) {
          final filteredPosts = similarPosts.where((post) {
            return post.id != event.excludePostId;
          }).toList();

          emit(
            state.copyWith(
              similarPostsByCategoryLoading: false,
              similarPostsByCategory: filteredPosts,
            ),
          );
        },
      );
    } catch (e) {
      if (requestId != _similarPostsByCategoryRequestId) return;
      emit(state.copyWith(similarPostsByCategoryLoading: false));
    }
  }

  void _onResetSimilarPostsByCategory(
    _ResetSimilarPostsByCategory event,
    Emitter<FeedState> emit,
  ) {
    // Invalidate any in-flight similar requests.
    _similarPropertiesRequestId++;
    _similarPostsByCategoryRequestId++;
    emit(
      state.copyWith(
        similarPostsByCategory: const [],
        similarProperties: const [],
        similarPropertiesLoading: false,
        similarPostsByCategoryLoading: false,
      ),
    );
  }

  Future<void> _onUpdatePropertyEvent(
    _UpdatePropertyEvent event,
    Emitter<FeedState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await _feedRepo.updateProperty(
        propertyId: event.propertyId,
        availableFrom: event.availableFrom,
        totalFloors: event.totalFloors,
        isFeatured: event.isFeatured,
        propertyType: event.propertyType,
        bathrooms: event.bathrooms,
        price: event.price,
        city: event.city,
        floor: event.floor,
        latitude: event.latitude,
        propertyAgeYears: event.propertyAgeYears,
        furnishing: event.furnishing,
        longitude: event.longitude,
        address: event.address,
        listingType: event.listingType,
        amenities: event.amenities,
        newImages: event.newImages,
        bedrooms: event.bedrooms,
        title: event.title,
        isPromoted: event.isPromoted,
        existingImageUrls: event.existingImageUrls,
        description: event.description,
        isVerified: event.isVerified,
        areaSqft: event.areaSqft,
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (updatedProperty) {
          final updatedFeedsList = state.feedsList.map((property) {
            if (property.id == updatedProperty.id) {
              return updatedProperty;
            }
            return property;
          }).toList();

          final updatedMyPropertiesList = state.myPropertiesList.map((property) {
            if (property.id == updatedProperty.id) {
              return updatedProperty;
            }
            return property;
          }).toList();

          final updatedFavouritesList = state.favouritesList.map((property) {
            if (property.id == updatedProperty.id) {
              return updatedProperty;
            }
            return property;
          }).toList();

          final updatedSimilarProperties = state.similarProperties.map((property) {
            if (property.id == updatedProperty.id) {
              return updatedProperty;
            }
            return property;
          }).toList();

          final updatedSimilarPostsByCategory = state.similarPostsByCategory.map((property) {
            if (property.id == updatedProperty.id) {
              return updatedProperty;
            }
            return property;
          }).toList();

          FeedPostsResponseModel? updatedPostDetails = state.postDetails;
          if (state.postDetails?.id == updatedProperty.id) {
            updatedPostDetails = updatedProperty;
          }

          emit(
            state.copyWith(
              isLoading: false,
              feedsList: updatedFeedsList,
              myPropertiesList: updatedMyPropertiesList,
              favouritesList: updatedFavouritesList,
              similarProperties: updatedSimilarProperties,
              similarPostsByCategory: updatedSimilarPostsByCategory,
              postDetails: updatedPostDetails,
              notifyStatus: NotifyStatus(
                message: 'Property updated successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }

  Future<void> _onDeletePropertyEvent(
    _DeletePropertyEvent event,
    Emitter<FeedState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await _feedRepo.deleteProperty(
        propertyId: event.propertyId,
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          final updatedFeedsList = state.feedsList
              .where((property) => property.id != event.propertyId)
              .toList();

          final updatedMyPropertiesList = state.myPropertiesList
              .where((property) => property.id != event.propertyId)
              .toList();

          final updatedFavouritesList = state.favouritesList
              .where((property) => property.id != event.propertyId)
              .toList();

          final updatedSimilarProperties = state.similarProperties
              .where((property) => property.id != event.propertyId)
              .toList();

          final updatedSimilarPostsByCategory = state.similarPostsByCategory
              .where((property) => property.id != event.propertyId)
              .toList();

          FeedPostsResponseModel? updatedPostDetails = state.postDetails;
          if (state.postDetails?.id == event.propertyId) {
            updatedPostDetails = null;
          }

          emit(
             state.copyWith(
              isLoading: false,
              feedsList: updatedFeedsList,
              myPropertiesList: updatedMyPropertiesList,
              favouritesList: updatedFavouritesList,
              similarProperties: updatedSimilarProperties,
              similarPostsByCategory: updatedSimilarPostsByCategory,
              postDetails: updatedPostDetails,
              notifyStatus: NotifyStatus(
                message: 'Property deleted successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }
}
