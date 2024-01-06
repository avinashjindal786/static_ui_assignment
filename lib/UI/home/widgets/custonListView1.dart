import 'package:flutter/material.dart';

import 'customPositioned.dart';

class CustomListView1 extends StatelessWidget {
  const CustomListView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * .70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .65,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black))),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.ac_unit,
                                        color: Colors.black,
                                      )),
                                ),
                                const SizedBox(width: 1),
                                RichText(
                                  text: TextSpan(
                                    text: 'Author\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '1028 Meetups',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.black.withOpacity(.5),
                                              fontSize: 11)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                width: 160,
                                child: Stack(children: [
                                  const SizedBox(width: 10),
                                  Positioned(
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: const CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(
                                            'assets/images/image1.jpeg'),
                                      ),
                                    ),
                                  ),
                                  const CustomPositioned(leftvalue: 30),
                                  const CustomPositioned(leftvalue: 60),
                                  const CustomPositioned(leftvalue: 90),
                                  const CustomPositioned(leftvalue: 110),
                                ]),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade800,
                                      borderRadius: BorderRadius.circular(10)),
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  height: 40,
                                  width: 120,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "See More",
                                        style: TextStyle(color: Colors.white),
                                      )))
                            ],
                          )
                        ],
                      )),
                );
              }),
        );
  }
}