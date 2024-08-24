import 'package:flutter/material.dart';

class RealTimeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RealTimeButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.sync, color: Color.fromARGB(255, 0, 62, 79)),
      label: const Text('Simulate Real-Time Updates'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
