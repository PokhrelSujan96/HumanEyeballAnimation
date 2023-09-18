import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({super.key});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    final curve = CurvedAnimation(
      parent: _animController,
      curve: const Interval(0.0, 0.8, curve: Curves.linearToEaseOut),
    );

    _animation = Tween<double>(begin: 0, end: -2 * pi).animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 82, 123),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 110.h,
                width: 110.w,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(6, 0),
                      spreadRadius: 1.r,
                      blurRadius: 5.r),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(-4, 4),
                      spreadRadius: 1.r,
                      blurRadius: 5.r)
                ], color: Colors.white, shape: BoxShape.circle),
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    const double cirRadius = 20.0;
                    const double contRadius = 35.0;
                    final double x = cos(_animation.value) * contRadius;
                    final double y = sin(_animation.value) * contRadius;
                    return Center(
                      child: Transform.translate(
                        offset: Offset(x, y),
                        child: Container(
                          width: cirRadius * 2,
                          height: cirRadius * 2,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 25.w,
              ),
              Container(
                height: 110.h,
                width: 110.w,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(6, 0),
                      spreadRadius: 1.r,
                      blurRadius: 5.r),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(-4, 4),
                      spreadRadius: 1.r,
                      blurRadius: 5.r)
                ], color: Colors.white, shape: BoxShape.circle),
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    const double cirRadius = 20.0;
                    const double contRadius = 35.0;
                    final double x = cos(_animation.value) * contRadius;
                    final double y = sin(_animation.value) * contRadius;
                    return Center(
                      child: Transform.translate(
                        offset: Offset(x, y),
                        child: Container(
                          width: cirRadius * 2,
                          height: cirRadius * 2,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }
}
