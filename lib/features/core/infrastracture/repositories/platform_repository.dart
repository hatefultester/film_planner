import 'package:dartz/dartz.dart';
import 'package:film_planner/features/core/domain/enums/platform_dimension_enum.dart';
import 'package:film_planner/features/core/domain/interfaces/i_platform_repository.dart';

import '../../../../config/constants.dart';

class PlatformRepository implements IPlatformRepository {
  const PlatformRepository();

  @override
  Future<Either<Exception, PlatformDimensionEnum>> getPlatformDimension(
      {required double deviceWidth, required double deviceHeight}) async {
    try {
      if (deviceWidth < 0.0 || deviceHeight < 0.0) {
        throw Exception('Invalid device dimensions');
      }

      final platformDimension =
          deviceWidth < Constants.mobileWidthThreshold ? PlatformDimensionEnum.mobile : PlatformDimensionEnum.desktop;

      return Right(platformDimension);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
