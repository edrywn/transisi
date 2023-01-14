part of 'employes_bloc.dart';

abstract class EmployeEvent extends Equatable {
  const EmployeEvent();
  @override
  List<Object> get props => [];
}

class GetEmployeEventList extends EmployeEvent {
  int? page;
  GetEmployeEventList(this.page);
}

class GetScrollEmployeEventList extends EmployeEvent {
  int? page;
  GetScrollEmployeEventList(this.page);
}


