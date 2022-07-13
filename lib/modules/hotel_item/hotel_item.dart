import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/modules/map/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelItem extends StatelessWidget {
  //const HotelItem({Key? key}) : super(key: key);
  double? rate;
  List<String>? pic;
  late dynamic name;
  late dynamic address;
  int? roomsNumbers;
  late dynamic singlePrice;
  late dynamic doublePrice;
  late dynamic lat;
  late dynamic lng;
  late dynamic id;

  HotelItem(
      this.pic,
      this.name,
      this.address,
      this.rate,
      this.roomsNumbers,
      this.singlePrice,
      this.doublePrice,
      this.lat,
      this.lng,
      this.id
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: pic!.map((e)  {
                              return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Image(
                                      image: NetworkImage(e),
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              );
                            }).toList()
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                Text(
                                  singlePrice,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                Text(
                                  address,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){
                                      print(id);
                                    },
                                    icon: CircleAvatar(
                                        radius: 25,
                                        backgroundColor:Colors.teal,
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          size: 25,
                                          color: Colors.white,
                                        )
                                    )
                                ),

                                ElevatedButton(
                                    onPressed: (){
                                      showDialog(context: context, builder:(BuildContext context)
                                      {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              Text(
                                                'Scan QR-Code and get offer',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15
                                                ),
                                              ),
                                              Text(
                                                '20% Offer',
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                          content: Image.asset('assets/images/qr.png'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      });
                                    },
                                    child: Text('Get Offer')
                                ),

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.all(1),
                        itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber,),
                        onRatingUpdate: (rating){
                          print(rating);
                        }
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.teal,
                      ),
                      child: IconButton(
                        splashRadius: 200,
                        icon: const Icon(Icons.pin_drop_outlined,color: Colors.white,),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MapScreen(lat,lng)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pic!.map((e)  {
                        return InteractiveViewer(
                          scaleEnabled: false,
                          child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Image(
                                  image: NetworkImage(e),
                                  width: 200,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              )
                          ),
                        );
                      }).toList()
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
