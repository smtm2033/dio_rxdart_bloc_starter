import '../model/user_response.dart';
import '../api/user_api_provider.dart';

class UserRepository {
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser() {
    return _apiProvider.getUser();
  }
}
