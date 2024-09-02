// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyTheatersScreen extends StatefulWidget {
  @override
  _NearbyTheatersScreenState createState() => _NearbyTheatersScreenState();
}

class _NearbyTheatersScreenState extends State<NearbyTheatersScreen> {
  LocationData? _currentLocation;
  late GoogleMapController mapController;
  Set<Marker> _markers = {};

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
      _fetchNearbyTheaters();
    }
  }

  Future<void> _fetchNearbyTheaters() async {
    final lat = _currentLocation?.latitude;
    final lon = _currentLocation?.longitude;
    const apiKey = "fsq3me+a6HnvxHLlL9gshuhXKkbueM3waVdw0zLz2JQbi5c=";
    var url =
        'https://api.foursquare.com/v3/places/search?query=movie%20theater&ll=$lat,$lon&radius=5000&limit=10';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final places = data['results'] as List;

      setState(() {
        _markers = places.map((place) {
          final location = place['geocodes']['main'];
          return Marker(
            markerId: MarkerId(place['fsq_id']),
            position: LatLng(location['latitude'], location['longitude']),
            infoWindow: InfoWindow(
              title: place['name'],
              snippet: place['location']['address'],
            ),
          );
        }).toSet();
      });
    } else {
      throw Exception('Failed to load nearby movie theaters');
    }
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
            ),
    );
  }
}
