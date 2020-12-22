import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/utils/extensions.dart';

import 'list_lesson_by_location.dart';

class ViewListByLocationScreen extends StatefulWidget {
  @override
  State<ViewListByLocationScreen> createState() =>
      ViewListByLocationScreenState();
}

class ViewListByLocationScreenState extends State<ViewListByLocationScreen> {
  GoogleMapController _controller;
  BitmapDescriptor _markerIcon;

  LatLng _currentCameraPosition = LatLng(20.5937, 78.9629);
  Location _location = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("View List By Location"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300.0,
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _currentCameraPosition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: _createMarker(),
            ),
          ),
          Expanded(
            child: ListLessonByLocation(
              courses: [],
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      setState(() {
        _currentCameraPosition = LatLng(l.latitude, l.longitude);
      });
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size.square(48));
      BitmapDescriptor.fromAssetImage(imageConfiguration, 'assets/ic_play.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: _currentCameraPosition,
        icon: _markerIcon,
      ),
    ].toSet();
  }
}
