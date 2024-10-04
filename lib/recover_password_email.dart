import 'package:flutter/material.dart';

class RecoverPasswordEmail extends StatefulWidget {
  const RecoverPasswordEmail({super.key});

  @override
  _RecoverPasswordEmail createState() => _RecoverPasswordEmail();
}

class _RecoverPasswordEmail extends State<RecoverPasswordEmail> {
  final TextEditingController personalNumberController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/tunduk.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
                const Text(
                  'ТУНДУК',
                  style: TextStyle(
                    fontFamily: 'CustomFont',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0972C8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Восстановить пароль через почту',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0972C8),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 7),
                  child: Row(
                    children: [
                      const Icon(Icons.person,color: Colors.blueGrey,),
                      const Text('  |',style: TextStyle(color: Colors.blueGrey),),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: personalNumberController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Персональный номер',
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
                  child: Row(
                    children: [
                      const Icon(Icons.email_rounded, color: Colors.blueGrey,),
                      const SizedBox(width: 10),
                      Text('|',style: TextStyle(color: Colors.blueGrey.shade400),),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Адрес электронной почты',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String personalNumber = personalNumberController.text;
                    String phoneNumber = phoneNumberController.text;
                    print('Персональный номер: $personalNumber');
                    print('Номер телефона: $phoneNumber');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: const Color(0xFF0972C8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Отправить код подтверждения',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), 
          ],
        ),
      ),
    );
  }
}
