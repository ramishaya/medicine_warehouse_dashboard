import 'package:dashboard/Core/utils/service_locator.dart';
import 'package:dashboard/Featuers/HOME/presentation/view_models/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:dashboard/Featuers/HOME/presentation/view_models/all_requests_cubit/all_requests_cubit.dart';
import 'package:dashboard/Featuers/HOME/presentation/view_models/change_state_cubit/change_state_cubit.dart';
import 'package:dashboard/Featuers/HOME/presentation/views/add_medicine_view.dart';
import 'package:dashboard/Featuers/HOME/presentation/views/all_requests_view.dart';
import 'package:dashboard/Featuers/HOME/presentation/views/change_state_view.dart';
import 'package:dashboard/Featuers/LOGIN/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Featuers/HOME/data/repos/home_repo_impl.dart';
import '../../Featuers/HOME/presentation/views/home_view.dart';
import '../../Featuers/LOGIN/data/repos/login_repo_impl.dart';
import '../../Featuers/LOGIN/presentation/views/login_view.dart';

abstract class AppRouter {
  static const kLoginView = '/LoginView';
  static const kHomeView = '/homeView';
  static const kAllRequestsView = '/allRequestsView';
  static const kAddMedicineView = '/addMedicineView';
  static const kChangeStateView = '/changeStateView';

  static final router = GoRouter(routes: [
    GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
              child: const LoginView(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.0), // Top to Bottom
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        }),
    GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          final username = state.extra as String;
          String;
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      AllRequestsCubit(getIt.get<HomeRepoImpl>()),
                ),
              ],
              child: HomeView(userName: username),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0), // Bottom to Top
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        }),
    GoRoute(
        path: kAllRequestsView,
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => AllRequestsCubit(getIt.get<HomeRepoImpl>()),
              child: const AllRequestView(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        }),
    GoRoute(
        path: kAddMedicineView,
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => AddMedicineCubit(getIt.get<HomeRepoImpl>()),
              child: const AddMedicineView(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        }),
    GoRoute(
        path: kChangeStateView,
        pageBuilder: (context, state) {
          final orderID = state.extra as String;
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => ChangeStateCubit(getIt.get<HomeRepoImpl>()),
              child:  ChangeStateView( id: orderID),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        }),
  ]);
}
