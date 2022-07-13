class HomeModel {
  bool? status;
  String? message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Restaurants>? restaurants;
  List<Cafes>? cafes;
  List<Hotels>? hotels;
  List<TouristPlace>? touristPlace;
  List<Club>? club;

  Data(
      {this.restaurants,
        this.cafes,
        this.hotels,
        this.touristPlace,
        this.club});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['Restaurants'].forEach((v) {
        restaurants!.add(new Restaurants.fromJson(v));
      });
    }
    if (json['Cafes'] != null) {
      cafes = <Cafes>[];
      json['Cafes'].forEach((v) {
        cafes!.add(new Cafes.fromJson(v));
      });
    }
    if (json['Hotels'] != null) {
      hotels = <Hotels>[];
      json['Hotels'].forEach((v) {
        hotels!.add(new Hotels.fromJson(v));
      });
    }
    if (json['TouristPlace'] != null) {
      touristPlace = <TouristPlace>[];
      json['TouristPlace'].forEach((v) {
        touristPlace!.add(new TouristPlace.fromJson(v));
      });
    }
    if (json['club'] != null) {
      club = <Club>[];
      json['club'].forEach((v) {
        club!.add(new Club.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurants != null) {
      data['Restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    if (this.cafes != null) {
      data['Cafes'] = this.cafes!.map((v) => v.toJson()).toList();
    }
    if (this.hotels != null) {
      data['Hotels'] = this.hotels!.map((v) => v.toJson()).toList();
    }
    if (this.touristPlace != null) {
      data['TouristPlace'] = this.touristPlace!.map((v) => v.toJson()).toList();
    }
    if (this.club != null) {
      data['club'] = this.club!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurants {
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
  //City? city;
  //List<Null>? review;
  String? id;

  Restaurants(
      {this.pic,
        this.menu,
        this.inWishList,
        this.name,
        this.address,
        this.rate,
        this.workTime,
        this.cuisineType,
        this.lat,
        this.lng,
        //this.city,
        //this.review,
        this.id});

  Restaurants.fromJson(Map<String, dynamic> json) {
    pic = json['pic'].cast<String>();
    menu = json['menu'].cast<String>();
    inWishList = json['inWishList'];
    name = json['name'];
    address = json['address'];
    rate = json['rate'];
    workTime = json['workTime'];
    cuisineType = json['cuisineType'];
    lat = json['lat'];
    lng = json['lng'];
    //city = json['city'] != null ? new City.fromJson(json['city']) : null;
    /*if (json['review'] != null) {
      review = <Null>[];
      json['review'].forEach((v) {
        review!.add(new Null.fromJson(v));
      });
    }*/
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['menu'] = this.menu;
    data['name'] = this.name;
    data['address'] = this.address;
    data['rate'] = this.rate;
    data['inWishList'] = this.inWishList;
    data['workTime'] = this.workTime;
    data['cuisineType'] = this.cuisineType;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    /*if (this.city != null) {
      data['city'] = this.city!.toJson();
    }*/
    /*if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }*/
    data['id'] = this.id;
    return data;
  }
}

class City {
  String? name;

  City({this.name});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Cafes {
  dynamic rate;
  List<String>? pic;
  List<String>? menu;
  String? name;
  String? cuisineType;
  double? lat;
  double? lng;
  String? address;
  String? workTime;
  //City? city;
  String? id;

  Cafes(
      {this.rate,
        this.pic,
        this.menu,
        this.name,
        this.cuisineType,
        this.lat,
        this.lng,
        this.address,
        this.workTime,
        this.id
      });

  Cafes.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    pic = json['pic'].cast<String>();
    menu = json['menu'].cast<String>();
    name = json['name'];
    cuisineType=json['cuisineType'];
    //city = json['city'] != null ? new City.fromJson(json['city']) : null;
    lat = json['lat'];
    lng = json['lng'];
    address=json['address'];
    workTime=json['workTime'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['menu'] = this.menu;
    data['name'] = this.name;
    data['rate'] = this.rate;
    /*if (this.city != null) {
      data['city'] = this.city!.toJson();
    }*/
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['id'] = this.id;
    return data;
  }
}

class Hotels {
  late dynamic pic;
  String? name;
  String? address;
  int? roomsNumbers;
  String? singlePrice;
  String? doublePrice;
  dynamic rate;
  double? lat;
  double? lng;
  City? city;
  String? id;

  Hotels(
      {this.pic,
        this.name,
        this.address,
        this.roomsNumbers,
        this.singlePrice,
        this.doublePrice,
        this.rate,
        this.lat,
        this.lng,
        this.city,
        this.id});

  Hotels.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    name = json['name'];
    address = json['address'];
    roomsNumbers = json['roomsNumbers'];
    singlePrice = json['singlePrice'];
    doublePrice = json['doublePrice'];
    rate = json['rate'];
    lat = json['lat'];
    lng = json['lng'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['name'] = this.name;
    data['address'] = this.address;
    data['roomsNumbers'] = this.roomsNumbers;
    data['singlePrice'] = this.singlePrice;
    data['doublePrice'] = this.doublePrice;
    data['rate'] = this.rate;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class TouristPlace {
  List<String>? pic;
  String? name;
  String? description;
  String? address;
  String? workTime;
  String? price;
  dynamic rate;
  double? lat;
  double? lng;
  City? city;
  String? id;

  TouristPlace(
      {this.pic,
        this.name,
        this.description,
        this.address,
        this.workTime,
        this.price,
        this.rate,
        this.lat,
        this.lng,
        this.city,
        this.id});

  TouristPlace.fromJson(Map<String, dynamic> json) {
    pic = json['pic'].cast<String>();
    name = json['name'];
    description = json['description'];
    address = json['address'];
    workTime = json['workTime'];
    price = json['price'];
    rate = json['rate'];
    lat = json['lat'];
    lng = json['lng'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['workTime'] = this.workTime;
    data['price'] = this.price;
    data['rate'] = this.rate;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Club {
  List<String>? pic;
  String? name;
  String? address;
  String? workTime;
  String? price;
  dynamic rate;
  double? lat;
  double? lng;
  City? city;
  String? id;

  Club(
      {this.pic,
        this.name,
        this.address,
        this.workTime,
        this.price,
        this.rate,
        this.lat,
        this.lng,
        this.city,
        this.id});

  Club.fromJson(Map<String, dynamic> json) {
    pic = json['pic'].cast<String>();
    name = json['name'];
    address = json['address'];
    workTime = json['workTime'];
    price = json['price'];
    rate = json['rate'];
    lat = json['lat'];
    lng = json['lng'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['name'] = this.name;
    data['address'] = this.address;
    data['workTime'] = this.workTime;
    data['price'] = this.price;
    data['rate'] = this.rate;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}