import 'package:flutter/material.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({required this.pixels, super.key});

  final double pixels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 20),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.green,
                child: Center(
                  child: AnimatedOpacity(
                      opacity: pixels >= 800 ? 1 : 0,
                      duration: const Duration(milliseconds: 1000),
                      child: AnimatedPadding(
                          duration: const Duration(milliseconds: 1000),
                          padding: EdgeInsets.only(left: pixels >= 800 ? 0 : 100),
                          child: Text(
                              'Sed tempus risus metus'))),
                ),
              );
            }),
      ),
    );
  }
}
