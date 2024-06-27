class User {
  int? id;
  String? name;
  String? contact;
  String? discription;
  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['contact'] = contact!;
    mapping['discrptions'] = discription!;
    return mapping;
  }
}