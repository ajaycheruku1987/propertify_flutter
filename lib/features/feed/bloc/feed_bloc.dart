import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/utils/custom_toast.dart';

import 'package:propertify/core/failure.dart';
import 'package:propertify/core/notify_message.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/features/feed/repo/feed_repo.dart';
import 'package:propertify/core/notification_service.dart';
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
  double? _lastMinPrice;
  double? _lastMaxPrice;
  String? _lastSearch;

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
    on<_UpdatePropertyEvent>(_onUpdatePropertyEvent);
    on<_DeletePropertyEvent>(_onDeletePropertyEvent);
    on<_Reset>(_onReset);
  }

  @override
  FeedState? fromJson(Map<String, dynamic> json) {
    try {
      return FeedState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(FeedState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }

  void _onReset(_Reset event, Emitter<FeedState> emit) {
    emit(const FeedState());
  }

  Future<void> _onToggleFavorite(
    _ToggleFavorite event,
    Emitter<FeedState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final Either<Failure, LikeFeedPostResponseModel> likeEither =
          await _feedRepo.toggleFavorite(propertyId: event.propertyId);

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

    // Sort by date ascending to process chronologically
    final all = List<FeedCommentModel>.from(comments);
    all.sort((a, b) => (a.createdAt ?? '').compareTo(b.createdAt ?? ''));

    final List<FeedCommentModel> roots = [];
    final Map<String, List<FeedCommentModel>> repliesMap = {};

    for (var comment in all) {
      final text = (comment.comment ?? '').trim();
      if (text.startsWith('@')) {
        final parts = text.split(' ');
        final mention = parts[0].substring(1); // Remove @
        
        // Find the latest root by this user
        FeedCommentModel? parent;
        for (var i = roots.length - 1; i >= 0; i--) {
          if (roots[i].username == mention) {
            parent = roots[i];
            break;
          }
        }

        if (parent != null && parent.id != null) {
          repliesMap.putIfAbsent(parent.id!, () => []).add(comment);
        } else {
          roots.add(comment);
        }
      } else {
        roots.add(comment);
      }
    }

    // Now flatten: Newest threads first
    roots.sort((a, b) => (b.createdAt ?? '').compareTo(a.createdAt ?? ''));
    
    final List<FeedCommentModel> result = [];
    for (var root in roots) {
      result.add(root);
      if (root.id != null && repliesMap.containsKey(root.id)) {
        // Replies under a root stay chronological (ascending)
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
          .addCommentToProperty(propertyId: event.propertyId, text: event.text);

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
          final List<FeedCommentModel> updatedComments = _groupComments([...state.feedComments, commentResponse]);

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

  void _onGetFeedsEvent(_GetFeedsEvent event, Emitter<FeedState> emit) async {
    try {
      final int offset = event.offset ?? 0;
      final int limit = event.limit ?? 10;

      final String? city = event.city ?? (offset == 0 ? null : _lastCity);
      final String? listingType = event.listingType ?? (offset == 0 ? null : _lastListingType);
      final String? propertyType = event.propertyType ?? (offset == 0 ? null : _lastPropertyType);
      final double? minPrice = event.minPrice ?? (offset == 0 ? null : _lastMinPrice);
      final double? maxPrice = event.maxPrice ?? (offset == 0 ? null : _lastMinPrice);
      final String? search = event.search ?? (offset == 0 ? null : _lastSearch);

      if (offset == 0) {
        _lastCity = city;
        _lastListingType = listingType;
        _lastPropertyType = propertyType;
        _lastMinPrice = minPrice;
        _lastMaxPrice = maxPrice;
        _lastSearch = search;
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
            minPrice: minPrice,
            maxPrice: maxPrice,
            search: search,
            limit: limit,
            offset: offset,
            latitude: event.latitude,
            longitude: event.longitude,
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
          List<FeedPostsResponseModel> updatedFeedsList;

          if (offset == 0) {
            // Replace data for refresh
            updatedFeedsList = success;
          } else {
            // Add to existing list for pagination
            updatedFeedsList = [...state.feedsList, ...success];
          }

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
      emit(state.copyWith(isLoading: true));

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
    try {
      if (state.similarPropertiesLoading) return;
      
      emit(state.copyWith(
        similarPropertiesLoading: true,
        similarProperties: [], // Clear stale data immediately
      ));

      // Clean city name more robustly
      String? cleanedCity = event.city;
      if (cleanedCity != null && cleanedCity.isNotEmpty) {
        final parts = cleanedCity.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
        if (parts.length > 1) {
          // Try to use the second-to-last or last part as the primary city name
          // e.g., "Mayur Vihar, New Delhi" -> "New Delhi"
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

      similarPropertiesEither.fold(
        (failure) {
          emit(
            state.copyWith(
              similarPropertiesLoading: false,
            ),
          );
        },
        (similarProperties) {
          // Client-side filtering: exclude current post and match listing type if provided
          final filteredProperties = similarProperties.where((post) {
            final postListing = post.listingType?.trim().toLowerCase();
            final targetListing = event.listingType?.trim().toLowerCase();

            // Relaxed listing type check: if target is null, match any; otherwise strict match
            final matchesListing = targetListing == null || postListing == targetListing;
            final isNotCurrent = post.id != event.excludePostId;

            // Strict city check to avoid global results when API filter is loose
            bool matchesCity = true;
            if (cleanedCity != null && cleanedCity.isNotEmpty && post.city != null) {
              final postCity = post.city!.toLowerCase();
              final targetCity = cleanedCity.toLowerCase();
              matchesCity = postCity.contains(targetCity) || targetCity.contains(postCity);
            }
            
            return isNotCurrent && matchesListing && matchesCity;
          }).toList();

          emit(state.copyWith(
            similarPropertiesLoading: false,
            similarProperties: filteredProperties,
          ));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          similarPropertiesLoading: false,
        ),
      );
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
    try {
      if (state.similarPostsByCategoryLoading) return;
      
      emit(state.copyWith(
        similarPostsByCategoryLoading: true,
        similarPostsByCategory: [], // Clear stale data immediately
      ));
      
      final int limit = event.limit ?? 20;

      Either<Failure, List<FeedPostsResponseModel>> similarPostsEither =
          await _feedRepo.getFeeds(
            propertyType: event.propertyType,
            listingType: event.listingType,
            limit: limit,
          );

      similarPostsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              similarPostsByCategoryLoading: false,
            ),
          );
        },
        (similarPosts) {
          // Client-side filtering to exclude current post
          final filteredPosts = similarPosts.where((post) {
            final isNotCurrent = post.id != event.excludePostId;
            return isNotCurrent;
          }).toList();

          emit(state.copyWith(
            similarPostsByCategoryLoading: false,
            similarPostsByCategory: filteredPosts,
          ));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          similarPostsByCategoryLoading: false,
        ),
      );
    }
  }

  void _onResetSimilarPostsByCategory(
    _ResetSimilarPostsByCategory event,
    Emitter<FeedState> emit,
  ) {
    emit(state.copyWith(
      similarPostsByCategory: [],
      similarProperties: [],
    ));
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
