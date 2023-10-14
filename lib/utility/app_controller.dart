import 'package:get/get.dart';
import 'package:ielproject/models/data_model.dart';
import 'package:ielproject/models/token_mode.dart';

class AppController extends GetConnect {
  RxBool redEye = true.obs;
  RxBool rememberMe = false.obs;
  RxList<TokenModel> tokenModels = <TokenModel>[].obs;
  RxInt indexBody = 0.obs;
  RxList<DataModel> dataModels = <DataModel>[].obs;
  RxBool load = true.obs;
}
