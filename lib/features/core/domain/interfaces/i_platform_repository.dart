import 'package:film_planner_api/film_planner_api.dart';

import '../enums/platform_dimension_enum.dart';

abstract interface class IPlatformRepository {
  Future<Either<Exception, PlatformDimensionEnum>> getPlatformDimension({
    required double deviceWidth,
    required double deviceHeight,
  });
}
