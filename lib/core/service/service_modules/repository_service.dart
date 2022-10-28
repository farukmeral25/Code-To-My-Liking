import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:start_up_mobile/core/util/dio_manager.dart';
import 'package:start_up_mobile/core/util/network_manager/data/network_manager.dart';
import 'package:start_up_mobile/core/util/network_manager/domain/i_network_manager.dart';
import 'package:start_up_mobile/feature/home/data/service/home_service.dart';
import 'package:start_up_mobile/feature/home/domain/service/i_home_service.dart';

Future<void> repositoryService() async {
  networkManager = Provider((ref) => NetworkManager(DioManager.getDio()));
  homeService = Provider((ref) => HomeService(ref));
}

late final Provider<INetworkManager> networkManager;
late final Provider<IHomeService> homeService;
