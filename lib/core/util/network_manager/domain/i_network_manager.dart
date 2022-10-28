import 'package:dartz/dartz.dart';
import 'package:start_up_mobile/core/error/failure.dart';
import 'package:start_up_mobile/core/util/network_manager/domain/entity/base_post.dart';

abstract class INetworkManager {
  Future<Either<Failure, String>> baseGet({required BaseGet basePost});
}
