import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants/colors.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;

  // Text editing controllers for user inputs
  final TextEditingController _nameController = TextEditingController(text: 'Subhan');
  final TextEditingController _emailController = TextEditingController(text: 'Subhan@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '+1234567890');
  final TextEditingController _cityController = TextEditingController(text: 'Islammabad');
  final TextEditingController _addressController = TextEditingController(text: '123 Main Street');

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
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SprimaryBlue,
        title: Text('Profile', style: TextStyle(color: SlightGray)),
        iconTheme: IconThemeData(color: SlightGray),
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
                        : AssetImage('assets/default_avatar.png') as ImageProvider,
                  ),
                  if (_isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Profile Information or Editable Fields
            buildInfoRow('Name', _nameController),
            buildInfoRow('Email', _emailController),
            buildInfoRow('Phone', _phoneController),
            buildInfoRow('City', _cityController),
            buildInfoRow('House Address', _addressController),
            SizedBox(height: 20),
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
                style: TextStyle(color: SlightGray),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          if (_isEditing)
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
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
                style: TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
