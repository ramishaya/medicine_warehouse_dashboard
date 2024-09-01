import 'package:dashboard/Core/errors/failures.dart';
import 'package:dashboard/Core/utils/service_locator.dart';
import 'package:dashboard/Featuers/LOGIN/data/models/csrf_token_model.dart';

import '../../Featuers/LOGIN/data/repos/login_repo_impl.dart';

class GetCsfrToken {
  static String? mytoken = '';
  static Future<String> getCsfrTokenFunction() async {
    var reslut = await getIt.get<LoginRepoImpl>().fecthCSRFToken();

    reslut.fold((failure) {
      return ServerFailure('Error , the web app can not auth to the server');
    }, (csfrtoken) {
      CsrfTokenModel token = csfrtoken;
      mytoken = token.csrfToken;
    });
    return '';
  }
}
