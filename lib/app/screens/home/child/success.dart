import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utilities/theme.dart';

class successWidget extends StatelessWidget {
  const successWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
                child: SizedBox(
              child: Lottie.asset("lottie/success.zip", width: 250),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.popUntil(
                  context, (Route<dynamic> predicate) => predicate.isFirst);
            },
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 14,
                      color: backgoundColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
