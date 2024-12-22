import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../../../../constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  String? _profileImageUrl; // URL to load from Firebase Storage

  // Text editing controllers for user inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // State variable to toggle between view and edit modes
  bool _isEditing = false;

  // User ID
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  // Function to load profile data from Firebase
  Future<void> _loadProfileData() async {
    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (userDoc.exists) {
        setState(() {
          _nameController.text = userDoc['name'] ?? '';
          _emailController.text = userDoc['email'] ?? '';
          _phoneController.text = userDoc['phone'] ?? '';
          _cityController.text = userDoc['city'] ?? '';
          _addressController.text = userDoc['address'] ?? '';
          _profileImageUrl = userDoc['profileImage']; // Load image URL
        });
      }
    } catch (e) {
      print('Error loading profile data: $e');
    }
  }

  // Function to save profile data to Firebase
  Future<void> _saveProfileData() async {
    try {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(userId);
      await userDoc.set({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'city': _cityController.text,
        'address': _addressController.text,
        'profileImage': _profileImageUrl ?? '', // Save image URL
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error saving profile data: $e');
    }
  }

  // Function to upload profile image to Firebase Storage
  Future<void> _uploadProfileImage() async {
    try {
      if (_profileImage == null) return;

      final storageRef = FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');
      final uploadTask = storageRef.putFile(_profileImage!);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _profileImageUrl = downloadUrl; // Save URL locally for display
      });
    } catch (e) {
      print('Error uploading profile image: $e');
    }
  }

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      await _uploadProfileImage(); // Upload to Firebase Storage
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
                        ? FileImage(_profileImage!) // If local file is picked
                        : (_profileImageUrl != null && _profileImageUrl!.isNotEmpty
                        ? NetworkImage(_profileImageUrl!) // Load from Firebase
                        : AssetImage('assets/default_avatar.png')) as ImageProvider,
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
              onPressed: () async {
                setState(() {
                  if (_isEditing) {
                    // Save changes and show confirmation
                    _showSnackbar('Profile has been updated successfully!');
                  }
                  _isEditing = !_isEditing;
                });
                if (!_isEditing) {
                  // Save profile data when exiting edit mode
                  await _saveProfileData();
                }
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
