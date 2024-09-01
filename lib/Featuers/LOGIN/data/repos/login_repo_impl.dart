import 'package:dashboard/Core/utils/api_service.dart';
import 'package:dashboard/Featuers/LOGIN/data/models/csrf_token_model.dart';
import 'package:dashboard/Core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dashboard/Featuers/LOGIN/data/models/login_model.dart';
import 'package:dashboard/Featuers/LOGIN/data/repos/login_repo.dart';
import 'package:dio/dio.dart';

import '../../../../Core/utils/shared_preferences.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;
  const LoginRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, CsrfTokenModel>> fecthCSRFToken() async {
    try {
      var data = await apiService.get(endpoint: 'get-token');

      CsrfTokenModel response = CsrfTokenModel.fromJson(data);

      if (response.status == true) {
        // ignore: avoid_print
        print('we got the CSRF TOKEN');
        // ignore: avoid_print
        print(response.csrfToken);
        SharedPref.saveData(key: 'csfrtoken', value: response.csrfToken);
        return Right(response);
      } else {
        return Left(ServerFailure('error in fetching the CSRF TOKEN'));
      }
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print("error in Fetching fetching CSRF Token repository");
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LoginModel>> loginUserInfo(
      {required String userName,
      required String password,
      required String? csfrToken}) async {
    try {
      var data = await apiService.post(endpoint: 'login', data: {
        '_token': SharedPref.getData(key: 'csfrtoken'),
        'username': userName,
        'password': password,
      });
      LoginModel loginResponse = LoginModel.fromJson(data);

      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print

        print("error in login repository");
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
