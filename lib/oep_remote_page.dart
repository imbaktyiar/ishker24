import 'package:flutter/material.dart';

class OepRemotePage extends StatefulWidget {
  const OepRemotePage({super.key});
  
  @override
  _OepRemotePageState createState() => _OepRemotePageState();
}

class RoundedCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const RoundedCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: value
                ? Colors.green
                : Colors.white, 
            borderRadius: BorderRadius.circular(6),
            border: value
                ? Border.all(
                    color: Colors
                        .green, 
                    width: 2,
                  )
                : Border.all(
                    color: Colors.grey
                        .shade600, 
                    width: 2,
                  ),
          ),
          child: value
              ? const Icon(
                  Icons.check,
                  size: 18,
                  color: Colors.white,
                )
              : null),
    );
  }
}

class _OepRemotePageState extends State<OepRemotePage> {
  final TextEditingController _innController = TextEditingController();
  final TextEditingController _idAnController = TextEditingController(); // Контроллер для ID/AN
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isAgreed = false;

  void _submit() {
    if (_isAgreed) {
      print('Форма отправлена');
    } else {
      print('Вы должны согласиться с условиями');
    }
  }

  Widget _buildInputField({
    required String labelText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? prefixText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade600, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              if (prefixText != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    prefixText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: labelText,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    hintStyle: TextStyle(
                      color: Colors.blueGrey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Удаленное получение ОЭП',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _buildInputField(
              labelText: 'ИНН',
              controller: _innController,
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Expanded(
                    child: _buildInputField(
                      labelText: 'ID/AN',
                      controller: _idAnController,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildInputField(
                    labelText: 'Номер паспорта',
                    controller: _passportController,
                  ),
                ),
              ],
            ),
            _buildInputField(
              labelText: 'Номер телефона',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              prefixText: '+996',
            ),
            _buildInputField(
              labelText: 'Адрес электронной почты',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isAgreed = !_isAgreed;
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RoundedCheckbox(
                      value: _isAgreed,
                      onChanged: (value) {
                        setState(() {
                          _isAgreed = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 7),
                  const Expanded(
                    child: Text(
                      'Я соглашаюсь на создание учетной записи в системе ЕСИ и предоставляю необходимую информацию для регистрации.',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF07A60C)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 395),
            GestureDetector(
              onTap: _submit, 
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF07A60C), 
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Далее',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
