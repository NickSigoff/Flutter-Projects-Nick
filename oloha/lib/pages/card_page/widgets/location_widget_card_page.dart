import 'package:flutter/material.dart';

class LocationWidgetCardPage extends StatelessWidget {
  const LocationWidgetCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 31.0, horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Gilroy-semibold',
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.design_services,
                        color: Color(0xffb5b5be),
                      ),
                      Text(
                        '1.2 km',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Gilroy-semibold',
                            color: Color(0xff696974)),
                      ),
                    ],
                  )
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 170,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
