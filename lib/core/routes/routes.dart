import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/pages/home_screen.dart';
import '../dependency_initializer/i_dependency_initializer.dart';
import 'routes_constants.dart';

class Routes {
  Routes({
    required IDependencyInitializer dependencyInitializer,
  }) : _dependencyInitializer = dependencyInitializer;

  final IDependencyInitializer _dependencyInitializer;

  Map<String, Widget Function(BuildContext)> getRoutes(){
    return <String, Widget Function(BuildContext)>{
      RoutesConstants.home: (context) => BlocProvider(
        create: (context) {
          return _dependencyInitializer.homeMoviesBloc;
        },
        child: const HomeScreen(),
      ),
    };
  }
}
