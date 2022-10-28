import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:start_up_mobile/core/view_model/base_state.dart';

abstract class PaginationBuilder {
  final Ref ref;

  PaginationBuilder(this.ref);

  final int firstPageNumber = 1;

  int page = 1;

  ScrollController scrollController = ScrollController();

  void listenerScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        _request();
      }
    });
  }

  Future<void> request();

  Future<void> _requestPost() async {
    ref.read(isLoadingState.notifier).update((state) => true);
    await request();
    ref.read(isLoadingState.notifier).update((state) => false);
  }

  Future<void> _request() async {
    await _requestPost();
    page++;
  }

  void refreshPage() {
    page = 1;
  }
}
