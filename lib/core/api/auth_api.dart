import 'package:first_project/core/api/main_api.dart';
import 'package:first_project/core/model/account_model.dart';

class AuthApi extends MainApi {

  Future<Account> login({
    String email,
    String password
  }) async {
    try {
      final response = await postRequest(
        url: "$host/admin/login",
        body: {
          "email": email,
          "password": password
        }
      );
      return accountFromJson(response);
    } catch (error) {
      throw error;
    }
  }

}