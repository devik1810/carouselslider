import 'package:carousel_slider/carousel_slider.dart';
import 'package:carouselslider/screen/provider/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of(context, listen: true);
    homeProviderF = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(backgroundColor: Colors.black,
          title: Text(
            "Carousel Slider",
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: CarouselSlider.builder(
                itemCount: 7,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    homeProviderF!.sliderImageList[index],
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  aspectRatio: 1,
                  initialPage: 0,
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    print(index);homeProviderT!.chnageIndex(index);
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: homeProviderT!.sliderImageList
                  .asMap()
                  .entries
                  .map((e) => Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: e.key == homeProviderT!.currentImageIndex
                                ? Colors.black
                                : Colors.black45,shape: BoxShape.circle),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
