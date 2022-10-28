import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:start_up_mobile/core/error/failure.dart';
import 'package:start_up_mobile/feature/home/data/model/articles.dart';
import 'package:start_up_mobile/feature/home/domain/argument/top_headline_arg.dart';

abstract class IHomeService {
  final Ref ref;

  IHomeService(this.ref);

  Future<Either<Failure, List<Article>>> fetchNews({required TopHeadlineArg arg});
}
