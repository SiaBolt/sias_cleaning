import 'package:flutter/material.dart';
import 'package:siascleaning/screens/main_page/building_type.dart';
import 'package:siascleaning/screens/main_page/categories.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? function;
  const HomePage({Key? key, this.function}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoriesScroller categoriesScroller = const CategoriesScroller();
  bool closeTopContainer = false;
  double topContainer = 0;
  int activeNum = 0;

  List<Widget> itemsData = [];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: widget.function,
                    icon: const Icon(Icons.person,
                        color: Colors.white, size: 35)),
                const Text(
                  "Home",
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 225,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40), bottom: Radius.circular(20)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 18),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.cleaning_services,
                            color: Colors.green,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 28.0),
                            child: Text(
                              'Sia\'s Cleaning ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "arial"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Need your home, house, or apartment cleaned? Handy will match you with a top-rated house cleaning service professional in \bTashkent ?",
                        style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 18.0, top: 20),
                        child: Text(
                          "Type of builging",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeNum = 0;
                                  });
                                },
                                child: SymptomCard(
                                  iconColors: Colors.blue,
                                  icon: const Icon(
                                    Icons.house_outlined,
                                    color: Colors.blue,
                                  ),
                                  title: "House",
                                  isActive: activeNum == 0 ? true : false,
                                  nonActiveColor: Colors.grey,
                                  activeColor: Colors.blueAccent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeNum = 1;
                                  });
                                },
                                child: SymptomCard(
                                  iconColors: Colors.black,
                                  icon: const Icon(
                                    Icons.location_city,
                                    color: Colors.black,
                                  ),
                                  title: "Flat",
                                  isActive: activeNum == 1 ? true : false,
                                  nonActiveColor: Colors.grey,
                                  activeColor: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeNum = 2;
                                  });
                                },
                                child: SymptomCard(
                                  iconColors: Colors.orange,
                                  icon: const Icon(
                                    Icons.chair,
                                    color: Colors.orange,
                                  ),
                                  title: "Office",
                                  isActive: activeNum == 2 ? true : false,
                                  nonActiveColor: Colors.grey,
                                  activeColor: Colors.orange,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeNum = 3;
                                  });
                                },
                                child: SymptomCard(
                                  iconColors: Colors.green,
                                  icon: const Icon(
                                    Icons.house_siding_sharp,
                                    color: Colors.green,
                                  ),
                                  title: "Garage",
                                  isActive: activeNum == 3 ? true : false,
                                  nonActiveColor: Colors.grey,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeNum = 4;
                                  });
                                },
                                child: SymptomCard(
                                  iconColors: Colors.red,
                                  icon: const Icon(
                                    Icons.car_rental,
                                    color: Colors.red,
                                  ),
                                  title: "Car",
                                  isActive: activeNum == 4 ? true : false,
                                  nonActiveColor: Colors.blueGrey,
                                  activeColor: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: closeTopContainer ? 0 : 1,
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: size.width,
                          alignment: Alignment.topCenter,
                          height: closeTopContainer ? 0 : categoryHeight,
                          child: categoriesScroller),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 9),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Type of Services",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SymptomCard(
                                  backColor: Colors.red,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  iconColors: Colors.white,
                                  icon: const Icon(
                                    Icons.house_siding_sharp,
                                    color: Colors.white,
                                  ),
                                  title: "Basic House Cleaning",
                                  isActive: true,
                                  nonActiveColor: Colors.red,
                                  activeColor: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SymptomCard(
                                  backColor: Colors.green,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  iconColors: Colors.white,
                                  icon: const Icon(
                                    Icons.favorite_outline_sharp,
                                    color: Colors.white,
                                  ),
                                  title: "Deep/Spring Cleaning",
                                  isActive: activeNum == 0 ? true : false,
                                  nonActiveColor: Colors.green,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SymptomCard(
                                  backColor: Colors.blue,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  iconColors: Colors.white,
                                  icon: const Icon(
                                    Icons.local_laundry_service,
                                    color: Colors.white,
                                  ),
                                  title: "Laundry and Ironing Services",
                                  isActive: true,
                                  nonActiveColor: Colors.blue,
                                  activeColor: Colors.blue,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SymptomCard(
                                  backColor: Colors.orange,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  iconColors: Colors.white,
                                  icon: const Icon(
                                    Icons.coronavirus,
                                    color: Colors.white,
                                  ),
                                  title: "Sanitization Services",
                                  isActive: activeNum == 0 ? true : false,
                                  nonActiveColor: Colors.orange,
                                  activeColor: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SymptomCard(
                                  backColor: Colors.pink,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  iconColors: Colors.white,
                                  icon: const Icon(
                                    Icons.window,
                                    color: Colors.white,
                                  ),
                                  title: "Window and Carpet Cleaning",
                                  isActive: true,
                                  nonActiveColor: Colors.pink,
                                  activeColor: Colors.pink,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SymptomCard(
                                  backColor: Colors.brown,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  iconColors: Colors.white,
                                  icon: const Icon(
                                    Icons.coronavirus,
                                    color: Colors.white,
                                  ),
                                  title: "Ceiling / Wall Cleaning",
                                  isActive: activeNum == 0 ? true : false,
                                  nonActiveColor: Colors.brown,
                                  activeColor: Colors.brown,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
