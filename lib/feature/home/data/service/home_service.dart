import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:start_up_mobile/core/error/failure.dart';
import 'package:start_up_mobile/core/service/service_modules/repository_service.dart';
import 'package:start_up_mobile/core/util/network_manager/domain/entity/base_post.dart';
import 'package:start_up_mobile/core/util/network_manager/domain/entity/main_endpoint.dart';
import 'package:start_up_mobile/core/util/network_manager/domain/i_network_manager.dart';
import 'package:start_up_mobile/feature/home/data/model/articles.dart';
import 'package:start_up_mobile/feature/home/domain/argument/top_headline_arg.dart';
import 'package:start_up_mobile/feature/home/domain/service/i_home_service.dart';

class HomeService extends IHomeService {
  late final INetworkManager _networkManager;
  HomeService(super.ref) : _networkManager = ref.read(networkManager);

  @override
  Future<Either<Failure, List<Article>>> fetchNews({required TopHeadlineArg arg}) async {
    final result = await _networkManager.baseGet(
      basePost: BaseGet(
        MainEndpoint.fetchTopHeadlines.value,
        queryParameter: arg.toMap(),
      ),
    );

    return result.fold((failure) => Left(failure), (data) {
      final articles = List<Article>.from(json.decode(data)["articles"].map((x) => Article.fromMap(x)));
      return Right(articles);
    });
  }
}
