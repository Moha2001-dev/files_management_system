import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 240, 244, 247),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 370.w,
            child: Image.asset(
                "assets/images/Icon.png",
              width: 322.w,
              height: 322.h,
            ),
          ),
          LoadingAnimationWidget.staggeredDotsWave(
              color: Color.fromARGB(255, 255, 202, 40), size: 200.sp
          )
        ],
      ),
    );
  }
}
