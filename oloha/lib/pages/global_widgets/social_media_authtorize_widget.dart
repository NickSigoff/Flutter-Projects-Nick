import 'package:flutter/material.dart';

class SocialMediaAuthorizeWidget extends StatelessWidget {
  const SocialMediaAuthorizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 20, left: 41, right: 41),
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xfff1f1f5),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const Text(
                    'Or continue with',
                    style: TextStyle(
                      color: Color(0xffb5b5be),
                      fontFamily: 'Gilroy-semibold',
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xfff1f1f5),
                  ),
                ),
              ],
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SocialAuthWidget(
                color: Colors.black,
                child: Icon(
                  Icons.apple,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              SocialAuthWidget(
                color: Color(0xffcf4232),
                child: Text(
                  'G',
                  style: TextStyle(
                    fontFamily: 'Gilroy-semibold',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              SocialAuthWidget(
                color: Color(0xff3c66c3),
                child: Text(
                  'f',
                  style: TextStyle(
                    fontFamily: 'Gilroy-semibold',
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SocialAuthWidget extends StatelessWidget {
  final Color color;
  final Widget child;

  const SocialAuthWidget({Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        height: 52,
        child: child,
      ),
    );
  }
}
