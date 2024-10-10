import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  List<Map<String, dynamic>> availableBuses = [];
  bool isLoading = false;

  final List<String> places = [
    "Tirunelveli",
    "Kalakkad",
    "Valliyur",
    "Nagercoil",
    "Kaduvetti",
    "Roriri",
  ];

  final List<Map<String, dynamic>> busData = [
    {
      "busName": "Sri Ganapathy",
      "source": ["Tirunelveli", "Roriri"],
      "destination": ["Kalakkad", "Roriri"],
      "arrival": "6:00 AM",
    },
    {
      "busName": "S.G.K.R",
      "source": ["Tirunelveli", "Roriri"],
      "destination": ["Valliyur", "Roriri"],
      "arrival": "6:00 AM",
    },
    {
      "busName": "Goverment Bus",
      "source": ["Kalakkad", "Roriri"],
      "destination": ["Tirunelveli", "Roriri"],
      "arrival": "8:00 AM"
    },
     {
    "busName": "Mini Bus", 
    "source": ["Meenavankulam", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"],  
    "arrival": "8:15 AM"
  },
  {
    "busName": "S.G.K.R", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Tirunelveli", "Roriri"], 
    "arrival": "8:30 AM"
  },
  {
    "busName": "Sri Ganapathy", 
    "source": ["Tirunelveli", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"],  
    "arrival": "8:30 AM"
  },
  {
    "busName": "Mini Bus", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Meenavankulam", "Roriri"], 
    "arrival": "9:15 AM"
  },
  {
    "busName": "Mini Bus", 
    "source": ["Meenavankulam", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "10:15 AM"
  },
  {
    "busName": "Goverment Bus", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Kaduvetti", "Roriri"], 
    "arrival": "10:30 AM"
  },
  {
    "busName": "Goverment Bus", 
    "source": ["Kaduvetti", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "11:20 AM"
  },
    {
    "busName": "Mini Bus", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Meenavankulam", "Roriri"], 
    "arrival": "11:30 AM"
  },
    {
    "busName": "Mini Bus", 
    "source": ["Meenavankulam", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "12:15 PM"
  },
    {
    "busName": "Mini Bus", 
    "source": ["Kalakkad","Roriri"], 
    "destination": ["Meenavankulam", "Roriri"], 
    "arrival": "1:20 PM"
  },
    {
    "busName": "Sri Ganapathy", 
    "source": ["Kalakkad","Roriri"], 
    "destination":["Tirunelveli", "Roriri"],  
    "arrival": "2:00 PM"
  },
      {
    "busName": "Mini Bus", 
    "source": ["Meenavankulam", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "2:15 PM"
  },
    {
    "busName": "Goverment Bus", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Kaduvetti", "Roriri"], 
    "arrival": "2:30 PM"
  },
      {
    "busName": "Goverment Bus", 
    "source": ["Kaduvetti", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "3:25 PM"
  },
     {
    "busName": "Mini Bus", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Meenavankulam", "Roriri"], 
    "arrival": "3:30 PM"
  },
    {
    "busName": "Mini Bus", 
    "source": ["Meenavankulam", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "4:15 PM"
  },
    {
    "busName": "Mini Bus", 
    "source": ["Kalakkad","Roriri"], 
    "destination": ["Meenavankulam", "Roriri"], 
    "arrival": "5:15 PM"
  },
        {
    "busName": "Goverment Bus", 
    "source": ["Tirunelveli", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "5:30 PM"
  },
      {
    "busName": "Mini Bus", 
    "source": ["Meenavankulam", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "5:45 PM"
  },
      {
    "busName": "S.G.K.R", 
    "source": ["Valliyur", "Roriri"], // Use a list here for consistency
    "destination": ["Tirunelveli","Roriri"], 
    "arrival": "5:45 PM"
  },
      {
    "busName": "Sri Ganapathy", 
    "source": ["Tirunelveli","Roriri"], 
    "destination": ["Valliyur", "Roriri"],  
    "arrival": "6:00 PM"
  },
       {
    "busName": "Mini Bus", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Meenavankulam","Roriri"], 
    "arrival": "7:20 PM"
  },
      {
    "busName": "Goverment Bus", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Kaduvetti","Roriri"], 
    "arrival": "7:25 PM"
  },
      {
    "busName": "Goverment Bus", 
    "source": ["Kaduvetti", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "7:45 PM"
  },
        {
    "busName": "Mini Bus", 
    "source": ["Meenavankulam", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "8:15 PM"
  },
      {
    "busName": "S.G.K.R", 
    "source": ["Tirunelveli", "Roriri"], // Use a list here for consistency
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "8:20 PM"
  },
        {
    "busName": "Goverment Bus", 
    "source": ["Kaduvetti", "Roriri"], 
    "destination": ["Kalakkad", "Roriri"], 
    "arrival": "9:00 PM"
  },
         {
    "busName": "Mini Bus", 
    "source": ["Kalakkad", "Roriri"], 
    "destination": ["Meenavankulam", "Roriri"], 
    "arrival": "9:20 PM"
  }
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _searchBus() {
    String source = sourceController.text;
    String destination = destinationController.text;

    if (source.isEmpty || destination.isEmpty) {
      Get.snackbar('Error', 'Please enter both source and destination',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    setState(() {
      isLoading = true;
      availableBuses = busData.where((bus) {
        List<String> sources = List<String>.from(bus['source']);
        List<String> destinations = List<String>.from(bus['destination']);
        return sources.contains(source) && destinations.contains(destination);
      }).toList();
      isLoading = false;
    });
  }

  Future<void> _showPlaceSelector(
      BuildContext context, TextEditingController controller) async {
    String? selectedPlace = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Transparent for a layered effect
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Select Destination',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  itemCount: places.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const Icon(Icons.place, color: Colors.blueAccent),
                      title: Text(
                        places[index],
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.pop(context, places[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (selectedPlace != null) {
      setState(() {
        controller.text = selectedPlace;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 154, 224, 121), Color.fromARGB(255, 254, 255, 252)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Find Your Bus',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Source TextField
                _buildCustomTextField(
                  "Source",
                  Icons.location_on,
                  sourceController,
                  () => _showPlaceSelector(context, sourceController),
                ),
                const SizedBox(height: 20),
                // Destination TextField
                _buildCustomTextField(
                  "Destination",
                  Icons.location_on,
                  destinationController,
                  () => _showPlaceSelector(context, destinationController),
                ),
                const SizedBox(height: 20),
                // Date TextField
                _buildCustomTextField(
                  "Date",
                  Icons.calendar_today_outlined,
                  dateController,
                  () => _selectDate(context),
                ),
                const SizedBox(height: 40),
                // Search Button
                ElevatedButton(
                  onPressed: _searchBus,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("Search Buses",style: TextStyle(color: Colors.green),),
                ),
                const SizedBox(height: 30),
                // Loading Indicator or Bus List
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
  child: ListView.builder(
    itemCount: availableBuses.length,
    itemBuilder: (context, index) {
      final bus = availableBuses[index];
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Colors.white60, Colors.white24],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(4, 4),
            ),
          ],
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Card(
          color: Colors.transparent, // Transparent to show the glass effect
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bus['busName'],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBusInfo(Icons.access_time, 'Arrival', bus['arrival']),
                    _buildBusInfo(Icons.location_on, 'Source', bus['source'][0]),
                    _buildBusInfo(Icons.location_on_outlined, 'Destination', bus['destination'][0]),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  ),
),



              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField(String hint, IconData icon,
      TextEditingController controller, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.greenAccent),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                controller.text.isEmpty ? hint : controller.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.greenAccent),
          ],
        ),
      ),
    );
  }
}

// Helper function to build Bus Info with icons
Widget _buildBusInfo(IconData icon, String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          Icon(icon, color: Colors.black87, size: 20),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Center(
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            
            color: Colors.black54, fontSize: 14),
        ),
      ),
    ],
  );
}