import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({required this.pixels, super.key});

  final double pixels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: pixels >= 400 ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(right: pixels >= 400 ? 0 : 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Me',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Text(
                        'Sed tempus risus metus, eu gravida elit varius sit amet. Morbi eu nisl a quam luctus condimentum. Suspendisse quam leo, ultricies sed tincidunt vitae, porttitor quis erat. Nunc et nunc eget tellus fringilla congue pulvinar condimentum quam. Nunc volutpat quis sapien eget ullamcorper. Nulla ullamcorper maximus odio, sit amet auctor velit tincidunt vel. Integer sit amet feugiat tellus. Etiam pellentesque sed metus consequat posuere. Etiam in purus nulla.',
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                        maxLines: 5,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.1,),
            AnimatedOpacity(
              curve: Curves.ease,
              opacity: pixels >= 400 ? 1 : 0,
              duration: const Duration(milliseconds: 1000),
              child: AnimatedPadding(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 1000),
                padding: EdgeInsets.only(left: pixels >= 400 ? 0 : 50),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                          image: NetworkImage(
                        'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
