class AppLoginModel{
      bool status=true;
     late String message;
    late UserData data;

 /* AppLoginModel({
     required this.status,
     required this.message,
     required this.data,
});*/

  AppLoginModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=(json['data']!=null?UserData.fromJson(json['data']):null)!;

  }
}
class UserData{
    String? id;
   late String name;
   late String email;
    String? token;
  /*UserData({
     required this.id,
     required this.name,
     required this.email,
     required this.token
  });*/
UserData.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    token=json['token'];
  }

}