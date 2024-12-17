import 'package:flutter/material.dart';

class LaborDashboard extends StatelessWidget {
  static const String routeName = '/labor_dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E88E5), // Use SprimaryBlue
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {}, // Handle menu icon press
            ),
            Text(
              'Labor Dashboard',
              style: TextStyle(
                color: Color(0xFFFF9800), // Use Orange for accents
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.grey),
              onPressed: () {
                // Navigate to labor profile screen
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
                filled: true,
                fillColor: Color(0xFFF5F5F5), // SlightGray for background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Color(0xFF1E88E5)), // SprimaryBlue for outline
                ),
              ),
            ),
          ),
          // Banner Section
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF1E88E5), // SprimaryBlue
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/labor_banner.png', // Replace with your banner image
                  height: 120,
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome, Laborer!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  'Manage Your Tasks with Ease',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Actions Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Actions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000), // SSecondaryColor for text
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Availability Button
                    ActionButton(
                      title: 'Availability',
                      description: 'Set your availability for jobs.',
                      imagePath: 'assets/availability.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/labor_availability');
                      },
                    ),
                    // Tasks to Do Button
                    ActionButton(
                      title: 'Tasks To Do',
                      description: 'View and manage your assigned tasks.',
                      imagePath: 'assets/tasks.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/labor_tasks');
                      },
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

class ActionButton extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  const ActionButton({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFFF9800)), // Use Orange for borders
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFF5F5F5), // SlightGray for background
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
                color: Color(0xFF1E88E5), // SprimaryBlue for titles
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(color: Color(0xFF4E4B4B)), // SPrimaryColor for descriptions
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
