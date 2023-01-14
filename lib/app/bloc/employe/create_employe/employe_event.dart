part of 'employe_bloc.dart';

abstract class CreateEmployeEvent extends Equatable {
  const CreateEmployeEvent();
  @override
  List<Object> get props => [];
}

class GetCreteEmploye extends CreateEmployeEvent {
  String? name;
  String? job;
  GetCreteEmploye({
    this.name,
    this.job,
  });
}
