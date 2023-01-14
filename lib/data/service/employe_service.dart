import 'dart:convert';

import 'package:transisi/data/model/employe_model.dart';
import 'package:http/http.dart' as http;

class EmployeService {
  Future<EmployeModel> getEmployes(String? page) async {
    Uri uri =
        Uri.parse("https://reqres.in/api/users?").replace(queryParameters: {
      'page': page.toString(),
    });

    var response = await http.get(uri);

    final result = json.decode(response.body);

    var list = result['data'] as List;

    var item = list
        .map<ItemEmploye>(
          (e) => ItemEmploye(
            id: e['id'],
            avatar: e['avatar'],
            first_name: e['first_name'],
            last_name: e['last_name'],
            email: e['email'],
          ),
        )
        .toList();

    return EmployeModel(
        page: result['page'],
        per_page: result['per_page'],
        total: result['total'],
        total_pages: result['total_pages'],
        itemEmploye: item);
  }

  Future<ItemModel> getEmploye(String? id) async {
    Uri uri = Uri.parse("https://reqres.in/api/users/" + id!);

    var response = await http.get(uri);

    final result = json.decode(response.body);

    return ItemModel(
      id: result['data']['id'],
      avatar: result['data']['avatar'],
      first_name: result['data']['first_name'],
      last_name: result['data']['last_name'],
      email: result['data']['email'],
    );
  }

  Future<CreteEmployeModel> creteEmploye(String? name, String? job) async {
    Uri uri = Uri.parse("https://reqres.in/api/users");
    var response = await http.post(
      uri,
      body: {
        'name': name,
        'job': job,
      },
    );

    final result = json.decode(response.body);

    return CreteEmployeModel(
      id: result['id'],
      name: result['name'],
      job: result['job'],
      createdAt: result['createdAt'],
    );
  }
}
