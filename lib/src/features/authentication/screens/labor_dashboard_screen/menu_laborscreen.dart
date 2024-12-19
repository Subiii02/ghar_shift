import 'package:flutter/material.dart';
import 'package:ghar_shift/src/features/authentication/screens/labor_dashboard_screen/profile_laborscreen.dart';
import '../../../../constants/colors.dart';

class MenuLaborScreen extends StatelessWidget {
  const MenuLaborScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SprimaryBlue,
          title: const Text(
            'Menu',
            style: TextStyle(color: SlightGray),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: SlightGray),
            onPressed: () {
              Navigator.pop(context); // Return to the previous screen
            },
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: SprimaryBlue),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileLaborScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: SprimaryBlue),
              title: const Text('Change Password'),
              onTap: () {
                _showChangePasswordDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_money, color: SprimaryBlue),
              title: const Text('Track Your Earnings'),
              onTap: () {
                _showSnackbar(context, 'Earnings tracking coming soon!');
                // You can navigate to the Earnings screen here
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: SprimaryBlue),
              title: const Text('Settings'),
              onTap: () {
                _showSnackbar(context, 'Settings coming soon!');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text('Delete Account'),
              onTap: () {
                _showDeleteAccountDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.orange),
              title: const Text('Logout'),
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to show snackbar messages
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Dialog to handle password change
  void _showChangePasswordDialog(BuildContext context) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Current Password'),
              ),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'New Password'),
              ),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Confirm New Password'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate passwords
                if (currentPasswordController.text.isEmpty ||
                    newPasswordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  _showSnackbar(context, 'All fields are required.');
                } else if (newPasswordController.text != confirmPasswordController.text) {
                  _showSnackbar(context, 'New passwords do not match.');
                } else {
                  _showSnackbar(context, 'Password changed successfully!');
                  Navigator.pop(context); // Close the dialog
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Dialog to confirm account deletion
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add account deletion logic here
                _showSnackbar(context, 'Account deleted successfully.');
                Navigator.pop(context); // Close the dialog
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Dialog to confirm logout
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _showSnackbar(context, 'You have been logged out.');
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
