import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';


class ConvertLatlangToAddress extends StatefulWidget {
  const ConvertLatlangToAddress({super.key});
  @override
  State<ConvertLatlangToAddress> createState() => _ConvertLatlangToAddressState();
}
class _ConvertLatlangToAddressState extends State<ConvertLatlangToAddress> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Address conversion"),
      ),
      body: GestureDetector(
        onTap: () async {
          // List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);

          final coordinates = new Coordinates(33.21556000, 73.75144000);
          var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
          var first = address.first;
          print("address : " +first.addressLine.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text("Convert",style: TextStyle(
                      fontSize: 30,
                      color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
