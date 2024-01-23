import 'package:film_planner/features/core/application/platform_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di.dart';

class PlatformWrapper extends StatelessWidget {
  const PlatformWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlatformBloc>(
      create: (_) => PlatformBloc(sl()),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          context.read<PlatformBloc>().add(
                SizeChangedEvent(
                  deviceWidth: constraints.maxWidth,
                  deviceHeight: constraints.maxHeight,
                ),
              );

          return child;
        },
      ),
    );
  }
}
