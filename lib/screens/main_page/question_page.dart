import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:siascleaning/data/model/question.dart';
import 'package:siascleaning/data/provider_values.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({Key? key, this.function}) : super(key: key);
  final VoidCallback? function;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String content = '';
  String topic = '';

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];

  void getPostsData() {
    List<Question>? responseList =
        context.read<ProviderValues>().getQuestions();
    List<Widget> listItems = [];
    responseList?.forEach((post) {
      listItems.add(Container(
          height: 190,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            post.content.toString(),
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                post.username.toString(),
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 10),
                              child: Text(
                                post.topic.toString(),
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            post.answer.toString(),
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderValues>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: RefreshIndicator(
            onRefresh: () => provider.fetchQuestions(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: (widget.function),
                            icon: const Icon(Icons.person,
                                color: Colors.white, size: 35)),
                        const Text(
                          "Questions & Answers",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(18.0),
                                            child: Text(
                                              "Ask a question",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: component1(
                                              hintText: "Your question",
                                              icon: Icons.question_answer,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: component1(
                                              hintText:
                                                  "Your Topic write with #",
                                              icon: Icons.topic,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: component2(
                                              'Register',
                                              2.58,
                                              () async {
                                                HapticFeedback.lightImpact();
                                                Question? question = Question(
                                                  answer:
                                                      "Question is in checking",
                                                  content: content,
                                                  topic: topic,
                                                  email: provider
                                                      .loggedInUser?.email,
                                                  username: provider
                                                      .loggedInUser?.username,
                                                  uid: provider
                                                      .loggedInUser?.uid,
                                                );

                                                await provider
                                                    .postQuestion(question);
                                                provider.fetchQuestions();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 35,
                            ))
                      ],
                    ),
                    height: 120.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 215,
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
                                    Icons.question_answer,
                                    color: Colors.blueAccent,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 28.0),
                                    child: Text(
                                      'Find answer to your question\n or Ask if you have one ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "arial"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                controller: controller,
                                itemCount: itemsData.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  double scale = 1.0;
                                  if (topContainer > 0.5) {
                                    scale = index + 0.5 - topContainer;
                                    if (scale < 0) {
                                      scale = 0;
                                    } else if (scale > 1) {
                                      scale = 1;
                                    }
                                  }
                                  return Opacity(
                                    opacity: scale,
                                    child: Transform(
                                      transform: Matrix4.identity()
                                        ..scale(scale, scale),
                                      alignment: Alignment.bottomCenter,
                                      child: Align(
                                          heightFactor: 0.7,
                                          alignment: Alignment.topCenter,
                                          child: itemsData[index]),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
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
              if (hintText == "Your question") {
                content = value;
              } else if (hintText == "Your Topic write with #") {
                topic = value;
              }
            }),
            style: TextStyle(color: Colors.white),
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
              hintStyle: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
