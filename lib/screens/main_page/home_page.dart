import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.white, size: 35)),
            const Text(
              "Sia's cleaning",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 35,
                ))
          ],
        ),
        height: 120.0,
        // decoration: BoxDecoration(
        //   color: Colors.indigo,
        //   boxShadow: const [BoxShadow(blurRadius: 40.0)],
        //   borderRadius: BorderRadius.vertical(
        //       bottom:
        //           Radius.elliptical(MediaQuery.of(context).size.width, 50.0)),
        // ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: Colors.white),
      )
    ]);
  }
}
