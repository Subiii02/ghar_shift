import 'package:flutter/material.dart';
import 'package:ghar_shift/src/features/authentication/screens/user_dashboard_screen/profile_screen.dart';
import '../../../../constants/colors.dart';
import 'menu_screen.dart';

class UserDashboard extends StatelessWidget {
  static const String routeName = '/user_dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SprimaryBlue, // Primary Blue for app bar
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: SSecondaryColor), // Secondary color for icons
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuScreen()),
                );

              }, // Handle menu icon press
            ),
            Text(
              'Ghar Shift',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.person, color: SSecondaryColor), // Secondary color for icons
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search For Anything...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: SlightGray), // Light gray border
                ),
              ),
            ),
          ),
          // Banner Section
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: SprimaryBlue, // Primary blue background
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/banner.png', // Replace with your banner image
                  height: 120,
                ),
                SizedBox(height: 10),
                Text(
                  'Your Move, Anytime, Anywhere',
                  style: TextStyle(
                    color: SlightGray, // Light gray for text
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  'Smooth Journeys, Effortlessly Arranged',
                  style: TextStyle(color: SlightGray, fontSize: 14), // Light gray for text
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Services Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Services We Provide...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: SPrimaryColor, // Primary color for section title
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Service Card 1
                    ServiceCard(
                      title: 'Moving/Relocation',
                      description: 'Includes transport, mover & packing services.',
                      imagePath: 'assets/moving.png',
                    ),
                    // Service Card 2
                    ServiceCard(
                      title: 'Book a Truck',
                      description: 'Book a vehicle to move small items.',
                      imagePath: 'assets/truck.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const ServiceCard({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath, // Replace with your image assets
            height: 60,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: SprimaryBlue, // Primary blue for text
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(color: SPrimaryColor), // Primary color for description
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
