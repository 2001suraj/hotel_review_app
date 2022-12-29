import 'package:flutter/material.dart';
import 'package:review_app/presentation/widgets/dot_indicator.dart';

class SliderContainer extends StatefulWidget {
  SliderContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                pageindex = value;
              });
            },
            children: [
              Image.asset(
                'assets/images/slider2.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/slider4.png',
                height: 200,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/slider6.webp',
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Dotindicator(
                        isActive: index == pageindex,
                      ),
                    ))
          ],
        ),
      ],
    );
  }
}
