import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/services/presentation/view_service.dart';
import 'package:propertify/features/services/presentation/widgets/service_card.dart';

class MyServicesScreen extends StatefulWidget {
  static const String routeName = '/my-services';
  const MyServicesScreen({super.key});

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ServicesBloc>().add(const ServicesEvent.getMyServicesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My Services',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state.isMyServicesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final services = state.myServicesList;
          if (services.isEmpty) {
            return const Center(child: Text('No services found'));
          }

          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              final imageUrl =
                  (service.imageUrls != null && service.imageUrls!.isNotEmpty)
                  ? service.imageUrls!.first
                  : 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=300&h=200&fit=crop';
              final categoryLabel =
                  (service.category != null && service.category!.isNotEmpty)
                  ? service.category!.join(', ')
                  : 'General';
              final ratingValue = double.tryParse(service.rating ?? '');

              return ServiceCard(
                imageUrl: imageUrl,
                title: service.agentName ?? 'Service',
                category: categoryLabel,
                providerName: service.owner?.username ?? 'Unknown Provider',
                location: service.address ?? service.city ?? 'Unknown Location',
                rating: ratingValue,
                ratingCount: service.ratingCount,
                isTopAd: service.isVerified ?? false,
                isFavorite: false,
                canEdit: true, // It's their own service
                onEdit: () {
                  context.push(
                    '/edit-service', // Navigate to EditServiceScreen
                    extra: service,
                  );
                },
                canDelete: true,
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: const Text('Delete Service'),
                        content: const Text('Are you sure you want to delete this service?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                              context.read<ServicesBloc>().add(
                                ServicesEvent.deleteServiceEvent(serviceId: service.id ?? ''),
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
                },
                onCardPressed: () {
                  context.push(
                    ViewServiceScreen.routeName,
                    extra: service.id ?? '',
                  );
                },
                onFavoritePressed: () {},
              );
            },
          );
        },
      ),
    );
  }
}
