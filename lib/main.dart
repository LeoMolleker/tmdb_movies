import 'package:flutter/material.dart';

import 'core/dependency_initializer/dependency_initializer.dart';
import 'core/dependency_initializer/i_dependency_initializer.dart';
import 'core/routes/routes.dart';
import 'core/routes/routes_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Routes _routes;
  late IDependencyInitializer _dependencyInitializer;

  @override
  void initState() {
    _dependencyInitializer = DependencyInitializer();
    _routes = Routes(
      dependencyInitializer: _dependencyInitializer,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _dependencyInitializer.initialize(),
      builder: (
        BuildContext context,
        AsyncSnapshot<bool> snapshot,
      ) {
        return snapshot.hasData
            ? MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: RoutesConstants.home,
                routes: _routes.getRoutes(),
              )
            : const CircularProgressIndicator();
      },
    );
  }
}
