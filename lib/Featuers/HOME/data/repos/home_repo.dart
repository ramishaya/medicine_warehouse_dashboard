import 'package:dartz/dartz.dart';
import 'package:dashboard/Featuers/HOME/data/models/add_medicine_model.dart';
import 'package:dashboard/Featuers/HOME/data/models/change_state_model.dart';

import '../../../../Core/errors/failures.dart';
import '../models/all_requests_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Requests>?>> fecthAllRequests();
  Future<Either<Failure, AddMedicineModel>> addMedicine({
    required String scientificName,
    required String commercialName,
    required String cat,
    required String manufacturer,
    required String quantity,
    required String expireDate,
    required String princ,
  });

  Future<Either<Failure, ChanngeStateModel>> changeState({
    required String id,
    required String paymentState,
    required String receiveState,
  });
}
