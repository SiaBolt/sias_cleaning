import 'package:flutter/material.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              CustomContainerScroll(
                widthOfText1: 150,
                categoryHeight: categoryHeight,
                imageLink: "assets/images/sale.png",
                text2: "20%",
                text1: "Get\nDiscount's up to  ",
                text3: "Book now !!!",
                colorBackgroundText2: const Color.fromRGBO(255, 166, 43, .8),
                colorBackgroundText1: Colors.indigo.shade300,
              ),
              CustomContainerScroll(
                widthOfText1: 200,
                categoryHeight: categoryHeight,
                imageLink: "assets/images/house.png",
                text1: "Fastest cleaning in 2 hr",
                colorBackgroundText2: const Color.fromRGBO(255, 166, 43, 1),
                colorBackgroundText1: const Color.fromRGBO(138, 201, 38, 1),
              ),
              CustomContainerScroll(
                widthOfText1: 180,
                categoryHeight: categoryHeight,
                imageLink: "assets/images/secure.png",
                text1: "All staff is accredited ",
                text3: "Check certificate",
                colorBackgroundText2: const Color.fromRGBO(104, 101, 120, 1),
                colorBackgroundText1: const Color.fromRGBO(27, 42, 65, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainerScroll extends StatelessWidget {
  const CustomContainerScroll({
    Key? key,
    required this.categoryHeight,
    required this.imageLink,
    required this.text1,
    this.text2,
    this.text3,
    required this.colorBackgroundText2,
    required this.colorBackgroundText1,
    required this.widthOfText1,
  }) : super(key: key);

  final String imageLink;
  final String text1;
  final String? text2;
  final String? text3;
  final double categoryHeight;
  final double widthOfText1;
  final Color colorBackgroundText1;
  final Color colorBackgroundText2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 20),
      height: categoryHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageLink,
            ),
            fit: BoxFit.fitWidth,
          ),
          color: colorBackgroundText1,
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: widthOfText1,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 53, 84, .7),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text1,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text2 != null
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[500],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            text2!,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container(),
                text3 != null
                    ? Container(
                        decoration: BoxDecoration(
                          color: colorBackgroundText2,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            text3!,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
