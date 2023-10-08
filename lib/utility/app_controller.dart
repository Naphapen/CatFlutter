import 'package:get/get.dart';
import 'package:ielproject/models/token_mode.dart';

class AppController extends GetConnect {
  RxBool redEye = true.obs;
  RxBool rememberMe = false.obs;
  RxList<TokenModel> tokenModels = <TokenModel>[].obs;
  RxInt indexBody = 0.obs;
}
