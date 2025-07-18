import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showInfo = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('OpenStreetMap (All Platforms)')),
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: latlng.LatLng(13.7563, 100.5018),
                initialZoom: 10,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: '',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: latlng.LatLng(13.7563, 100.5018),
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showInfo = !_showInfo;
                          });
                        },
                        child: Image.asset(
                          'assets/pin.png',
                          width: 40,
                          height: 40,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (_showInfo)
              Positioned(
                bottom: 40,
                left: 20,
                right: 20,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'ตำแหน่ง GPS อุปกรณ์',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('ละติจูด: 13.7563'),
                        Text('ลองจิจูด: 100.5018'),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
