import 'package:transisi/data/model/auth_model.dart';
import 'package:transisi/data/model/employe_model.dart';
import 'package:transisi/data/service/employe_service.dart';

class EmployeRepository {
  final employeService = EmployeService();

  Future<EmployeModel> getEmploye(String? page) {
    return employeService.getEmployes(page);
  }

  Future<ItemModel> employe(String? id) {
    return employeService.getEmploye(id);
  }

  Future<CreteEmployeModel> createEmploye(String? name, String? job) {
    return employeService.creteEmploye(name, job);
  }
}
