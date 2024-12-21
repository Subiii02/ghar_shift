


import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class BookTruckScreen extends StatelessWidget {
  const BookTruckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Truck'),
        backgroundColor: SprimaryBlue,
      ),
      body: const Center(
        child: Text('This is the Book a Truck Screen.'),
      ),
    );
  }
}