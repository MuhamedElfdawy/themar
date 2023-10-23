import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleAdress extends StatefulWidget {
  const GoogleAdress({super.key});

  @override
  State<GoogleAdress> createState() => _AddAddressState();
}

class _AddAddressState extends State<GoogleAdress> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> markers = {
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(31.0139191, 31.3824398)
    )
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة عنوان'),
          leading: Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            padding: EdgeInsetsDirectional.only(start: 10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.13),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColor,),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 400,
              child: GoogleMap(
                markers: markers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(31.0139191, 31.3824398),
                    zoom: 14,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
             onTap: (argument) {
                  markers.add(Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(argument.latitude, argument.longitude)
                  ),
                  );
                  setState(() {});
             },
              ),
            )
          ],
        ),
      ),
    );
  }
}
