import 'package:dallini/constant/const_style.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: .infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
               Text('طريقك أسهل معنا',
               style: ConstStyle.title,
               ),
               Image.asset('assets/images/location.png',
               height: size.height/3,
               width: size.width/2,
               ),
              Text('حدد وجهتك، اعرف المسافة الدقيقة بينك وبين المكان، واحصل على أفضل المسارات للوصول بدون عناء',
              textAlign: .end,
              style: ConstStyle.subTitile,
              ),
            
          ],
        ),
      ),
    );
  }
}