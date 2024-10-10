import 'package:flutter/material.dart';

class BusCard extends StatelessWidget {
  final String imageUrl;
  final String departure;
  final String timing;
  final String arrival;
  final String price;
  final String busName;

  const BusCard({
    Key? key,
    required this.imageUrl,
    required this.timing,
    required this.departure,
    required this.arrival,
    required this.price,
    required this.busName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bus Image
            Image.asset(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),

            // Bus name and Timing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  busName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  timing,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Departure
            Row(
              children: [
                Icon(Icons.departure_board, size: 20, color: Colors.green),
                const SizedBox(width: 5),
                Text(
                  'From: $departure',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Arrival
            Row(
              children: [
                Icon(Icons.location_on, size: 20, color: Colors.red),
                const SizedBox(width: 5),
                Text(
                  'To: $arrival',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Booking Button and Price
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action when pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 51, 97, 53),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 8),
                  child: Text('$price ₹',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
