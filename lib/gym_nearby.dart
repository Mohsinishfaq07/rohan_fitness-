import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyLocationsScreen extends StatefulWidget {
  @override
  _NearbyLocationsScreenState createState() => _NearbyLocationsScreenState();
}

class _NearbyLocationsScreenState extends State<NearbyLocationsScreen> {
  Position? currentPosition;
  List<String> nearbyLocations = [];
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
  }

  void checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      await requestLocationPermission();
    } else if (permission == LocationPermission.deniedForever) {
      await openAppSettings();
      return;
    }

    getCurrentLocation();
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      await openAppSettings();
      return;
    }

    getCurrentLocation();
  }

  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  void getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      currentPosition = position;
    });

    findNearbyLocations();
  }

  void findNearbyLocations() {
    setState(() {
      nearbyLocations = [
        'Location A',
        'Location B',
        'Location C',
        'Location D',
        'Location E',
      ];
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _getMarkers() {
    // Generate markers for nearby locations
    return nearbyLocations.map((location) {
      final markerId = MarkerId(location);
      final marker = Marker(
        markerId: markerId,
        position: LatLng(0, 0), // Set the actual latitude and longitude here
        infoWindow: InfoWindow(title: location),
      );
      return marker;
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Locations'),
      ),
      body: Stack(
          children: [
          if (currentPosition != null)
      GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          currentPosition!.latitude,
          currentPosition!.longitude,
        ),
        zoom: 14,
      ),
      markers: _getMarkers(),
    ),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    if (currentPosition != null)
    Text(
    'Current Position: ${currentPosition!.latitude}, ${currentPosition!.longitude}',
      style: TextStyle(fontSize: 18),
    ),
      const SizedBox(height: 16),
      Text(
        'Nearby Locations:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      if (nearbyLocations.isNotEmpty)
        Expanded(
          child: ListView.builder(
            itemCount: nearbyLocations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(nearbyLocations[index]),
                leading: Icon(Icons.location_on),
              );
            },
          ),
        ),
      if (nearbyLocations.isEmpty)
        Text(
          'No nearby locations found.',
          style: TextStyle(fontSize: 16),
        ),
    ],
    ),
    ),
          ],
      ),
    );
  }
}