import 'package:start_up_mobile/core/service/service_modules/app_service.dart';
import 'package:start_up_mobile/core/service/service_modules/repository_service.dart';
import 'package:start_up_mobile/core/service/service_modules/util_service.dart';
import 'package:start_up_mobile/core/service/service_modules/view_model_service.dart';

Future<void> setupServices() async {
  await Future.wait(
    [
      appService(),
      repositoryService(),
      utilService(),
      viewModelService(),
    ],
    eagerError: true,
  );
}
