import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: SFormHeight -10 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: SEmail,
                  hintText: SEmail,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox( height: SFormHeight -20),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: SPassword,
                  hintText: SPassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
              ),
              const SizedBox(height: SFormHeight -20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){},
                    child: Text(SForgetPassword)),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text(SLogin.toUpperCase())),
              )
            ],
          ),
        ));
  }
}