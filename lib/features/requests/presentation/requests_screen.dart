import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/notify_message.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';

import 'package:propertify/features/home/presentation/home_interior_screen.dart';
import 'package:propertify/features/home/presentation/home_loan_screen.dart';
import 'package:propertify/features/home/presentation/widgets/home_loan_widget.dart';
import 'package:propertify/features/home/presentation/widgets/request_tile_widget.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/requests_bloc.dart';
import 'create_request_details.dart';
import 'edit_request.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  int _currentSlide = 0;

  @override
  void initState() {
    super.initState();
    // Trigger the initial request to fetch data
    context.read<RequestsBloc>().add(
      RequestsEvent.getRequests(
        skip: 0,
        limit: 10,
        latitude: context.read<HomeBloc>().state.currentLat,
        longitude: context.read<HomeBloc>().state.currentLng,
        radiusKm: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsBloc, RequestsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.1,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index;
                      });
                    },
                  ),
                  items: [
                    AdSliderWidget(
                      title: 'Home Loan',
                      caption: 'Need a home Loan Raise a\nRequest',
                      onCreateRequest: () {
                        context.read<HomeBloc>().state.showAddButton
                            ? context.push(
                                CreateRequestDetails.routeName,
                                extra: 'Loan',
                              )
                            : context.push(AuthScreen.routeName);
                      },
                      onExploreDetails: () {
                        context.push(HomeLoanScreen.routeName);
                      },
                    ),
                    AdSliderWidget(
                      title: 'Interior Design',
                      caption: 'Design your dream home\nRaise a Request',
                      onCreateRequest: () {
                        context.read<HomeBloc>().state.showAddButton
                            ? context.push(
                                CreateRequestDetails.routeName,
                                extra: 'Interior Design',
                              )
                            : context.push(AuthScreen.routeName);
                      },
                      onExploreDetails: () {
                        context.push(HomeInteriorScreen.routeName);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(2, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentSlide == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentSlide == index
                            ? Colors.deepPurple
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
              ]),
            ),
            // Requests List as Sliver
            _buildRequestsListSliver(state),
          ],
        );
      },
    );
  }

  Widget _buildRequestsListSliver(RequestsState state) {
    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.notifyStatus != null &&
        state.notifyStatus!.type == NotifyType.error) {
      return SliverFillRemaining(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            state.notifyStatus!.message ?? 'Failed to load requests',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    if (state.requestsList.isEmpty) {
      return const SliverFillRemaining(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No requests available. Be the first to create one!'),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final request = state.requestsList[index];
        if (request.category == 'Loan' ||
            request.category == 'Interior Design') {
          return const SizedBox.shrink();
        }
        return RequestTileWidget(
          title: request.title ?? request.category ?? 'Unknown Request',
          ownerName: request.owner?.username ?? 'Unknown Provider',
          budget: request.budget?.toString() ?? 'Unknown Budget',
          location: '${request.city ?? ''}',
          description: request.description ?? 'Unknown Description',
          type: request.category ?? 'General',
          onEditPressed:
              request.owner?.id ==
                  context.read<ProfileBloc>().state.userProfile?.id
              ? () {
                  // Navigate to edit screen
                  context.push(EditRequest.routeName, extra: request);
                }
              : null,
          onDeletePressed:
              request.owner?.id ==
                  context.read<ProfileBloc>().state.userProfile?.id
              ? () {
                  // Show confirmation dialog before deleting
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete Request'),
                        content: const Text(
                          'Are you sure you want to delete this request?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.read<RequestsBloc>().add(
                                RequestsEvent.deleteRequest(
                                  requestId: request.id!,
                                ),
                              );
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              : null,

          onCallPressed: () {
            debugPrint('Calling ${request.phoneNumber}');
            if (!context.read<HomeBloc>().state.showAddButton) {
              context.push(AuthScreen.routeName);
              return;
            }
            if (request.phoneNumber != null) {
              launchUrl(Uri(scheme: 'tel', path: request.phoneNumber!));
            }
          },
          onWhatsAppPressed: () {
            debugPrint('WhatsApp to ${request.phoneNumber}');
            if (!context.read<HomeBloc>().state.showAddButton) {
              context.push(AuthScreen.routeName);
              return;
            }
            if (request.phoneNumber != null) {
              launchUrl(
                Uri(scheme: 'https', host: 'wa.me', path: request.phoneNumber!),
              );
            }
          },
          onTap: () {
            debugPrint('Tapped on request ${request.id}');
          },
        );
      }, childCount: state.requestsList.length),
    );
  }
}
