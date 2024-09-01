

import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../models/csrf_token_model.dart';
import '../models/login_model.dart';

abstract class LoginRepo{
    Future <Either<Failure, CsrfTokenModel>> fecthCSRFToken();
     Future<Either<Failure, LoginModel>> loginUserInfo(
      {required String userName, required String password , required String? csfrToken});
}