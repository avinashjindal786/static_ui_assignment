import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomListView2 extends StatelessWidget {
  CustomListView2({super.key});

  final NavigationService _navigationService = NavigationService();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: InkWell(
                onTap: () {
                  _navigationService.navigateToDetailScreen();
                },
                child: Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width * .45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/image1.jpeg",
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 140,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 15),
                            child: Container(
                                width: 70,
                                height: 80,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                                child: Text(
                                  ((index + 1) < 10) ? "0${index + 1}" : "${index + 1}",
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50.0),
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
