part of 'add_medicine_cubit.dart';

abstract class AddMedicineState extends Equatable {
  const AddMedicineState();

  @override
  List<Object> get props => [];
}

class AddMedicineInitial extends AddMedicineState {}

class AddMedicineLoading extends AddMedicineState {}

class AddMedicineFailure extends AddMedicineState {
  final String errMessage;

  const AddMedicineFailure(this.errMessage);
}

class AddMedicineSuccess extends AddMedicineState {
  final AddMedicineModel info;

  const AddMedicineSuccess(this.info);
}
