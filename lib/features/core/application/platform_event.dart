part of 'platform_bloc.dart';

sealed class PlatformEvent extends Equatable {
  const PlatformEvent();
}

final class SizeChangedEvent extends PlatformEvent {
  const SizeChangedEvent({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceHeight;

  @override
  List<Object?> get props => [deviceWidth, deviceHeight];
}