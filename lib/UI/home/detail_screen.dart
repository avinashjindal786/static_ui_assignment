import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/utils/fonts_and_sizes.dart';
import '../../core/widgets/AppBar/appbar_with_icon.dart';

class DetailScreen extends StatelessWidget {
  CarouselController sliderController = CarouselController();
  final NavigationService _navigationService = NavigationService();

  final List<String> imagepaths = ["assets/images/image1.jpeg", "assets/images/image2.jpeg", "assets/images/image3.jpeg"];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DetailViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                  preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
                  child: CommonAppBar(
                      name: "Description",
                      onTap: () {
                        _navigationService.back();
                      })),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color(0xFFe0e0e0),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    ),
                    child: Column(children: [
                      CarouselSlider(
                        carouselController: sliderController,
                        options: CarouselOptions(
                            height: 250.0,
                            autoPlay: true,
                            viewportFraction: 1,
                            autoPlayInterval: const Duration(seconds: 5),
                            onPageChanged: ((index, reason) {
                              model.currentIndex = index;
                            })),
                        items: (imagepaths).map((path) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Stack(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      // margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                        ],
                                      )),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: DotsIndicator(
                                        dotsCount: imagepaths.length,
                                        position: model.currentIndex,
                                        decorator: const DotsDecorator(color: Color(0xFFebd8c6), activeColor: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.download,
                              color: Color(0xFF636363),
                              size: 34,
                            ),
                            const Icon(
                              Icons.bookmark,
                              color: Color(0xFF636363),
                              size: 30,
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Color(0xFF636363),
                              size: 30,
                            ),
                            const Icon(
                              Icons.crop_free,
                              color: Color(0xFF636363),
                              size: 30,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xFF636363),
                              size: 30,
                            ),
                            InkWell(
                              onTap: () async {
                                await Share.share("Share the text with anyone...");
                              },
                              child: const Icon(
                                Icons.share,
                                color: Color(0xFF636363),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.bookmark_outline,
                        color: Color(0xFF0e6d9e),
                        size: 18,
                      ),
                      Text(
                        "1087",
                        style: TextStyles.urbanistRegular.greyDark.f12,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.favorite_outline,
                        color: Color(0xFF0e6d9e),
                        size: 18,
                      ),
                      Text(
                        "1087",
                        style: TextStyles.urbanistRegular.greyDark.f12,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 85,
                        height: 18,
                        decoration: BoxDecoration(color: Color(0xFFe2e2e2), borderRadius: BorderRadius.circular(18)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      color: Color(0xFF34dae2),
                                      size: 15,
                                    ))),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "3.2",
                        style: TextStyles.urbanistRegular.greyDark.f12,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Action Name",
                    style: TextStyles.urbanistMedium.f16.copyWith(color: const Color(0xFF062f45)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Indian Actress",
                    style: TextStyles.urbanistMedium.f12.copyWith(color: const Color(0xFF7a7a7a)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "About",
                    style: TextStyles.urbanistMedium.f16.copyWith(color: const Color(0xFF062f45)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "One foot in front of the other, One more step, and then one more. Jack's only thoughts were to keep moving no matter how much his body screamed to stop and rest. He's lost almost all his energy and his entire body ached beyond belief, but he forced himself to take another step. Then another. And then one more.",
                    style: TextStyles.urbanistMedium.f12.copyWith(color: const Color(0xFF7a7a7a)),
                  ),
                ]),
              ),
            ));
  }
}

class DetailViewModel extends BaseViewModel {
  int currentIndex = 0;

  chnageIndex(int val) {
    currentIndex = val;
    notifyListeners();
  }
}
