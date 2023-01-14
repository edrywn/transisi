part of 'employes_bloc.dart';

abstract class EmployeState extends Equatable {
  const EmployeState();
  List<Object> get props => [];
}

class EmployeInitial extends EmployeState {}

class EmployeLoading extends EmployeState {}

class EmployeLoaded extends EmployeState {
  final List<ItemEmploye> itemEmploye;
  final bool hasReachedMax;
  const EmployeLoaded(
      {this.itemEmploye = const <ItemEmploye>[], this.hasReachedMax = false});

  EmployeLoaded copyWith(
      {List<ItemEmploye>? itemEmploye, bool? hasReachedMax}) {
    return EmployeLoaded(
      itemEmploye: itemEmploye ?? this.itemEmploye,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  List<Object> get props => [itemEmploye, hasReachedMax];
}



class EmployeError extends EmployeState {
  final String? message;
  const EmployeError(this.message);
}
