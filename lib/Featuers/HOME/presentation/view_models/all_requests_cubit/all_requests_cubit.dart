import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/all_requests_model.dart';
import '../../../data/repos/home_repo.dart';

part 'all_requests_state.dart';

class AllRequestsCubit extends Cubit<AllRequestsState> {
  AllRequestsCubit(this.homeRepo) : super(AllRequestsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchAllRequests() async {
    emit(AllRequestsLoading());
    var reslut = await homeRepo.fecthAllRequests();
    reslut.fold((failure) {
      emit(AllRequestsFailure(failure.errMessage));
    }, (allRequestsModel) {
      // ignore: avoid_print
      print('we Emit all the Requests that you have  ');

      emit(AllRequestsSuccess(allRequestsModel));
    });
  }

  void reset() {
    emit(AllRequestsInitial());
  }
}
