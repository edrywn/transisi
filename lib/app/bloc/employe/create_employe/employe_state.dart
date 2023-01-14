part of 'employe_bloc.dart';

abstract class CreateEmployeState extends Equatable {
  const CreateEmployeState();
  List<Object> get props => [];
}

class CreateEmployeInitial extends CreateEmployeState {}

class CreateEmployeLoading extends CreateEmployeState {}

class CreateEmployeSuccess extends CreateEmployeState {
  final CreteEmployeModel? creteEmployeModel;
  const CreateEmployeSuccess({this.creteEmployeModel});
}

class CreateEmployeError extends CreateEmployeState {
  String? err;

  CreateEmployeError({this.err});
}
