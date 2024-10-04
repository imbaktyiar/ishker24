import 'package:flutter/material.dart';
import 'package:tunduk_analog/recover_password_email.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/tunduk.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                const Text(
                  'ТУНДУК',
                  style: TextStyle(
                    fontFamily: 'CustomFont',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0972C8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Забыли пароль?',
              style: TextStyle(
                fontFamily: 'CustomFont',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0972C8),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Выберите способ восстановления пароля',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Button(
              iconPath: Icon(Icons.sms_failed, color: Color(0xFF0972C8)),
              title: 'Восстановить пароль через СМС',
              onTap: (ispassword) {
                
              },
            ),
            const SizedBox(height: 15),
            Button(
              iconPath: Icon(Icons.email_rounded, color: Color(0xFF0972C8)),
              title: 'Восстановить пароль через почту',
              onTap: ( ispassword) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RecoverPasswordEmail()),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.iconPath,
    this.onTap,
    required this.title,
  });
  final Icon iconPath;
  final void Function(bool isPassword)? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap:()=> onTap!(false),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: Colors.black)),
          child: Row(
            children: [
             iconPath,
              const SizedBox(width: 10),
            
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
