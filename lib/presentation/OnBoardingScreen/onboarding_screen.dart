import 'package:deltana_task/presentation/Authentication/Register/register-screen.dart';
import 'package:flutter/material.dart';
import 'package:deltana_task/presentation/Authentication/login-screen.dart';
import 'package:deltana_task/utils/my_theme.dart';

import '../../widgets/dotSlider.dart';
import '../../widgets/onBoardingContent.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              bodyContent(
                'assets/images/onBoard1.png',
                'كل ما تبحث عنه في مكان واحد',
                'استكشف مجموعة ضخمة من المنتجات في كل الفئات الممكنة، من الإلكترونيات إلى الملابس والأدوات المنزلية',
              ),
              bodyContent(
                'assets/images/onBoard2.png',
                'قسط على راحتك',
                'استمتع بتجربة تسوق مريحة مع خيارات تقسيط مرنة تناسب ميزانيتك دون فوائد',
              ),
              bodyContent(
                'assets/images/onBoard3.png',
                'اختر من المنتجات المستعملة بحالة ممتازة',
                'ابحث عن أفضل العروض للمنتجات المستعملة بجودة عالية وأسعار تنافسية موثوقة وبحالة رائعة',
              ),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                'تخطي',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Visibility(
              visible: _currentPage == 0 ? false : true,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
                onPressed: () {
                  _controller.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    dotSlider(_currentPage == i),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                if (_controller.page == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOutCirc,
                  );
                }
              },
              child: Text(_currentPage == 2? 'نبدأ الان' : 'التالي'),
              backgroundColor: MyTheme.myYellow,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }




  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
