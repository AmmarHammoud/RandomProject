class BookModel {
  late int id;
  late String name;
  late String description;

  BookModel(this.id, this.name, this.description);

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }
}
