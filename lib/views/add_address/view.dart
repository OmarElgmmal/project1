import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project1/shared/logic/helper_methods.dart';


class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId(
        "1",
      ),
      position: LatLng(31.0191987, 31.3884559),
    ),
  };
  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  String? myAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "إضافة عنوان",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Container(
          margin: const EdgeInsetsDirectional.all(8),
          padding: const EdgeInsetsDirectional.only(start: 8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xff4C8613).withOpacity(.13),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: GoogleMap(
              circles: {
                Circle(
                  circleId: const CircleId("1"),
                  radius: 1000000,
                  strokeColor: Colors.white,
                  fillColor: Theme.of(context).primaryColor.withOpacity(.2),
                  center: const LatLng(31.0191987, 31.3884559),
                ),
              },
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
              markers: markers,
              onTap: (argument) {
                markers.add(
                  Marker(
                    markerId: const MarkerId(
                      "1",
                    ),
                    position: LatLng(argument.latitude, argument.longitude),
                  ),
                );
                setState(() {});
                print(argument.latitude);
                print(argument.longitude);
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(31.0191987, 31.3884559),
                zoom: 14,
              ),
            ),
          ),
          if(myAddress != null)
          Text(myAddress!),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          goToLocation(
            location: const LatLng(37.43296265331129, -122.08832357078792),
          );
        },
      ),
    );
  }

  Future<void> goToLocation({required LatLng location}) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: 14,
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId(
          "1",
        ),
        position: location,
      ),
    );
    List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude,location.longitude);
    var element = placemarks.first;
    print(element.name);
    print(element.country);
    print(element.administrativeArea);
    print(element.hashCode);
    print(element.isoCountryCode);
    print(element.locality);
    print(element.postalCode);
    print(element.street);
    print(element.subAdministrativeArea);
    print(element.subLocality);
    print(element.subThoroughfare);
    print(element.thoroughfare);
    print("******************************");
    myAddress = "${element.country} / ${element.locality} / ${element.street}";
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    if (!serviceEnabled) {
      showMessage("Location services are disabled.", type: MessageType.warning);
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var myPosition = await Geolocator.getCurrentPosition();
    print("***************************");
    print(myPosition.longitude);
    print(myPosition.latitude);
    goToLocation(
      location: LatLng(myPosition.latitude, myPosition.longitude),
    );
    return myPosition;
  }
}
