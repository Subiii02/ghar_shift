import 'package:flutter/material.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({
    super.key,
    required this.buttonIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final IconData buttonIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade400,
        ),
        child: Row(
          children: [
            Icon(buttonIcon, size: 60.0),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
