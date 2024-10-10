import 'package:flutter/material.dart';

class BusDetails extends StatelessWidget {
  // The bus data
  final List<Map<String, dynamic>> busData;

  // Constructor to initialize busData
  BusDetails({required this.busData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Details',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: busData.length,
        itemBuilder: (context, index) {
          // Access each bus detail
          final bus = busData[index];
          
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 8, // Adding elevation for shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.white], // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15), // Ensure corners are rounded
              ),
              child: ListTile(
                leading: Icon(Icons.directions_bus, color: Colors.red, size: 30), // Bus icon color and size
                title: Text(
                  bus['busName'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87, // Title color
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5), // Adding space between title and subtitle
                    Text(
                      'Source: ${bus['source'][0]}',
                      style: TextStyle(color: Colors.black54), // Subtitle color
                    ),
                    Text(
                      'Destination: ${bus['destination'][0]}',
                      style: TextStyle(color: Colors.black54), // Subtitle color
                    ),
                    Text(
                      'Arrival: ${bus['arrival']}',
                      style: TextStyle(color: Colors.black54), // Subtitle color
                    ),
                    SizedBox(height: 10), // Adding space at the bottom
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
