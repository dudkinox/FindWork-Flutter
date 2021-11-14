import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login_ui/components/alert.dart';
import 'package:permission_handler/permission_handler.dart';

class MapJob extends StatefulWidget {
  @override
  _MapJobState createState() => _MapJobState();
}

class _MapJobState extends State<MapJob> {
  Position userLocation;
  GoogleMapController mapController;

  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  Future<void> getPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if (permission == PermissionStatus.denied) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator = Geolocator();

    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        showDialog(
          context: context,
          builder: (_) => AlertMessage(
              "แจ้งเตือน", "ปฏิเสธการเข้าถึงตำแหน่ง", null),
        );
        break;
      case GeolocationStatus.disabled:
        showDialog(
          context: context,
          builder: (_) => AlertMessage(
              "แจ้งเตือน", "ตำแหน่งถูกปิดอยู่", null),
        );
        break;
      case GeolocationStatus.restricted:
        showDialog(
          context: context,
          builder: (_) => AlertMessage(
              "แจ้งเตือน", "การอนุญาติถูกจำกัด", null),
        );
        break;
      case GeolocationStatus.unknown:
        showDialog(
          context: context,
          builder: (_) => AlertMessage("แจ้งเตือน", "ไม่พบตำแหน่ง", null),
        );
        break;
      case GeolocationStatus.granted:
      showDialog(
          context: context,
          builder: (_) => AlertMessage("แจ้งเตือน", "พบตำแหน่ง", null),
        );
        _getLocation();
    }
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('1'),
            position: LatLng(13.784749, 100.630561),
            infoWindow: InfoWindow(title: "TEXT", snippet: "test"),
            // icon: mapMarker,
            onTap: () {
              setState(() {});
            }),
      );
    });
    mapController = controller;
  }

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      userLocation = null;
    }
    return userLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ค้นหางานใกล้ตัวคุณ"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => {},
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(userLocation.latitude, userLocation.longitude), 18));
            },
            icon: Icon(
              Icons.near_me,
              color: Colors.white,
            ),
            label: Text(
              "ไปยังตำแหน่งของคุณ",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  GoogleMap(
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    markers: _markers,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            userLocation.latitude, userLocation.longitude),
                        zoom: 15),
                    tiltGesturesEnabled: true,
                  ),
                  AnimatedPositioned(
                      child: Text("data"),
                      duration: Duration(milliseconds: 200))
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
