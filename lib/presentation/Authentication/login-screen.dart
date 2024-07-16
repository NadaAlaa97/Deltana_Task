import 'package:deltana_task/presentation/Authentication/Register/register-screen.dart';
import 'package:deltana_task/presentation/OnBoardingScreen/onboarding_screen.dart';
import 'package:deltana_task/utils/my_theme.dart';
import 'package:deltana_task/widgets/customTextFormField.dart';
import 'package:deltana_task/widgets/formLabelWidget.dart';
import 'package:deltana_task/widgets/socialContainers.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 70),
                    Center(child: Text('تسجيل دخول', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)),
                    SizedBox(height: 7),
                    Center(child: Text('مرحبا بعودتك! الرجاء إدخال التفاصيل الخاصة بك', style: TextStyle(color: Colors.grey,fontSize:19),)),
                    SizedBox(height: 20),
                    FormLabelWidget(label: 'البريد الالكتروني'),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      hintText: 'ادخل البريد الالكتروني هنا',
                      controller: TextEditingController(),
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'ادخل البريد الالكتروني';
                        }
                        var emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                        if(!emailValid){
                          return 'البريد الالكتروني غير صحيح';
                        }
                        return null;
                      },
                      type: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15),
                    FormLabelWidget(label: 'كلمة المرور'),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      hintText: 'ادخل كلمة المرور هنا',
                      controller: TextEditingController(),
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'ادخل كلمة المرور';
                        }
                        if(text.length < 6){
                          return 'كلمة المرور ضعيفة';
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    SizedBox(height: 15,),
                    Text('نسيت كلمة المرور؟'),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      child: FloatingActionButton(onPressed: (){
                        Login();
                      },
                      backgroundColor: MyTheme.myYellow,
                        child: Text('تسجبل دخول', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Center(child: Text('_____________________    او    _____________________',style: TextStyle(fontSize: 15,color: Colors.grey),)),
                    SizedBox(height: 15,),
                    SocialMediaContainers(text: 'ليس لديك حساب؟',
                      textTwo: 'انشاء حساب',onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                      },),
                  ],
                ),
                Positioned(
                  top: 30,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                      );
                    },
                    child: Text(
                      'تخطي',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: -6,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.black,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void Login() {
    if(formKey.currentState?.validate()== true){

    }
  }

}

