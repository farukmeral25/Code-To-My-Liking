import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:start_up_mobile/feature/home/data/model/articles.dart';

final articles = StateProvider<List<Article>?>((ref) => null);
