class EmployeModel {
  int? page;
  int? per_page;
  int? total;
  int? total_pages;
  List<ItemEmploye>? itemEmploye;

  EmployeModel(
      {this.page,
      this.per_page,
      this.total,
      this.total_pages,
      this.itemEmploye});
}

class ItemEmploye {
  String? first_name, last_name, avatar, email;
  int? id;

  ItemEmploye(
      {this.id, this.avatar, this.email, this.first_name, this.last_name});
}

class ItemModel {
  String? first_name, last_name, avatar, email;
  int? id;

  ItemModel(
      {this.id, this.avatar, this.email, this.first_name, this.last_name});
}

class CreteEmployeModel {
  String? name, job, id, createdAt;

  CreteEmployeModel({this.id, this.name, this.job, this.createdAt});
}
