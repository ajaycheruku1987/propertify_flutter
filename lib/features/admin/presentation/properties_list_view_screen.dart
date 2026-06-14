import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/features/home/presentation/widgets/property_card.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/utils/debouncer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:propertify/features/feed/repo/feed_repo.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';

import '../../../core/notify_message.dart';
import '../bloc/admin_bloc.dart';
import '../../home/models/feed_posts_response_model.dart';
import '../../../utils/common_widgets/common_textfield.dart';

class PropertiesListViewScreen extends StatefulWidget {
  static const String routeName = '/admin-properties';

  const PropertiesListViewScreen({super.key});

  @override
  State<PropertiesListViewScreen> createState() =>
      _PropertiesListViewScreenState();
}

class _PropertiesListViewScreenState extends State<PropertiesListViewScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    context.read<AdminBloc>().add(const AdminEvent.getAdminProperties());
    _scrollController.addListener(_onScroll);
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final state = context.read<AdminBloc>().state;
      if (!state.isLoading && state.hasMoreProperties) {
        context.read<AdminBloc>().add(
          AdminEvent.getAdminProperties(
            page: state.currentPropertiesPage + 1,
            limit: 30,
            search: _searchController.text,
          ),
        );
      }
    }
  }

  void _onSearch() {
    context.read<AdminBloc>().add(
      AdminEvent.getAdminProperties(
        page: 1,
        limit: 30,
        search: _searchController.text,
      ),
    );
  }

  void _onSearchChanged(String query) {
    _debouncer.run(() {
      _onSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state.notifyStatus != null) {
          if (state.notifyStatus!.type == NotifyType.error) {
            CustomToast.showErrorToast(msg: state.notifyStatus?.message);
          } else {
            CustomToast.showSuccessToast(msg: state.notifyStatus?.message);
          }
          context.read<AdminBloc>().add(const AdminEvent.clearAdminState());
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: state.isLoading && state.properties == null,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => context.pop(),
              ),
              title: const Text(
                'Properties',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                _buildSearchBar(),
                Expanded(
                  child: state.properties == null || state.properties!.isEmpty
                      ? _buildEmptyState()
                      : _buildPropertiesList(state.properties!),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CommonTextFormField(
        controller: _searchController,
        hintText: 'Search properties...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, size: 20),
                onPressed: () {
                  _searchController.clear();
                  _onSearch();
                },
              )
            : null,
        onChanged: _onSearchChanged,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home_outlined, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'No properties found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertiesList(List<FeedPostsResponseModel> properties) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final property = properties[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Stack(
            children: [
              PropertyCard(
                imageUrls: property.imageUrls ?? [],
                title: property.title ?? 'Property',
                location: property.address ?? property.city ?? 'Unknown',
                price: property.price != null ? '₹${property.price}' : null,
                isFavorite: property.isFavourited ?? false,
                isLiked: property.isLiked ?? false,
                isFeatured: property.isCurrentlyPromoted,
                likeCount: property.likesCount ?? 0,
                commentCount: property.commentsCount ?? 0,
                viewCount: property.viewsCount ?? 0,
                onFavoritePressed: () {},
                onCardPressed: () {
                  context.push(
                    '${PostDetailsScreen.routeName}?postId=${property.id}',
                  );
                },
                onSharePressed: () {
                  Share.share('Check out this property: ${property.title}');
                },
                onReportPressed: () {
                  if (property.id != null) {
                    _handleReportProperty(property.id!);
                  }
                },
                onLikePressed: () {},
                onCommentPressed: () {},
                promotedAt: property.promotedAt,
                promotedUntil: property.promotedUntil,
                createdAt: property.createdAt,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _handleDeleteProperty(property.id ?? ''),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleDeleteProperty(String propertyId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Property'),
        content: const Text('Are you sure you want to delete this property?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<AdminBloc>().add(
                AdminEvent.deleteAdminProperty(propertyId: propertyId),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _handleReportProperty(String propertyId) {
    if (!context.read<HomeBloc>().state.showAddButton) {
      CustomToast.showErrorToast(msg: 'please login to report');
      context.push(AuthScreen.routeName);
      return;
    }

    final TextEditingController reasonController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    String? selectedReason = 'Spam or Misleading';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Row(
                children: [
                  Icon(
                    Icons.report_problem_rounded,
                    color: Colors.orange,
                    size: 28,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Report Property',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Why are you reporting this property?',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(height: 12),
                      ...[
                        'Spam or Misleading',
                        'Incorrect details/Price',
                        'Inappropriate content',
                        'Other',
                      ].map((reason) {
                        return RadioListTile<String>(
                          title: Text(
                            reason,
                            style: const TextStyle(fontSize: 14),
                          ),
                          value: reason,
                          groupValue: selectedReason,
                          activeColor: Theme.of(context).primaryColor,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          onChanged: (val) {
                            setState(() {
                              selectedReason = val;
                            });
                          },
                        );
                      }),
                      if (selectedReason == 'Other') ...[
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: reasonController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Enter reason here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a reason';
                            }
                            return null;
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isLoading
                      ? null
                      : () => Navigator.pop(dialogContext),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (selectedReason == 'Other' &&
                              !formKey.currentState!.validate()) {
                            return;
                          }

                          final reasonText = selectedReason == 'Other'
                              ? reasonController.text.trim()
                              : selectedReason!;

                          setState(() {
                            isLoading = true;
                          });

                          final repo = FeedRepo();
                          final res = await repo.reportProperty(
                            propertyId: propertyId,
                            reason: reasonText,
                          );

                          if (context.mounted) {
                            Navigator.pop(dialogContext);
                            res.fold(
                              (failure) {
                                CustomToast.showErrorToast(
                                  msg: failure.message,
                                );
                              },
                              (success) {
                                CustomToast.showSuccessToast(
                                  msg:
                                      'Post reported, we will investigate further',
                                );
                              },
                            );
                          }
                        },
                  child: isLoading
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Report',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
