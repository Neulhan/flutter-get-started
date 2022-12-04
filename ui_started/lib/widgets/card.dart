import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String name, amount, code;
  final IconData icon;
  final bool isInverted;
  final Color _blackColor = const Color(0xFF1F2123);

  const MyCard({
    super.key,
    required this.name,
    required this.amount,
    required this.code,
    required this.icon,
    this.isInverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : _blackColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.elliptical(40, 40),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: isInverted ? _blackColor : Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    code,
                    style: TextStyle(
                      color: isInverted
                          ? _blackColor
                          : Colors.white.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
          Transform.scale(
            scale: 2.2,
            child: Transform.translate(
              offset: const Offset(0, 12),
              child: Icon(
                icon,
                size: 98,
                color: isInverted ? _blackColor : Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
