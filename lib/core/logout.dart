import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/admin/bloc/admin_bloc.dart';
import 'package:propertify/features/auth/bloc/auth_bloc.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/create_post/bloc/create_post_bloc.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/reels/bloc/reels_bloc.dart';
import 'package:propertify/features/requests/bloc/requests_bloc.dart';
import 'package:propertify/features/sales/bloc/sales_bloc.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';

import '../features/auth/presentation/auth_screen.dart';
import '../utils/custom_toast.dart';

void logout({required BuildContext context}) async {
  // Dispatch reset events to all BLoCs
  context.read<AuthBloc>().add(const AuthEvent.logout());
  context.read<AdminBloc>().add(const AdminEvent.reset());
  context.read<CompanyBloc>().add(const CompanyEvent.resetState());
  context.read<HomeBloc>().add(const HomeEvent.reset());
  context.read<ProfileBloc>().add(const ProfileEvent.reset());
  context.read<FeedBloc>().add(const FeedEvent.reset());
  context.read<ReelsBloc>().add(const ReelsEvent.reset());
  context.read<RequestsBloc>().add(const RequestsEvent.reset());
  context.read<SalesBloc>().add(const SalesEvent.reset());
  context.read<ServicesBloc>().add(const ServicesEvent.reset());
  context.read<CreatePostBloc>().add(const CreatePostEvent.resetState());

  CustomToast.showWarningToast(msg: 'Logging out...').then((value) {
    if (context.mounted) {
      context.go(AuthScreen.routeName);
    }
  });
}
