import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:start_up_mobile/core/extension/list_extension.dart';
import 'package:start_up_mobile/core/service/service_modules/view_model_service.dart';
import 'package:start_up_mobile/core/shared/app_scaffold.dart';
import 'package:start_up_mobile/core/view_model/base_state.dart';
import 'package:start_up_mobile/feature/home/view_model/state/home_states.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      body: SingleChildScrollView(
        controller: ref.watch(homeViewModel).scrollController,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                trailing: Image.network(
                  ref.watch(articles)?[index].urlToImage ??
                      "https://cdn.searchenginejournal.com/wp-content/uploads/2022/04/reverse-image-search-627b7e49986b0-sej-760x400.png",
                ),
                title: Text(ref.watch(articles)?[index].title ?? ""),
                subtitle: Text(ref.watch(articles)?[index].description ?? ""),
              ),
              itemCount: ref.watch(articles).itemCount,
            ),
            ref.watch(isLoadingState) ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink(),
            SizedBox(height: MediaQuery.of(context).viewPadding.bottom)
          ],
        ),
      ),
    );
  }
}
