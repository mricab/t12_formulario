class Contact {
  int id;
  String name;
  String lastname;
  String address;
  String phone;
  String dateCreated;

  Contact(
      {this.id,
      this.name,
      this.lastname,
      this.address,
      this.phone,
      this.dateCreated});

  //to be used when inserting a row in the table
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["name"] = name;
    map["lastname"] = name;
    map["address"] = name;
    map["phone"] = name;
    map["date_created"] = dateCreated;
    return map;
  }

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["lastname"] = lastname;
    map["address"] = address;
    map["phone"] = phone;
    map["date_created"] = dateCreated;
    return map;
  }

  // to be used when converting the row into object
  factory Contact.fromMap(Map<String, dynamic> data) => new Contact(
      id: data['id'],
      name: data['name'],
      lastname: data['lastname'],
      address: data['address'],
      phone: data['phone'],
      dateCreated: data['date_created']);
}
