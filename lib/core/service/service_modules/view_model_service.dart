import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:start_up_mobile/feature/home/view_model/home_view_model.dart';

Future<void> viewModelService() async {
  homeViewModel = Provider.autoDispose((ref) => HomeViewModel(ref));
}

late final AutoDisposeProvider<HomeViewModel> homeViewModel;
