import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  //const MapScreen({Key? key}) : super(key: key);
  late dynamic lng;
  late dynamic lat;
  MapScreen(
       this.lng,
      this.lat,
      );

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var marker=HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.lng,widget.lat,),
          zoom:10
        ),
        onMapCreated: (GoogleMapController googleController){
          setState(() {
            marker.add(Marker(
                markerId: MarkerId('1'),
                position:LatLng(widget.lng,widget.lat,)
            ),);
          });
        },
        markers:marker ,
      ),
    );
  }
}
