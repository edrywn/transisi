part of 'employe_bloc.dart';

abstract class EmpEvent extends Equatable {
  const EmpEvent();
  @override
  List<Object> get props => [];
}


class GetEmp extends EmpEvent {
  String? id;
  GetEmp(this.id);
}
