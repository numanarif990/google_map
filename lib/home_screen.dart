import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(33.21556000, 73.75144000),
  zoom: 10.4746
  );

 final List<Marker> _marker = [];
 final List<Marker> _list = [
    const Marker(
        markerId: MarkerId('1'),
    position: LatLng(33.21556000, 73.75144000),
    infoWindow: InfoWindow(
      title: 'My current location'
    )
    ),
   const Marker(
       markerId: MarkerId('2'),
       position: LatLng(33.723300,  74.0435),
       infoWindow: InfoWindow(
           title: 'My doosri position'
       )
   ),
   const Marker(
       markerId: MarkerId('3'),
       position: LatLng(33.3300,  73.0435),
       infoWindow: InfoWindow(
           title: 'My teesri position'
       )
   ),
   const Marker(
       markerId: MarkerId('4'),
       position: LatLng(32.723300,  12.0435),
       infoWindow: InfoWindow(
           title: 'My chothi position'
       )
   ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            const CameraPosition(target: LatLng(32.723300,  12.0435))
          ));
          setState(() {

          });
        },
        child: const Icon(CupertinoIcons.location),
      ),
    );
  }
}
