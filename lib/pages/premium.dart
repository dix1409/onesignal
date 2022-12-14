import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Premium extends StatefulWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                    AssetImage("assets/images/header_default_image2.png"),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Premium Zone",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
