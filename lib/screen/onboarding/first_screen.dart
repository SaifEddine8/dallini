import 'package:dallini/constant/const_style.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: .infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
               Text('مرحباً بك في دلني',
               style: ConstStyle.title,
               ),
               Image.asset('assets/images/person_search.png',
               height: size.height/3,
               width: size.width/2,
               ),
              Text('سواء كنت في مدينتك أو تسافر لمكان جديد، ابحث عن المطاعم، المتاجر، وخدمات الصيانة القريبة منك بسهولة',
              textAlign: .end,
              style: ConstStyle.subTitile,
              ),
            
          ],
        ),
      ),
    );
  }
}