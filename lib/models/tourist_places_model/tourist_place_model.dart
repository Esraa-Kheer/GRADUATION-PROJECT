class TourisPlacetModel {
  bool? status;
  String? message;
  List<Data>? data;

  TourisPlacetModel({this.status, this.message, this.data});

  TourisPlacetModel.fromJson(Map<String, dynamic> json) {
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
  double? rate;
  List<String>? pic;
  String? name;
  String? description;
  String? address;
  String? workTime;
  String? price;
  double? lat;
  double? lng;
  String? id;

  Data(
      {this.rate,
        this.pic,
        this.name,
        this.description,
        this.address,
        this.workTime,
        this.price,
        this.lat,
        this.lng,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    pic = json['pic'].cast<String>();
    name = json['name'];
    description = json['description'];
    address = json['address'];
    workTime = json['workTime'];
    price = json['price'];
    lat = json['lat'];
    lng = json['lng'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['pic'] = this.pic;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['workTime'] = this.workTime;
    data['price'] = this.price;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['id'] = this.id;
    return data;
  }
}