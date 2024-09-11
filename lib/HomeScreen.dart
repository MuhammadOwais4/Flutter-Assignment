import 'package:flutter/material.dart';

import 'ChatScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double avatarRadius = size.width * 0.075; 

    return Scaffold(
      backgroundColor: const Color(0xff1B202D),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Messages',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 36,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: const Text(
                'R E C E N T',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecentAvatar('Barry', 'assets/images/image1.png',
                      avatarRadius, size.width),
                  _buildRecentAvatar('Perez', 'assets/images/image22.png',
                      avatarRadius, size.width),
                  _buildRecentAvatar('Alvin', 'assets/images/image33.png',
                      avatarRadius, size.width),
                  _buildRecentAvatar('Dan', 'assets/images/image44.png',
                      avatarRadius, size.width),
                  _buildRecentAvatar('Fresh', 'assets/images/image55.png',
                      avatarRadius, size.width),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xff292F3F),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: ListView(
                  children: [
                    _buildChatItem(
                        context,
                        'Danny Hopkins',
                        '08:43',
                        'dannylove@gmail.com',
                        'assets/images/chat111.png',
                        size),
                    _buildChatItem(
                        context,
                        'Bobby LangFod',
                        'Tue',
                        'Will do, suer, thank you',
                        'assets/images/chat222.png',
                        size),
                    _buildChatItem(
                        context,
                        'William Wiles',
                        'Sun',
                        'Uploaded File',
                        'assets/images/chat333.png',
                        size),
                    _buildChatItem(
                        context,
                        'James Edlen',
                        '23 Mar',
                        'Where is another tutorial',
                        'assets/images/chat555.png',
                        size),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentAvatar(
      String name, String imagePath, double avatarRadius, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: Image.asset(imagePath).image,
          ),
          SizedBox(height: avatarRadius * 0.3),
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Quicksand'),
          )
        ],
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, String name, String time,
      String message, String imagePath, Size screenSize) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChatScreen()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05, vertical: screenSize.height * 0.02),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenSize.width * 0.075,
              backgroundImage: Image.asset(imagePath).image,
            ),
            SizedBox(width: screenSize.width * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Quicksand',
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
