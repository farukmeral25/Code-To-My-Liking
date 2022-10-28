import 'package:start_up_mobile/core/service/service_modules/repository_service.dart';
import 'package:start_up_mobile/core/util/pagination_builder.dart';
import 'package:start_up_mobile/feature/home/data/model/articles.dart';
import 'package:start_up_mobile/feature/home/domain/argument/top_headline_arg.dart';
import 'package:start_up_mobile/feature/home/domain/service/i_home_service.dart';
import 'package:start_up_mobile/feature/home/view_model/state/home_states.dart';

class HomeViewModel extends PaginationBuilder {
  final IHomeService _homeService;
  HomeViewModel(super.ref) : _homeService = ref.read(homeService) {
    request();
    listenerScrollController();
  }

  @override
  Future<void> request() async {
    final result = await _homeService.fetchNews(arg: TopHeadlineArg(country: "us", category: "business", page: page));
    result.fold((failure) => null, (data) {
      if (page == firstPageNumber) {
        ref.read(articles.notifier).update((_) => data);
      } else {
        List<Article> listArticle = List.from(ref.read(articles) ?? []);
        listArticle.addAll(data);
        ref.read(articles.notifier).update((state) => listArticle);
      }
    });
  }
}
