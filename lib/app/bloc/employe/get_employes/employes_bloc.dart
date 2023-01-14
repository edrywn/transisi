import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi/data/repository/employe_repository.dart';

import '../../../../data/model/employe_model.dart';

part 'employes_state.dart';
part 'employes_event.dart';

class EmployeBloc extends Bloc<EmployeEvent, EmployeState> {
  EmployeBloc() : super(EmployeInitial()) {
    final EmployeRepository employeRepository = EmployeRepository();

    on<GetEmployeEventList>((event, emit) async {
      try {
        emit(EmployeLoading());
        final result =
            await employeRepository.getEmploye(event.page.toString());

        print(result.page);
        print(result.total);
        print(result.itemEmploye!.length);

        emit(result.itemEmploye!.length < result.per_page!
            ? EmployeLoaded(
                itemEmploye: result.itemEmploye!,
                hasReachedMax: true,
              )
            : EmployeLoaded(itemEmploye: result.itemEmploye!));
      } on EmployeError {
        emit(const EmployeError("Tidak ditemukan"));
      }
    });

    on<GetScrollEmployeEventList>((event, emit) async {
      try {
        EmployeLoaded employeLoaded = state as EmployeLoaded;

        final result =
            await employeRepository.getEmploye(event.page.toString());

        emit(result.itemEmploye!.isEmpty
            ? employeLoaded.copyWith(hasReachedMax: true)
            : employeLoaded.copyWith(
                itemEmploye: employeLoaded.itemEmploye + result.itemEmploye!,
              ));
      } on EmployeError {
        emit(const EmployeError("Tidak ada internet"));
      }
    });
   
  }
}
