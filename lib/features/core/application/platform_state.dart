part of 'platform_bloc.dart';


sealed class PlatformState extends Equatable {
  const PlatformState();
}

class MobilePlatformState extends PlatformState {
  const MobilePlatformState();

  @override
  List<Object?> get props => const [];
}

class DesktopPlatformState extends PlatformState {
  const DesktopPlatformState();

  @override
  List<Object?> get props => const [];
}