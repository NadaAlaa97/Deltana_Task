import 'package:deltana_task/presentation/Authentication/Register/register-screen.dart';
import 'package:deltana_task/presentation/Authentication/login-screen.dart';
import 'package:deltana_task/presentation/OnBoardingScreen/onboarding_screen.dart';
import 'package:deltana_task/utils/my_theme.dart';
import 'package:deltana_task/widgets/customTextFormField.dart';
import 'package:deltana_task/widgets/formLabelWidget.dart';
import 'package:deltana_task/widgets/socialContainers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
                    Center(child: Text('إنشاء كلمه مرور لحسابك', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)),
                    SizedBox(height: 7),
                    Center(child: Text('.أنشئ كلمة مرور لحماية حسابك', style: TextStyle(color: Colors.grey,fontSize:19),)),
                    SizedBox(height: 20),
                    FormLabelWidget(label: 'كلمة المرور'),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      isPassword: true,
                      hintText: 'ادخل كلمة المرور هنا',
                      controller: passwordController,
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
                    ),
                    SizedBox(height: 15),
                    FormLabelWidget(label: 'تأكيد كلمة المرور'),
                    SizedBox(height: 8),
                    CustomTextFormField(

                      hintText: 'ادخل تأكيد كلمة المرور هنا',
                      controller: confirmPasswordController,
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'ادخل تأكيد كلمة المرور';
                        }
                        if(text.length < 6){
                          return 'كلمة المرور ضعيفة';
                        }
                        if (text != passwordController.text) {
                          return 'كلمة المرور غير صحيحة';
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: double.infinity,
                      child: FloatingActionButton(onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );                      },
                        backgroundColor: MyTheme.myYellow,
                        child: Text('إنشاء حساب', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Center(child: Text('_____________________    او    _____________________',style: TextStyle(fontSize: 15,color: Colors.grey),)),
                    SizedBox(height: 15,),
                    SocialMediaContainers(text: 'لديك حساب؟',
                      textTwo: 'تسجيل دخول',onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                      },),
                  ],
                ),
                Positioned(
                  top: 30,
                  right: 10,
                  child: InkWell(
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
  void Register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        print('registered success');
        print(credential.user?.uid??'');

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

}

