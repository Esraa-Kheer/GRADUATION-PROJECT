class AppLoginModel{
      bool status=true;
     late String message;
    late UserData data;

  AppLoginModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=(json['data']!=null?UserData.fromJson(json['data']):null)!;
  }
}
class UserData {
   //late String id;
   late String name;
   late String email;
   late dynamic token;
   late dynamic id;

UserData.fromJson(Map<String,dynamic> json)
  {
    //id=json['id'];
    name=json['name'];
    email=json['email'];
    token=json['token'];
    id=json['id'];
  }
}