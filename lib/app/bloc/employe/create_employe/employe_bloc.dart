import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi/app/bloc/employe/get_employes/employes_bloc.dart';
import 'package:transisi/data/repository/auth_repository.dart';
import 'package:transisi/data/repository/employe_repository.dart';

import '../../../../data/model/employe_model.dart';

part 'employe_state.dart';
part 'employe_event.dart';

class CreteEmployeBloc extends Bloc<CreateEmployeEvent, CreateEmployeState> {
  CreteEmployeBloc() : super(CreateEmployeInitial()) {
    final EmployeRepository employeRepository = EmployeRepository();

    on<GetCreteEmploye>((event, emit) async {
      try {
        emit(CreateEmployeLoading());
        final result =
            await employeRepository.createEmploye(event.name, event.job);
        print(result.name);

        emit(CreateEmployeSuccess(creteEmployeModel: result));
      } on CreateEmployeError {
        emit(CreateEmployeError(err: "Tidak ada internet"));
      }
    });
  }
}
