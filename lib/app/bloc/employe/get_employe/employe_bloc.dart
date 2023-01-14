import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi/data/model/employe_model.dart';
import 'package:transisi/data/repository/employe_repository.dart';

part 'employe_state.dart';
part 'employe_event.dart';

class EmpBloc extends Bloc<EmpEvent, EmpState> {
  EmpBloc() : super(EmpInitial()) {
    final EmployeRepository empRepository = EmployeRepository();

    on<GetEmp>((event, emit) async {
      try {
        emit(EmpLoading());
        final result = await empRepository.employe(event.id.toString());

        emit(EmpLoaded(
          itemModel: result,
        ));
      } on EmpError {
        emit(const EmpError("Tidak ada internet"));
      }
    });
  }
}
