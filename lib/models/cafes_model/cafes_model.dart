class CafesModel {
  bool? status;
  String? message;
  List<Data>? data;

  CafesModel({this.status, this.message, this.data});

  CafesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic rate;
  List<String>? pic;
  List<String>? menu;
  String? name;
  String? cuisineType;
  double? lat;
  double? lng;
  String? address;
  String? workTime;
  String? id;

  Data(
      {this.rate,
        this.pic,
        this.menu,
        this.name,
        this.cuisineType,
        this.lat,
        this.lng,
        this.address,
        this.workTime,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    pic = json['pic'].cast<String>();
    menu = json['menu'].cast<String>();
    name = json['name'];
    cuisineType = json['cuisineType'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    workTime = json['workTime'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['pic'] = this.pic;
    data['menu'] = this.menu;
    data['name'] = this.name;
    data['cuisineType'] = this.cuisineType;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    data['workTime'] = this.workTime;
    data['id'] = this.id;
    return data;
  }
}