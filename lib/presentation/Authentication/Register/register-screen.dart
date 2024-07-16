import 'package:deltana_task/presentation/Authentication/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:deltana_task/widgets/socialContainers.dart';
import 'package:deltana_task/widgets/Register-widgets/NameFields.dart';
import 'package:deltana_task/widgets/Register-widgets/Next_button.dart';

class RegisterScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Center(
                child: Text(
                  'إنشاء حساب',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  '!أنشئ حسابك الآن واستمتع بميزات حصرية',
                  style: TextStyle(color: Colors.grey, fontSize: 19),
                ),
              ),
              SizedBox(height: 15),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    nameFields(),
                    SizedBox(height: 15),
                    emailField(emailController),
                    SizedBox(height: 15),
                    phoneField(),
                    SizedBox(height: 15),
                    nextButton(context,formKey),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        '_____________________    او    _____________________',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 15),
                    SocialMediaContainers(
                      text: 'لديك حساب؟',
                      textTwo: 'تسجيل دخول ',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
