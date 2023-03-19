import 'package:delivery_ecommerce/data/repository/user_repo.dart';
import 'package:delivery_ecommerce/models/user_model.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/models/response_model.dart';
import 'package:delivery_ecommerce/models/sign_up_body_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool _isLoading = false;
  late UserModel _userModel;

  // Getters
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {

    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    print('[getUserInfo Test]: ${ response.body }');

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body); // WHATS
      _isLoading = true;
      responseModel = ResponseModel(true, "Successfully");
    } else {
      // print('did not get');
      responseModel = ResponseModel(false, response.statusText!);
      print(response.statusText);
    }

    update();

    return responseModel;
  }
}
