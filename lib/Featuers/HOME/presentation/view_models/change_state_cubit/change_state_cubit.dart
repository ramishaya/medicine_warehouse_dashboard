import 'package:dashboard/Featuers/HOME/data/models/change_state_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/add_medicine_model.dart';
import '../../../data/repos/home_repo.dart';

part 'change_state_state.dart';

class ChangeStateCubit extends Cubit<ChangeStateState> {
  ChangeStateCubit(this.homeRepo) : super(ChangeStateInitial());
  final HomeRepo homeRepo;

  Future<void> changeState({
    required String id,
    required String paymentState,
    required String receiveState,
    
  }) async {
    emit(ChangeStateLoading());
    var reslut = await homeRepo.changeState(
      id: id,
      paymentState: paymentState,
      receiveState: receiveState
    );
    reslut.fold((failure) {
      emit(ChangeStateFailure(failure.errMessage));
    }, (changeStateModel) {
      print('we change the state  in the cubit');
      print(changeStateModel.message);
      emit(ChangeStateSuccess(changeStateModel));
    });
  }
}
