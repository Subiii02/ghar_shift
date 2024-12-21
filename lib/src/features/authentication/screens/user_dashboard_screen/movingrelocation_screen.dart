

import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class MovingRelocationScreen extends StatelessWidget {
  const MovingRelocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moving/Relocation'),
        backgroundColor: SprimaryBlue,
      ),
      body: const Center(
        child: Text('This is the Moving/Relocation Screen.'),
      ),
    );
  }
}