import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String greeting;
  final String subtext;

  const HeaderComponent({
    Key? key,
    this.greeting = 'Hello kavya !!',
    this.subtext = "Let's get started with content creation",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(30, 48, 30, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtext,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                child: Image.network(
                  'https://dashboard.codeparrot.ai/api/image/Z-eZqnn5m-GBkO9V/vuesax-b-8.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                top: 3,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFC107),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

