import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/screens/explore_courses/explore_screen.dart';
import '../../screens/authentication/controller/authentication.dart';
import '../../screens/course_detail/course_detail.dart';
import '../../screens/course_enroll/course_enroll.dart';
import '../../screens/shared/settings.dart';
import '../../screens/home_page/home_page.dart';


List<GoRoute> mobileBasedRoutes() {
  return [
    GoRoute(
      path: '/',
      name: 'auth',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Authentication(),
      ),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      name: 'settings',
      path: '/settings',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Settings(),
      ),
    ),
    GoRoute(
      name: 'exploreCourses',
      path: '/exploreCourses',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: ExploreScreen(),
      ),
    ),
    GoRoute(
      name: 'courseDetail',
      path: '/courseDetail',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: CourseDetail(extra: state.extra),
      ),
    ),
    GoRoute(
      name: 'courseEnroll',
      path: '/courseEnroll',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: CourseEnroll(extra: state.extra),
      ),
    )
  ];
}

