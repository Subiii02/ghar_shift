import 'package:flutter/material.dart';
import 'package:ghar_shift/src/features/authentication/screens/labor_dashboard_screen/menu_laborscreen.dart';
import 'package:ghar_shift/src/features/authentication/screens/labor_dashboard_screen/profile_laborscreen.dart';

class LaborDashboard extends StatelessWidget {
  static const String routeName = '/labor_dashboard';

  const LaborDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E88E5), // Use SprimaryBlue
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuLaborScreen()),
              );

              }, // Handle menu icon press
            ),
            const Text(
              'Labor Dashboard',
              style: TextStyle(
                color: Color(0xFFF8F7F4), // Use Orange for accents
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.grey),
              onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileLaborScreen()),
              );
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
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFFF5F5F5), // SlightGray for background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Color(0xFF1E88E5)), // SprimaryBlue for outline
                ),
              ),
            ),
          ),
          // Banner Section
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E88E5), // SprimaryBlue
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/labor_banner.png',
                  height: 120,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome, Laborer!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Manage Your Tasks with Ease',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Actions Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000), // SSecondaryColor for text
                  ),
                ),
                const SizedBox(height: 10),
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

  const ActionButton({super.key,
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFF9800)), // Use Orange for borders
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFF5F5F5), // SlightGray for background
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath, // Replace with your image assets
              height: 60,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1E88E5), // SprimaryBlue for titles
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(color: Color(0xFF4E4B4B)), // SPrimaryColor for descriptions
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
