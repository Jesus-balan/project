// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'home_screen.dart'; // Ensure you import the HomeScreen

// class AccountScreen extends StatelessWidget {
//   const AccountScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 78, 119, 79),
//         leading: IconButton(
//           onPressed: () {
//             Get.offAll(HomeScreen()); // Ensure HomeScreen is defined and imported
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//         ),
//         title: const Text(
//           'Profile',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Center(
//                       child: CircleAvatar(
//                         radius: 70,
//                         backgroundImage: NetworkImage(
//                             'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg'),
//                       ),
//                     ),
//                     Positioned(
//                       right: 120, // Adjust this value to position the camera icon properly
//                       bottom: 0,  // Positioning it at the bottom of the CircleAvatar
//                       child: CircleAvatar(
//                         backgroundColor: Colors.grey.shade300, // Circle background color for the icon
//                         radius: 25, // Camera icon circle radius
//                         child: IconButton(
//                           onPressed: () {
//                             // Camera icon action
//                           },
//                           icon: Icon(
//                             Icons.camera_alt,
//                             color: Colors.black, // Camera icon color
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//                 Container(
//                   height: 5,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.red,
//                         Colors.orange,
//                         Colors.blue,
//                         Colors.green,
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 buildCard(Icons.verified_user, "My Account", Icons.arrow_right, Colors.blue),
//                 const SizedBox(height: 15),
//                 buildCard(Icons.notifications, "Notification", Icons.arrow_right, Colors.red),
//                 const SizedBox(height: 15),
//                 buildCard(Icons.settings, "Settings", Icons.arrow_right, Colors.green),
//                 const SizedBox(height: 15),
//                 buildCard(Icons.help_center, "Help Center", Icons.arrow_right, Colors.purple),
//                 const SizedBox(height: 15),
//                 buildCard(Icons.logout, "Log Out", Icons.arrow_right, Colors.black),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Card buildCard(IconData firstIcon, String detail, IconData lastIcon, Color iconColor) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(
//               firstIcon,
//               size: 30,
//               color: iconColor,
//             ),
//             Text(
//               detail,
//               style: const TextStyle(
//                 fontSize: 22,
//                 color: Colors.black87,
//               ),
//             ),
//             const Icon(
//               Icons.arrow_forward_ios,
//               size: 25,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
