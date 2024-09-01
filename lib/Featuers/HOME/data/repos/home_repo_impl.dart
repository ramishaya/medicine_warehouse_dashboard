import 'package:dashboard/Core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dashboard/Core/utils/api_service.dart';
import 'package:dashboard/Core/utils/shared_preferences.dart';
import 'package:dashboard/Featuers/HOME/data/models/add_medicine_model.dart';
import 'package:dashboard/Featuers/HOME/data/models/all_requests_model.dart';
import 'package:dashboard/Featuers/HOME/data/models/change_state_model.dart';
import 'package:dashboard/Featuers/HOME/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  const HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<Requests>?>> fecthAllRequests() async {
    try {
      var data = await apiService.get(endpoint: 'show-reqs');

      AllRequestsModel myresponse = AllRequestsModel.fromJson(data);
      List<Requests>? myRequestsData = myresponse.requests;
      // ignore: avoid_print
      print("we got all the requests in the wharehouse");
      //print(myRequestsData![0].paymentState);
      return Right(myRequestsData);
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print("error in Fetching My Requests Repository");
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AddMedicineModel>> addMedicine({
    required String scientificName,
    required String commercialName,
    required String cat,
    required String manufacturer,
    required String quantity,
    required String expireDate,
    required String princ,
  }) async {
    try {
      var data = await apiService.post(endpoint: 'add-medicine', data: {
        'scientific_name': scientificName,
        'commercial_name': commercialName,
        'cat': cat,
        'manufacturer': manufacturer,
        'quantity': quantity,
        'expire_date': expireDate,
        'price': princ,
        '_token': SharedPref.getData(key: 'csfrtoken')
      });
      AddMedicineModel addMedicineResponse = AddMedicineModel.fromJson(data);
      print('we add the medidce in the repository');
      print(addMedicineResponse.status);
      print(addMedicineResponse.message);

      return Right(addMedicineResponse);
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print

        print("error in add medicine  repository");
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChanngeStateModel>> changeState(
      {required String id,
      required String paymentState,
      required String receiveState}) async {
    try {
      var data = await apiService.post(endpoint: 'change-state', data: {
        '_token': SharedPref.getData(key: 'csfrtoken'),
        "updated": {
          'id': id,
          'payment_state': paymentState,
          'receive_state': receiveState
        }
      });
      ChanngeStateModel changeMedicineResponse =
          ChanngeStateModel.fromJson(data);
      print('we change the requestg state in the repository');
      print(changeMedicineResponse.status);
      print(changeMedicineResponse.message);

      return Right(changeMedicineResponse);
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print

        print("error in change state   repository");
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
