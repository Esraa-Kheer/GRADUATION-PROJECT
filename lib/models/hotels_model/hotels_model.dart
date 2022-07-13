class HotelModel {
  bool? status;
  String? message;
  List<Data>? data;

  HotelModel({this.status, this.message, this.data});

  HotelModel.fromJson(Map<String, dynamic> json) {
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
  String? address;
  int? roomsNumbers;
  String? singlePrice;
  String? doublePrice;
  double? lat;
  double? lng;
  String? id;

  Data(
      {this.rate,
        this.pic,
        this.name,
        this.address,
        this.roomsNumbers,
        this.singlePrice,
        this.doublePrice,
        this.lat,
        this.lng,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    pic = json['pic'].cast<String>();
    name = json['name'];
    address = json['address'];
    roomsNumbers = json['roomsNumbers'];
    singlePrice = json['singlePrice'];
    doublePrice = json['doublePrice'];
    lat = json['lat'];
    lng = json['lng'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['pic'] = this.pic;
    data['name'] = this.name;
    data['address'] = this.address;
    data['roomsNumbers'] = this.roomsNumbers;
    data['singlePrice'] = this.singlePrice;
    data['doublePrice'] = this.doublePrice;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['id'] = this.id;
    return data;
  }
}