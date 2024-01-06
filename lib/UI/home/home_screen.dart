import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/widgets/AppBar/appbar_with_icon.dart';
import '../home/widgets/customListView2.dart';
import '../home/widgets/custonListView1.dart';

class HomeScreen extends StatefulWidget {
  final List<String> imagepaths;
  const HomeScreen({super.key, this.imagepaths = const ["assets/images/image1.jpeg", "assets/images/image2.jpeg", "assets/images/image3.jpeg"]});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController sliderController = CarouselController();
  final NavigationService _navigationService = NavigationService();
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
          child: CommonAppBar(
              name: "Individual Meetup",
              onTap: () {
                _navigationService.back();
              })),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
            height: 65,
            child: TextField(
                decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.6)),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            )),
          ),
          CarouselSlider(
            carouselController: sliderController,
            options: CarouselOptions(
                height: 190.0,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: ((index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                })),
            items: (widget.imagepaths).map((path) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              path,
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 15),
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                child: const Text(
                                  'Avengers',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
                                )),
                          ),
                        ],
                      ));
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 5),
          DotsIndicator(
            dotsCount: widget.imagepaths.length,
            position: currentIndex,
            decorator: DotsDecorator(color: Colors.black.withOpacity(.5), activeColor: Colors.black),
          ),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Trending Popular People",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 15),
          const CustomListView1(),
          const SizedBox(height: 25),
          Container(
              padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Trending Trending Meetups",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 15),
          CustomListView2(),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
