import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data_state.dart';

class BaseBlocBuilder<B extends BlocBase<S>, S extends DataState> extends StatelessWidget {
  const BaseBlocBuilder({
    required this.bloc,
    required this.onSuccess,
    required this.onEmpty,
    required this.onError,
    required this.onLoading,
    super.key,
  });

  final B bloc;
  final Widget Function({
    required S state,
  }) onError;
  final Widget Function({
    required S state,
  }) onLoading;
  final Widget Function({
    required S state,
  }) onEmpty;
  final Widget Function({
    required S state,
  }) onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      bloc: bloc,
      builder: (BuildContext context, S state) {
        if (state.isLoading()) return onLoading(state: state);
        if (state.hasError()) return onError(state: state);
        if (state.isEmpty()) return onEmpty(state: state);
        if (state.hasData()) return onSuccess(state: state);
        return Container();
      },
    );
  }
}
