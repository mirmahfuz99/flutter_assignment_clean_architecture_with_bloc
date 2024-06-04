import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/bottom_nav/widgets/bottom_nav_custom_painter.dart';
import 'package:flutter_assignment/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_assignment/utils/images.dart';

import '../home/presentation/pages/home_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNavScreen> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomePage(),
    const Center(child: Text('Category', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Cart', style: TextStyle(fontSize: 24))),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: SizedBox(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BottomNavCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [Color(0xffFF679B), Color(0xffFF7B51)])
                  ),
                  child: Image.asset(Images.search, scale: 3,),
                ),
                onPressed: () {},
              )
            ),
            SizedBox(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  iconButton(Images.home, currentIndex, 0),
                  iconButton(Images.category, currentIndex, 1),

                  Container(
                    width: size.width * 0.20,
                  ),

                  iconButton(Images.cart, currentIndex, 2),
                  iconButton(Images.name, currentIndex, 3),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget iconButton(String imagePath, int currentIndex, int index){
    return IconButton(
        icon: Image.asset(
          imagePath,
          scale: 3,
          color: currentIndex == index ? const Color(0xffFF679B) : const Color(0xff6E7FAA),
        ),
        onPressed: () {
          setBottomBarIndex(index);
        });
  }

}


