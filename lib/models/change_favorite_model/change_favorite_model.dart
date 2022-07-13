class ChangeFavoriteModel {
  bool? status;
  String? message;
  Data? data;

  ChangeFavoriteModel({this.status, this.message, this.data});

  ChangeFavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? restaurants;
  String? id;

  Data({this.userId, this.restaurants, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    restaurants = json['Restaurants'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Restaurants'] = this.restaurants;
    data['id'] = this.id;
    return data;
  }
}