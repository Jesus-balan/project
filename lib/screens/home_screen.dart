import 'package:bus/screens/busdetails_screen.dart';
import 'package:bus/screens/search_screen.dart';
import 'package:bus/widgets/bus_card.dart';
import 'package:bus/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Bottom navigation bar
  int _selectedIndex = 0;

  // Method to handle item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to get the current screen based on the selected index
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return _buildBusView(); // Returns the bus view (the current HomeScreen content)
      case 1:
        return const SearchScreen(); // Navigate to Search screen
      // case 2:
      //   return const AccountScreen(); // Navigate to Account screen
      default:
        return _buildBusView(); // Default to Bus view
    }
  }

  // Sample bus data with source and destination
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

  // Function to build the Bus View
  Widget _buildBusView() {
    return SafeArea(
      child: Container(
           decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 154, 224, 121), Color.fromARGB(255, 254, 255, 252)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Menu and Avatar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Bus',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2024/09/24/14/55/ai-generated-9071759_1280.jpg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
        
              // Highlighted Section
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 221, 163),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Travel at your\nConvenience',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 55, 87, 56),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                ),
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/Hotel.png',
                          fit: BoxFit.cover,
                          height: 160,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
        
              // Title and See All section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Moving Today',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        // Implement See All action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BusDetails(busData: busData),
                          ),
                        );
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
        
              // Bus Card Section with Fixed Height
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: SizedBox(
                  height: 380, // Fixed height for the ListView
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 290,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: BusCard(
                              imageUrl: 'assets/images/Ganapathys.png',
                              timing: '6:00 Am',
                              departure: 'Tirunelveli',
                              arrival: 'Kalakkad',
                              price: '20',
                              busName: 'Sri Ganapathy',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: BusCard(
                              imageUrl: 'assets/images/sgking.png',
                              timing: '6:00 Am',
                              departure: 'Kalakkad',
                              arrival: 'Valliyur',
                              price: '25',
                              busName: 'S.G.K.R',
                            ),
                          ),
                        ),
                        SizedBox(
                          
                          width: 320,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: BusCard(
                              imageUrl: 'assets/images/newbus.png',
                              timing: '8:00 Am',
                              departure: 'Tirunelveli',
                              arrival: 'kalakkad',
                              price: '30',
                              busName: 'Goverment Bus',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
             
            ],
          )
              ),
      ));
      
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _getSelectedScreen(), // Change this line to get the correct screen
      // Call the custom BottomNavigationBar widget
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
