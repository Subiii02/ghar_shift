import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: SFormHeight -10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(SFullName),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            SizedBox(height: SFormHeight -20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(SEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: SFormHeight -20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(SPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            SizedBox(height: SFormHeight -20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(SPassword),
                prefixIcon: Icon(Icons.fingerprint_outlined),
              ),
            ),
            const SizedBox(height: SFormHeight -10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {},
                child: Text(SSignup.toUpperCase()),
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}
