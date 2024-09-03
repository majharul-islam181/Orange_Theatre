// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orange_theatre/config/app_url.dart';

class NearbyTheatersScreen extends StatefulWidget {
  @override
  _NearbyTheatersScreenState createState() => _NearbyTheatersScreenState();
}

class _NearbyTheatersScreenState extends State<NearbyTheatersScreen> {
  LocationData? _currentLocation;
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check for permissions
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentLocation = await location.getLocation();
    if (_currentLocation != null) {
      _addCurrentLocationMarker();
      _fetchNearbyTheaters();
    }
  }

  void _addCurrentLocationMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(
            _currentLocation!.latitude!,
            _currentLocation!.longitude!,
          ),
          infoWindow: const InfoWindow(
            title: '(User) Ref: Md. Majharul Islam',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
        ),
      );
    });
  }

  Future<void> _fetchNearbyTheaters() async {
    final lat = _currentLocation?.latitude;
    final lon = _currentLocation?.longitude;
    var url =
        'https://api.foursquare.com/v3/places/search?query=movie%20theater&ll=$lat,$lon&radius=50000&limit=30';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': AppUrl.foursquare_apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final places = data['results'] as List;

      setState(() {
        _markers.addAll(places.map((place) {
          final location = place['geocodes']['main'];
          return Marker(
            markerId: MarkerId(place['fsq_id']),
            position: LatLng(location['latitude'], location['longitude']),
            infoWindow: InfoWindow(
              title: place['name'],
              snippet: place['location']['address'],
            ),
            onTap: () {
             
              _getRouteToMarker(
                LatLng(location['latitude'], location['longitude']),
              );
            },
          );
        }).toSet());
      });
    } else {
      throw Exception('Failed to load nearby movie theaters');
    }
  }

  Future<void> _getRouteToMarker(LatLng destination) async {
    if (_currentLocation != null) {
      final origin =
          '${_currentLocation!.latitude},${_currentLocation!.longitude}';
      final destinationCoords =
          '${destination.latitude},${destination.longitude}';

      final directionsUrl =
          'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destinationCoords&key=${AppUrl.googleMapsApiKey}';

      final response = await http.get(Uri.parse(directionsUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if ((data['routes'] as List).isNotEmpty) {
          final route = data['routes'][0];
          final polylinePoints = route['overview_polyline']['points'];

          _addPolyline(_decodePolyline(polylinePoints));
        }
      } else {
        throw Exception('Failed to load route');
      }
    }
  }
  
  /* I tried for user location to shortest path routes, but it needs payment.

  {
    "error_message": "You must enable Billing on the Google Cloud Project at https://console.cloud.google.com/project/_/billing/enable Learn more at https://developers.google.com/maps/gmp-get-started",
    "routes": [],
    "status": "REQUEST_DENIED"
  }  
  */





  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      polyline.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return polyline;
  }

  void _addPolyline(List<LatLng> points) {
    const polylineId = PolylineId("polyline");

    final polyline = Polyline(
      polylineId: polylineId,
      color: Colors.blue,
      width: 5,
      points: points,
    );

    setState(() {
      _polylines.clear(); // Clear  existing polylines
      _polylines.add(polyline);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nearby Movie Theaters',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
                mapController.animateCamera(
                  CameraUpdate.newLatLngZoom(
                    LatLng(_currentLocation!.latitude!,
                        _currentLocation!.longitude!),
                    14,
                  ),
                );
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 14,
              ),
              markers: _markers,
              polylines: _polylines, // Add the polylines to the map
            ),
    );
  }
}
