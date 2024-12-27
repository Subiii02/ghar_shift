import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Import the Profile Screen
import '../../../../constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SprimaryBlue,
          title: Text(
            'Menu',
            style: TextStyle(color: SlightGray),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: SlightGray),
            onPressed: () {
              Navigator.pop(context); // Return to the previous screen
            },
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person, color: SprimaryBlue),
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: SprimaryBlue),
              title: Text('Change Password'),
              onTap: () {
                _showChangePasswordDialog(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: SprimaryBlue),
              title: Text('Settings'),
              onTap: () {
                _showSnackbar(context, 'Settings coming soon!');
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_forever, color: Colors.red),
              title: Text('Delete Account'),
              onTap: () {
                _showDeleteAccountDialog(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.orange),
              title: Text('Logout'),
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
        duration: Duration(seconds: 2),
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
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Current Password'),
              ),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'New Password'),
              ),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm New Password'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
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
              child: Text('Save'),
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
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add account deletion logic here
                _showSnackbar(context, 'Account deleted successfully.');
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Delete'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        );
      },
    );
  }

  // Dialog to confirm logout and perform logout action
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Perform Firebase sign-out
                  await FirebaseAuth.instance.signOut();

                  // Navigate to the login screen
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);

                  // Show confirmation snackbar
                  _showSnackbar(context, 'You have been logged out.');
                } catch (e) {
                  // Handle logout errors
                  _showSnackbar(context, 'Logout failed: ${e.toString()}');
                }
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        );
      },
    );
  }
}
