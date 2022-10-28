import 'package:dio/dio.dart';
import 'package:start_up_mobile/core/util/network_manager/domain/entity/base_post.dart';
import 'package:start_up_mobile/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:start_up_mobile/core/util/network_manager/domain/i_network_manager.dart';

class NetworkManager extends INetworkManager {
  final Dio _dio;
  NetworkManager(this._dio);

  @override
  Future<Either<Failure, String>> baseGet({required BaseGet basePost}) async {
    return await _errorHandler(
      _dio.get(
        basePost.endPoint,
        options: Options(
          validateStatus: (_) => true,
        ),
        queryParameters: basePost.queryParameter,
      ),
    );
  }

  Future<Either<Failure, String>> _errorHandler(Future<Response> requestFunction) async {
    Response response;
    try {
      response = await requestFunction;
    } catch (exception) {
      return Left(NotFoundFailure());
    }
    return _handleResponse(response);
  }

  Either<Failure, String> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return Right(response.data);
    } else {
      return Left(NotFoundFailure());
    }
  }
}
