import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:tunduk_analog/forgot_password_screen.dart';
import 'oep_remote_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _personalNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _personalNumberError;
  String? _passwordError;
  bool _isPasswordVisible = false;

  void _validateAndSubmit() {
    setState(() {
      _personalNumberError = null;
      _passwordError = null;

      if (_personalNumberController.text.isEmpty &&
          _passwordController.text.isEmpty) {
        _personalNumberError = 'Поле обязательно для заполнения';
        _passwordError = 'Поле обязательно для заполнения';
      } else if (_personalNumberController.text.isEmpty) {
        _personalNumberError = 'Поле обязательно для заполнения';
      } else if (_passwordController.text.isEmpty) {
        _passwordError = 'Поле обязательно для заполнения';
      } else {
        print('Успешный вход');
      }
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/tunduk.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
                height: 80,
              ),
              Text(
                "Тундук",
                style: TextStyle(
                    fontFamily: 'CustomFont',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Color(0xFF0972C8)),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.auth,
                style: TextStyle(
                    fontSize: 28,
                    color: Color(0xFF0972C8),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(height: 8),
              const Text(
                'Через единую систему идентификации',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                        color: _personalNumberError == null
                            ? Colors.grey.shade300
                            : Colors.red),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.blueGrey.shade500,
                          size: 38,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Center(
                          child: Text(
                            '|',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey.shade600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _personalNumberController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.blueGrey.shade500,
                            hintText: 'Персональный номер',
                            hintStyle: TextStyle(
                                color: Colors.blueGrey.shade500,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.error_rounded,
                          color: Colors.blueGrey.shade500,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_personalNumberError != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    _personalNumberError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: _passwordError == null
                              ? Colors.grey.shade300
                              : Colors.red)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.lock,
                          color: Colors.blueGrey.shade500,
                          size: 38,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Center(
                          child: Text(
                            '|',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey.shade600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.blueGrey.shade500,
                            hintText: 'Пароль',
                            hintStyle: TextStyle(
                                color: Colors.blueGrey.shade500,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          obscureText: !_isPasswordVisible,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: IconButton(
                            iconSize: 28,
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.blueGrey.shade500,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              if (_passwordError != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    _passwordError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      'Забыли пароль?',
                      style: TextStyle(color: Color(0xFF0972C8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold),
                    children: [
                      const TextSpan(
                        text:
                            'Нажав на кнопку «Далее», вы соглашаетесь, что прочитали и согласны с ',
                      ),
                      TextSpan(
                        text: 'Пользовательским соглашением',
                        style: const TextStyle(
                          color: Color(0xFF0972C8),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Открыть Пользовательское соглашение");
                          },
                      ),
                      const TextSpan(
                        text: ' и ',
                      ),
                      TextSpan(
                        text: 'Политикой конфиденциальности',
                        style: const TextStyle(
                          color: Color(0xFF0972C8),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Открыть Политику конфиденциальности");
                          },
                      ),
                      const TextSpan(
                        text: '.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  onPressed: _validateAndSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0972C8),
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Далее',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OepRemotePage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side:
                        const BorderSide(color: Color(0xFF0972C8), width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Получить ОЭП',
                      style: TextStyle(fontSize: 20, color: Color(0xFF0972C8)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SwitchLangWidget(nameLang: 'En', onPressed: (){
                      
                    },),
                    SwitchLangWidget(nameLang: 'Кыр',),
                    SwitchLangWidget(nameLang: 'Ru',),
                  
                  ],
                ),
              ),
                SizedBox(width: 10),
            ],
          ),
        ]),
      ),
    );
  }
}

class SwitchLangWidget extends StatelessWidget {
  const SwitchLangWidget({
    super.key,
    required this.nameLang,
    this.onPressed,
  });

  final String nameLang;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        nameLang,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
