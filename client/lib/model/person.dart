part of openapi.api;

class Person {
  
  int id = null;
  
  String name = null;
  Person();

  @override
  String toString() {
    return 'Person[id=$id, name=$name, ]';
  }

  Person.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
          id = json['id'];
    }
    if (json['name'] == null) {
      name = null;
    } else {
          name = json['name'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (name != null)
      json['name'] = name;
    return json;
  }

  static List<Person> listFromJson(List<dynamic> json) {
    return json == null ? new List<Person>() : json.map((value) => new Person.fromJson(value)).toList();
  }

  static Map<String, Person> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Person>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new Person.fromJson(value));
    }
    return map;
  }
}

