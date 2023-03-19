import 'package:delivery_ecommerce/data/repository/auth_repo.dart';
import 'package:delivery_ecommerce/models/response_model.dart';
import 'package:delivery_ecommerce/models/sign_up_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Register new user
  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      // Save token of user in headers and sharedpreferences
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = false;
    update();
    return responseModel;
  }

  // Login user
  Future<ResponseModel> login(String email, String password) async {
    // print('[Getting token]: Success');
    // print(jsonEncode(authRepo.getUserToken().toString()));

    _isLoading = true;
    update();

    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      // print('[Backend Token]');
      // Save token of user in headers and sharedpreferences
      authRepo.saveUserToken(response.body["token"]);
      // print('My token is: ${response.body["token"]}'); //! ONLY FOR TESTING
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = false;
    update();
    return responseModel;
  }

  // Save user number and password
  saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedId();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
