part of 'employe_bloc.dart';

abstract class EmpState extends Equatable {
  const EmpState();
  List<Object> get props => [];
}

class EmpInitial extends EmpState {}

class EmpLoading extends EmpState {}

class EmpLoaded extends EmpState {
  final ItemModel? itemModel;
  const EmpLoaded({this.itemModel});
}

class EmpError extends EmpState {
  final String? message;
  const EmpError(this.message);
}
