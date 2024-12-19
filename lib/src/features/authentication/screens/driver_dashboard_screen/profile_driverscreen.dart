import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants/colors.dart';
import 'dart:io';

class ProfileDriverScreen extends StatefulWidget {
  const ProfileDriverScreen({super.key});

  @override
  _ProfileDriverScreenState createState() => _ProfileDriverScreenState();
}

class _ProfileDriverScreenState extends State<ProfileDriverScreen> {
  File? _profileImage;

  // Text editing controllers for user inputs
  final TextEditingController _nameController = TextEditingController(text: 'Yousaf');
  final TextEditingController _emailController = TextEditingController(text: 'Yousaf@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '+9876543210');
  final TextEditingController _vehicleController = TextEditingController(text: 'Toyota Hilux');
  final TextEditingController _licenseController = TextEditingController(text: 'LIC12345');
  final TextEditingController _cityController = TextEditingController(text: 'Lahore');

  // State variable to toggle between view and edit modes
  bool _isEditing = false;

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Function to display a Snackbar
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SprimaryBlue,
        title: const Text('Driver Profile', style: TextStyle(color: SlightGray)),
        iconTheme: const IconThemeData(color: SlightGray),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/default_avatar.png') as ImageProvider,
                  ),
                  if (_isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _pickImage,
                        child: const CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Profile Information or Editable Fields
            buildInfoRow('Name', _nameController),
            buildInfoRow('Email', _emailController),
            buildInfoRow('Phone', _phoneController),
            buildInfoRow('Vehicle Type', _vehicleController),
            buildInfoRow('License Number', _licenseController),
            buildInfoRow('City', _cityController),
            const SizedBox(height: 20),
            // Toggle Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_isEditing) {
                    // Save changes and show confirmation
                    _showSnackbar('Profile has been updated successfully!');
                  }
                  _isEditing = !_isEditing;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _isEditing ? Colors.green : SprimaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                _isEditing ? 'Save Changes' : 'Edit Profile',
                style: const TextStyle(color: SlightGray),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build user information or editable fields
  Widget buildInfoRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          if (_isEditing)
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter your $label',
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                controller.text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
