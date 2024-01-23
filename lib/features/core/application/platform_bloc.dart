import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:film_planner/features/core/domain/interfaces/i_platform_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/enums/platform_dimension_enum.dart';

part 'platform_event.dart';

part 'platform_state.dart';

class PlatformBloc extends Bloc<PlatformEvent, PlatformState> {
  PlatformBloc(this._platformRepository) : super(const MobilePlatformState()) {
    on<SizeChangedEvent>(_onSizeChanged, transformer: droppable());
  }

  final IPlatformRepository _platformRepository;

  FutureOr<void> _onSizeChanged(SizeChangedEvent event, Emitter<PlatformState> emit) async {
    final repositoryResult = await _platformRepository.getPlatformDimension(
      deviceWidth: event.deviceWidth,
      deviceHeight: event.deviceHeight,
    );

    if (repositoryResult.fold((l) => null, (r) => r) case final result?) {
      switch (result) {
        case PlatformDimensionEnum.mobile:
          emit(const MobilePlatformState());
        case PlatformDimensionEnum.desktop:
          emit(const DesktopPlatformState());
      }
    }
  }
}
