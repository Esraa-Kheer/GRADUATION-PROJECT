class CitiesModel {
  late bool status;
  late String message;
   late List<Data> data;

  CitiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
 late String name;
 late String area;
 late String population;
 late double lng;
 late double lat;
 late String aboutTheCity;
 late String id;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    area = json['area'];
    population = json['population'];
    lng = json['lng'];
    lat = json['lat'];
    aboutTheCity = json['aboutTheCity'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['area'] = this.area;
    data['population'] = this.population;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['aboutTheCity'] = this.aboutTheCity;
    data['id'] = this.id;
    return data;
  }
}