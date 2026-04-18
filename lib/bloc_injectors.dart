import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/create_post/bloc/create_post_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/features/admin/bloc/admin_bloc.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/sales/bloc/sales_bloc.dart';

import 'core/service_locator.dart';
import 'core/api_request/api_request.dart';
import 'core/app_cache_service.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/repo/auth_repo.dart';
import 'features/create_post/repo/create_post_repository.dart';
import 'features/home/repo/home_repo.dart';
import 'features/profile/repo/profile_repo.dart';
import 'features/feed/repo/feed_repo.dart';
import 'features/services/repo/services_repo.dart';
import 'features/sales/repo/sales_repo.dart';
import 'features/requests/bloc/requests_bloc.dart';
import 'features/requests/repo/requests_repo.dart';
import 'features/reels/bloc/reels_bloc.dart';
import 'features/reels/repo/reels_repo.dart';
import 'features/company/bloc/company_bloc.dart';
import 'features/company/repo/company_repository.dart';

final List<BlocProvider> blocInjectors = [
  BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
  BlocProvider<CreatePostBloc>(
    create: (context) => CreatePostBloc(CreatePostRepositoryImpl()),
  ),
  BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(ProfileRepo())),
  BlocProvider<HomeBloc>(create: (context) => HomeBloc(HomeRepo())),
  BlocProvider<FeedBloc>(create: (context) => FeedBloc(FeedRepo())),
  BlocProvider<ServicesBloc>(create: (context) => ServicesBloc(ServicesRepo())),
  BlocProvider<SalesBloc>(create: (context) => SalesBloc(SalesRepo())),
  BlocProvider<RequestsBloc>(create: (context) => RequestsBloc(RequestsRepo())),
  BlocProvider<ReelsBloc>(create: (context) => ReelsBloc(ReelsRepoImpl())),
  BlocProvider<CompanyBloc>(
    create: (context) => CompanyBloc(CompanyRepositoryImpl()),
  ),
  BlocProvider<AdminBloc>(create: (context) => AdminBloc()),
];
