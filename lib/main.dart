import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/models/global/settings.dart';
import 'models/homePage/homePage.dart';

void main() {
  runApp(LmsSystem());
}

class LmsSystem extends StatelessWidget {
  LmsSystem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
  final _router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
          name: 'settings',
          path: '/settings',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const Settings(),
            );
          }
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const Text('Error'),
    ),
  );
}