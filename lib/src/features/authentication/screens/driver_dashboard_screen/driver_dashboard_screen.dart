import 'package:flutter/material.dart';

class DriverDashboard extends StatelessWidget {
  static const String routeName = '/driver_dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E88E5),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
            Text(
              'Driver Dashboard',
              style: TextStyle(
                color: Color(0xFFFF9800),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {

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
                  borderSide: BorderSide(color: Color(0xFF1E88E5)), // SprimaryBlue
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
                  'assets/driver_banner.png', // Replace with your banner image
                  height: 120,
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome, Driver!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  'Efficiently Manage Your Jobs',
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
                    // Assigned Jobs Button
                    ActionButton(
                      title: 'Assigned Jobs',
                      description: 'View and manage your assigned jobs.',
                      imagePath: 'assets/jobs.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/driver_jobs');
                      },
                    ),
                    // Earnings Button
                    ActionButton(
                      title: 'Earnings',
                      description: 'Track your earnings and payouts.',
                      imagePath: 'assets/earnings.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/driver_earnings');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Availability Button
                    ActionButton(
                      title: 'Availability',
                      description: 'Set your availability for new jobs.',
                      imagePath: 'assets/availability.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/driver_availability');
                      },
                    ),
                    // Navigation Button
                    ActionButton(
                      title: 'Navigation',
                      description: 'Access routes and real-time navigation.',
                      imagePath: 'assets/navigation.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/driver_navigation');
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
          border: Border.all(color: Color(0xFFFF9800)), // Orange for borders
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFF5F5F5), // SlightGray for background
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
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
