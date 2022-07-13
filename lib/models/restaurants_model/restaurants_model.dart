class RestaurantsModel {
  bool? status;
  String? message;
  List<Data>? data;

  RestaurantsModel({this.status, this.message, this.data});

  RestaurantsModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? pic;
  List<String>? menu;
  late bool? inWishList;
  String? name;
  String? address;
  dynamic rate;
  String? workTime;
  String? cuisineType;
  double? lat;
  double? lng;
  //List<Review>? review;
  //List<Null>? offer;
   String? id;

  Data(
      {this.pic,
        this.menu,
        this.inWishList,
        this.name,
        this.address,
        required this.rate,
        this.workTime,
        this.cuisineType,
        this.lat,
        this.lng,
        //this.review,
        //this.offer,
         this.id});

  Data.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    inWishList = json['inWishList'];
    pic = json['pic'].cast<String>();
    menu = json['menu'].cast<String>();
    name = json['name'];
    address = json['address'];
    workTime = json['workTime'];
    cuisineType = json['cuisineType'];
    lat = json['lat'];
    lng = json['lng'];
    /*if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(new Review.fromJson(v));
      });
    }
    if (json['offer'] != null) {
      offer = <Null>[];
      json['offer'].forEach((v) {
        offer!.add(new Null.fromJson(v));
      });
    }*/
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['inWishList'] = this.inWishList;
    data['pic'] = this.pic;
    data['menu'] = this.menu;
    data['name'] = this.name;
    data['address'] = this.address;
    data['workTime'] = this.workTime;
    data['cuisineType'] = this.cuisineType;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    /*if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }
    if (this.offer != null) {
      data['offer'] = this.offer!.map((v) => v.toJson()).toList();
    }*/
    data['id'] = this.id;
    return data;
  }
}

/*class Review {
  String? sId;
  String? user;
  int? rate;
  String? comment;
  String? name;

  Review({this.sId, this.user, this.rate, this.comment, this.name});

  Review.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    rate = json['rate'];
    comment = json['comment'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['rate'] = this.rate;
    data['comment'] = this.comment;
    data['name'] = this.name;
    return data;
  }
}*/