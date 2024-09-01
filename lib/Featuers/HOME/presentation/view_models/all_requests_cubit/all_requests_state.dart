part of 'all_requests_cubit.dart';

abstract class AllRequestsState extends Equatable {
  const AllRequestsState();

  @override
  List<Object> get props => [];
}

class AllRequestsInitial extends AllRequestsState {}

class AllRequestsLoading extends AllRequestsState {}

class AllRequestsFailure extends AllRequestsState {
  final String errMessage;

  const AllRequestsFailure(this.errMessage);
}

class AllRequestsSuccess extends AllRequestsState {
  final List<Requests>? myRequests;

  const AllRequestsSuccess(this.myRequests);
}
