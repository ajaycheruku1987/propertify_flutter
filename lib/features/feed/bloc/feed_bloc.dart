import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/utils/custom_toast.dart';

import '../../../core/failure.dart';
import '../../../core/notify_message.dart';
import '../../home/models/feed_posts_response_model.dart';
import '../repo/feed_repo.dart';
import '../../../features/feed/models/like_feed_post_response_model.dart';
import '../../../features/feed/models/feed_comment_model.dart';

part 'feed_bloc.freezed.dart';
part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepo _feedRepo;

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
          List<FeedPostsResponseModel> updatedFeedsList = state.feedsList.map((
            feed,
          ) {
            if (feed.id == event.propertyId) {
              if (state.postDetails?.id == event.propertyId) {
                emit(
                  state.copyWith(
                    postDetails: state.postDetails?.copyWith(
                      isFavourited: state.postDetails?.isFavourited == true
                          ? false
                          : true,
                    ),
                  ),
                );
              }
              return feed.copyWith(
                isFavourited: feed.isFavourited == true ? false : true,
              );
            }
            return feed;
          }).toList();

          emit(state.copyWith(isLoading: false, feedsList: updatedFeedsList));
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
          List<FeedPostsResponseModel> updatedFeedsList = state.feedsList.map((
            feed,
          ) {
            if (feed.id == event.propertyId) {
              final bool wasLiked = feed.isLiked == true;
              final int currentCount = feed.likesCount ?? 0;
              return feed.copyWith(
                isLiked: !wasLiked,
                likesCount: wasLiked ? currentCount - 1 : currentCount + 1,
              );
            }
            return feed;
          }).toList();

          List<FeedPostsResponseModel> updatedFavouritesList = state
              .favouritesList
              .map((feed) {
                if (feed.id == event.propertyId) {
                  final bool wasLiked = feed.isLiked == true;
                  final int currentCount = feed.likesCount ?? 0;
                  return feed.copyWith(
                    isLiked: !wasLiked,
                    likesCount: wasLiked ? currentCount - 1 : currentCount + 1,
                  );
                }
                return feed;
              })
              .toList();

          emit(
            state.copyWith(
              isLoading: false,
              feedsList: updatedFeedsList,
              favouritesList: updatedFavouritesList,
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
      emit(state.copyWith(commentsLoading: true));

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
          emit(
            state.copyWith(
              commentsLoading: false,
              feedComments: commentsResponse,
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
          emit(
            state.copyWith(
              sendCommentLoading: false,
              feedComments: [commentResponse, ...state.feedComments],
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

      emit(
        state.copyWith(
          isLoading: true,
          feedsList: offset == 0 ? [] : state.feedsList,
        ),
      );

      Either<Failure, List<FeedPostsResponseModel>> feedsResponseEither =
          await _feedRepo.getFeeds(
            city: event.city,
            listingType: event.listingType,
            propertyType: event.propertyType,
            minPrice: event.minPrice,
            maxPrice: event.maxPrice,
            search: event.search,
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
      Either<Failure, List<FeedPostsResponseModel>> similarPropertiesEither =
          await _feedRepo.getSimilarProperties(
            city: event.city,
            propertyType: event.propertyType,
            excludePostId: event.excludePostId,
            limit: event.limit ?? 4,
          );

      similarPropertiesEither.fold(
        (failure) {
          emit(
            state.copyWith(
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (similarProperties) {
          emit(state.copyWith(similarProperties: similarProperties));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
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
      final int limit = event.limit ?? 10;

      Either<Failure, List<FeedPostsResponseModel>> similarPostsEither =
          await _feedRepo.getFeeds(
            propertyType: event.propertyType,
            limit: limit,
          );

      similarPostsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (similarPosts) {
          // Filter out the current post if excludePostId is provided
          List<FeedPostsResponseModel> filteredPosts = similarPosts;
          if (event.excludePostId != null) {
            filteredPosts = similarPosts
                .where((post) => post.id != event.excludePostId)
                .toList();
          }

          emit(state.copyWith(similarPostsByCategory: filteredPosts));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  void _onResetSimilarPostsByCategory(
    _ResetSimilarPostsByCategory event,
    Emitter<FeedState> emit,
  ) {
    emit(state.copyWith(similarPostsByCategory: []));
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
