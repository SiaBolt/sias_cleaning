import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:siascleaning/data/model/order.dart';
import 'package:siascleaning/data/provider_values.dart';

import 'building_type.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? address = '';
  String? date = '';
  int total = 0;
  String? descriptionOfBuilding = "";
  bool basicHouseCleaning = false;
  bool addedBasic = false;

  bool deepHouseCleaning = false;
  bool addedDeep = false;
  bool laundryYAndIroning = false;
  bool addedLaundry = false;
  bool sanitizationFully = false;
  bool addedSanitization = false;
  bool windowAndCarpetsFully = false;
  bool addedWindow = false;
  bool ceilingAndWallFully = false;
  bool addedCeiling = false;
  bool bathRoomFully = false;
  bool addedBathRoo = false;
  bool kitchenFully = false;
  bool addedKitchen = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderValues>(
      builder: (BuildContext context, provider, Widget? child) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person,
                              color: Colors.white, size: 35)),
                      const Text(
                        "Add Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.question_mark,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  height: 120.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 225,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                          bottom: Radius.circular(20)),
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
                                  Icons.done_outline,
                                  color: Colors.blueAccent,
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 28.0),
                                  child: Text(
                                    'We are glad that you trust in\nour company and we promise \nto make our job ideal !!!',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "arial"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            laundryYAndIroning = false;
                                            sanitizationFully = false;
                                            windowAndCarpetsFully = false;
                                            ceilingAndWallFully = false;
                                            kitchenFully = false;
                                            bathRoomFully = false;
                                            basicHouseCleaning =
                                                !basicHouseCleaning;
                                            deepHouseCleaning = false;
                                            total = 0;

                                            if (basicHouseCleaning == true &&
                                                addedBasic == false &&
                                                addedDeep == false) {
                                              total = 0;
                                              total = total + 100;
                                              addedBasic = true;
                                            } else if (basicHouseCleaning ==
                                                    false &&
                                                addedBasic == true &&
                                                addedDeep == false) {
                                              total = total - 100;
                                              addedBasic = false;
                                            } else if (basicHouseCleaning ==
                                                    false &&
                                                addedBasic == true &&
                                                addedDeep == true) {
                                              total = total - 300;
                                              addedBasic = false;
                                              addedDeep = false;
                                            } else if (basicHouseCleaning ==
                                                    true &&
                                                addedBasic == false &&
                                                addedDeep == true) {
                                              total = total - 100;
                                              addedDeep = false;
                                              addedBasic = true;
                                            }
                                          });
                                        },
                                        child: SymptomCard(
                                          backColor: Colors.red,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          iconColors: Colors.white,
                                          icon: const Icon(
                                            Icons.house_siding_sharp,
                                            color: Colors.white,
                                          ),
                                          title:
                                              "Basic House Cleaning           \$100",
                                          isActive: basicHouseCleaning == true
                                              ? true
                                              : false,
                                          nonActiveColor: Colors.redAccent,
                                          activeColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            laundryYAndIroning = false;
                                            sanitizationFully = false;
                                            windowAndCarpetsFully = false;
                                            ceilingAndWallFully = false;
                                            kitchenFully = false;
                                            bathRoomFully = false;
                                            deepHouseCleaning =
                                                !deepHouseCleaning;
                                            basicHouseCleaning = false;

                                            if (deepHouseCleaning == true &&
                                                addedDeep == false &&
                                                addedBasic == false) {
                                              total = 0;
                                              total = total + 200;
                                              addedDeep = true;
                                            } else if (deepHouseCleaning ==
                                                    false &&
                                                addedDeep == true) {
                                              total = total - 200;
                                              addedDeep = false;
                                            } else if (deepHouseCleaning ==
                                                    true &&
                                                addedBasic == true &&
                                                addedDeep == false) {
                                              total = total + 100;
                                              addedDeep = true;
                                              addedBasic = false;
                                            }
                                          });
                                        },
                                        child: SymptomCard(
                                          backColor: Colors.green,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          iconColors: Colors.white,
                                          icon: const Icon(
                                            Icons.favorite_outline_sharp,
                                            color: Colors.white,
                                          ),
                                          title:
                                              "Deep/Spring Cleaning         \$200",
                                          isActive: deepHouseCleaning == true
                                              ? true
                                              : false,
                                          nonActiveColor: Colors.green,
                                          activeColor: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                const Center(child: Text("Custom choicee")),
                                const Divider(),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          basicHouseCleaning = false;
                                          deepHouseCleaning = false;
                                          if (addedDeep == true) {
                                            total -= 200;
                                            addedDeep = false;
                                          }
                                          if (addedBasic == true) {
                                            total -= 100;
                                            addedBasic = false;
                                          }
                                          laundryYAndIroning =
                                              !laundryYAndIroning;
                                          if (laundryYAndIroning == true &&
                                              addedLaundry == false) {
                                            total += 20;
                                            addedLaundry = true;
                                          } else if (laundryYAndIroning ==
                                                  false &&
                                              addedLaundry == true) {
                                            total -= 20;
                                            addedLaundry = false;
                                          }
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SymptomCard(
                                          backColor: Colors.blue,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          iconColors: Colors.white,
                                          icon: const Icon(
                                            Icons.local_laundry_service,
                                            color: Colors.white,
                                          ),
                                          title:
                                              "Laundry/Ironing Services     \$20",
                                          isActive: laundryYAndIroning == true
                                              ? true
                                              : false,
                                          nonActiveColor: Colors.black,
                                          activeColor: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            basicHouseCleaning = false;
                                            deepHouseCleaning = false;
                                            if (addedDeep == true) {
                                              total -= 200;
                                              addedDeep = false;
                                            }
                                            if (addedBasic == true) {
                                              total -= 100;
                                              addedBasic = false;
                                            }
                                            sanitizationFully =
                                                !sanitizationFully;
                                            if (sanitizationFully == true &&
                                                sanitizationFully == false) {
                                              total += 25;
                                              sanitizationFully = true;
                                            } else if (sanitizationFully ==
                                                    false &&
                                                addedSanitization == true) {
                                              total -= 25;
                                              addedSanitization = false;
                                            }
                                          });
                                        },
                                        child: SymptomCard(
                                          backColor: Colors.orange,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          iconColors: Colors.white,
                                          icon: const Icon(
                                            Icons.coronavirus,
                                            color: Colors.white,
                                          ),
                                          title:
                                              "Sanitization Services         \$25",
                                          isActive: sanitizationFully == true
                                              ? true
                                              : false,
                                          nonActiveColor: Colors.black,
                                          activeColor: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            basicHouseCleaning = false;
                                            deepHouseCleaning = false;
                                            if (addedDeep == true) {
                                              total -= 200;
                                              addedDeep = false;
                                            }
                                            if (addedBasic == true) {
                                              total -= 100;
                                              addedBasic = false;
                                            }
                                            windowAndCarpetsFully =
                                                !windowAndCarpetsFully;
                                            if (windowAndCarpetsFully == true &&
                                                addedWindow == false) {
                                              total += 35;
                                              addedWindow = true;
                                            } else if (windowAndCarpetsFully ==
                                                    false &&
                                                addedWindow == true) {
                                              total -= 35;
                                              addedWindow = false;
                                            }
                                          });
                                        },
                                        child: SymptomCard(
                                          backColor: Colors.pink,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          iconColors: Colors.white,
                                          icon: const Icon(
                                            Icons.window,
                                            color: Colors.white,
                                          ),
                                          title:
                                              "Window and Carpet Cleaning         \$35",
                                          isActive:
                                              windowAndCarpetsFully == true
                                                  ? true
                                                  : false,
                                          nonActiveColor: Colors.pink,
                                          activeColor: Colors.pink,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            basicHouseCleaning = false;
                                            deepHouseCleaning = false;
                                            if (addedDeep == true) {
                                              total -= 200;
                                              addedDeep = false;
                                            }
                                            if (addedBasic == true) {
                                              total -= 100;
                                              addedBasic = false;
                                            }
                                            ceilingAndWallFully =
                                                !ceilingAndWallFully;
                                            if (ceilingAndWallFully == true &&
                                                addedCeiling == false) {
                                              total += 50;
                                              addedCeiling = true;
                                            } else if (ceilingAndWallFully ==
                                                    false &&
                                                addedCeiling == true) {
                                              total -= 50;
                                              addedCeiling = false;
                                            }
                                          });
                                        },
                                        child: SymptomCard(
                                          backColor: Colors.brown,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          iconColors: Colors.white,
                                          icon: const Icon(
                                            Icons.coronavirus,
                                            color: Colors.white,
                                          ),
                                          title:
                                              "Ceiling / Wall Cleaning         \$50",
                                          isActive: ceilingAndWallFully == true
                                              ? true
                                              : false,
                                          nonActiveColor: Colors.brown,
                                          activeColor: Colors.brown,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                const Text("Additional services"),
                                Divider(),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            basicHouseCleaning = false;
                                            deepHouseCleaning = false;
                                            if (addedDeep == true) {
                                              total -= 200;
                                              addedDeep = false;
                                            }
                                            if (addedBasic == true) {
                                              total -= 100;
                                              addedBasic = false;
                                            }
                                            kitchenFully = !kitchenFully;
                                            if (kitchenFully == true &&
                                                addedKitchen == false) {
                                              total += 50;
                                              addedKitchen = true;
                                            } else if (kitchenFully == false &&
                                                addedKitchen == true) {
                                              total -= 50;
                                              addedKitchen = false;
                                            }
                                          });
                                        },
                                        child: SymptomCard(
                                          backColor: Colors.indigo,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          iconColors: Colors.white,
                                          icon: const Icon(
                                            Icons.kitchen,
                                            color: Colors.white,
                                          ),
                                          title:
                                              "Kitchen    full    cleaning       \$50",
                                          isActive: kitchenFully == true
                                              ? true
                                              : false,
                                          nonActiveColor: Colors.black,
                                          activeColor: Colors.indigo,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            basicHouseCleaning = false;
                                            deepHouseCleaning = false;
                                            if (addedDeep == true) {
                                              total -= 200;
                                              addedDeep = false;
                                            }
                                            if (addedBasic == true) {
                                              total -= 100;
                                              addedBasic = false;
                                            }
                                            bathRoomFully = !bathRoomFully;
                                            if (bathRoomFully == true &&
                                                addedBathRoo == false) {
                                              total += 50;
                                              addedBathRoo = true;
                                            } else if (bathRoomFully == false &&
                                                addedBathRoo == true) {
                                              total -= 50;
                                              addedBathRoo = false;
                                            }
                                          });
                                        },
                                        child: SymptomCard(
                                          backColor: Colors.teal,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          iconColors: Colors.white,
                                          icon: const Icon(
                                            Icons.bathtub,
                                            color: Colors.white,
                                          ),
                                          title:
                                              "Bathroom full cleaning        \$50",
                                          isActive: bathRoomFully == true
                                              ? true
                                              : false,
                                          nonActiveColor: Colors.black,
                                          activeColor: Colors.teal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 13),
                            child: component1(
                              hintText: "Address",
                              icon: Icons.location_history,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: component1(
                              hintText: "Date",
                              icon: Icons.calendar_today,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: component1(
                              hintText: "Description of cleaning zone",
                              icon: Icons.info,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total: \$${total} ",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: component2(
                              'Submit',
                              2.58,
                              () async {
                                HapticFeedback.lightImpact();

                                String? content = getContent();
                                Order? order = Order(
                                  content: content,
                                  address: address,
                                  date: date,
                                  descriptionOfBuilding: descriptionOfBuilding,
                                  total: total,
                                  number: provider.loggedInUser?.number,
                                  status: 0,
                                  email: provider.loggedInUser?.email,
                                  username: provider.loggedInUser?.username,
                                  id: provider.loggedInUser?.uid,
                                );

                                await provider.postOrder(order);
                                provider.fetchMyOrders();

                                setState(() {
                                  address = "";
                                  date = "";
                                  content = "";
                                  total = 0;
                                  basicHouseCleaning = false;
                                  addedBasic = false;

                                  deepHouseCleaning = false;
                                  addedDeep = false;
                                  laundryYAndIroning = false;
                                  addedLaundry = false;
                                  sanitizationFully = false;
                                  addedSanitization = false;
                                  windowAndCarpetsFully = false;
                                  addedWindow = false;
                                  ceilingAndWallFully = false;
                                  addedCeiling = false;
                                  bathRoomFully = false;
                                  addedBathRoo = false;
                                  kitchenFully = false;
                                  addedKitchen = false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 300,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  String getContent() {
    String? content = "";
    if (basicHouseCleaning) content = "$content, Basic House Cleaning";
    if (deepHouseCleaning) content = "$content, Deep House Cleaning";
    if (laundryYAndIroning) content = "$content, Laundry And Ironing";
    if (sanitizationFully) content = "$content, Sanitization Fully";
    if (windowAndCarpetsFully) content = "$content, Window and Carpet fully";
    if (ceilingAndWallFully) content = "$content, Ceiling and Wall Cleaning";
    if (kitchenFully) content = "$content, Kitchen Fully";
    if (bathRoomFully) content = "$content, Bath room full cleaning";
    return content;
  }

  Widget component1({
    required IconData icon,
    required String hintText,
  }) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onChanged: (value) => setState(() {
              if (hintText == "Description of cleaning zone") {
                descriptionOfBuilding = value;
              } else if (hintText == "Date") {
                date = value;
              } else if (hintText == "Address") {
                address = value;
              }
            }),
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white,
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
