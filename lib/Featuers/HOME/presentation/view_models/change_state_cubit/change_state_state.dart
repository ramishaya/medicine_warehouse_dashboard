part of 'change_state_cubit.dart';

abstract class ChangeStateState extends Equatable {
  const ChangeStateState();

  @override
  List<Object> get props => [];
}

class ChangeStateInitial extends ChangeStateState {}

class ChangeStateLoading extends ChangeStateState {}

class ChangeStateFailure extends ChangeStateState {
  final String errMessage;

  const ChangeStateFailure(this.errMessage);
}

class ChangeStateSuccess extends ChangeStateState {
  final ChanngeStateModel info;

  const ChangeStateSuccess(this.info);
}
