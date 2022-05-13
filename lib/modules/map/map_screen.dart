import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(30.0561,31.2394),
          zoom:6
        ),
      ),
    );
  }
}
