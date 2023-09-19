class Search {
  String? message;
  List<Data>? data;
  int? currentPage;
  int? totalPages;

  Search({this.message, this.data, this.currentPage, this.totalPages});

  Search.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? userId;
  String? gender;
  int? age;
  String? address;
  String? city;
  Location? location;
  int? mobileNumber;
  List<String>? connections;
  String? playerId;
  String? timestamps;
  List<SafeCircles>? safeCircles;
  int? iV;
  String? imageUrl;

  Data(
      {this.sId,
      this.name,
      this.userId,
      this.gender,
      this.age,
      this.address,
      this.city,
      this.location,
      this.mobileNumber,
      this.connections,
      this.playerId,
      this.timestamps,
      this.safeCircles,
      this.iV,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    userId = json['userId'];
    gender = json['gender'];
    age = json['age'];
    address = json['address'];
    city = json['city'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    mobileNumber = json['mobileNumber'];
    connections = json['connections'].cast<String>();
    playerId = json['playerId'];
    timestamps = json['timestamps'];
    if (json['safeCircles'] != null) {
      safeCircles = <SafeCircles>[];
      json['safeCircles'].forEach((v) {
        safeCircles!.add(new SafeCircles.fromJson(v));
      });
    }
    iV = json['__v'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['address'] = this.address;
    data['city'] = this.city;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['mobileNumber'] = this.mobileNumber;
    data['connections'] = this.connections;
    data['playerId'] = this.playerId;
    data['timestamps'] = this.timestamps;
    if (this.safeCircles != null) {
      data['safeCircles'] = this.safeCircles!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class SafeCircles {
  String? safeCircleId;
  String? role;
  String? sId;

  SafeCircles({this.safeCircleId, this.role, this.sId});

  SafeCircles.fromJson(Map<String, dynamic> json) {
    safeCircleId = json['safeCircleId'];
    role = json['role'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['safeCircleId'] = this.safeCircleId;
    data['role'] = this.role;
    data['_id'] = this.sId;
    return data;
  }
}
