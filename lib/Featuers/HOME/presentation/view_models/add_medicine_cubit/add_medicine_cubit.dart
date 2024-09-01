import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/add_medicine_model.dart';
import '../../../data/repos/home_repo.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit(this.homeRepo) : super(AddMedicineInitial());
  final HomeRepo homeRepo;

  Future<void> addMedicine({
    required String scientificName,
    required String commercialName,
    required String cat,
    required String manufacturer,
    required String quantity,
    required String expireDate,
    required String princ,
  }) async {
    emit(AddMedicineLoading());
    var reslut = await homeRepo.addMedicine(
      scientificName: scientificName,
      commercialName: commercialName,
      cat: cat,
      manufacturer: manufacturer,
      quantity: quantity,
      expireDate: expireDate,
      princ: princ,
    );
    reslut.fold((failure) {
      emit(AddMedicineFailure(failure.errMessage));
    }, (addMedicineModel) {
      print('we add medicne in the cubit');
      print(addMedicineModel.message);
      emit(AddMedicineSuccess(addMedicineModel));
    });
  }

  void reset() {
    emit(AddMedicineInitial());
  }
}
