import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizTopBar extends StatelessWidget implements PreferredSizeWidget {
  final int userScore;
  final String firstNameInitial;

  const QuizTopBar({
    super.key,
    required this.userScore,
    required this.firstNameInitial,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // Set preferred size

  @override
  Widget build(BuildContext context) {
    final double horizontalSpace = 12;

    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    firstNameInitial,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Ruben",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/images/gynzy-logo-base.svg',
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "$userScore",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: horizontalSpace),
                SvgPicture.asset(
                  'assets/images/star.svg',
                  height: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
