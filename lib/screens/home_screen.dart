import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertravelapp/models/beach_model.dart';
import 'package:fluttertravelapp/models/popular_model.dart';
import 'package:fluttertravelapp/models/recommended_model.dart';
import 'package:fluttertravelapp/screens/selected_place_screen.dart';
import 'package:fluttertravelapp/widgets/bottom_navigation_bar.dart';
import 'package:fluttertravelapp/widgets/custom_tab_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {

  /// Page Controller
  final _pageController = PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarTravel(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              /// Custom Navigation Drawer and Search Button
              Container(
                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928),
                      ),
                      child: SvgPicture.asset('assets/svg/icon_drawer.svg'),
                    ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928),
                      ),
                      child: SvgPicture.asset('assets/svg/icon_search.svg'),
                    )
                  ],
                ),
              ),

              /// Text Widget for Title
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8),
                child: Text(
                  'Explore\nthe Nature',
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 45.6, fontWeight: FontWeight.w700),
                ),
              ),

              /// Custom Tab bar with Custom Indicator
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 14.4, top: 28.8),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                      labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                      indicatorPadding:
                          EdgeInsets.only(left: 14.4, right: 14.4),
                      isScrollable: true,
                      labelColor: Color(0xFF000000),
                      unselectedLabelColor: Color(0xFF8a8a8a),
                      labelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      unselectedLabelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      indicator: RoundedRectangleTabIndicator(
                          color: Color(0xFF000000), weight: 2.4, width: 14.4),
                      tabs: [
                        Tab(
                          child: Container(
                            child: Text('Recommended'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Popular'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('New Destination'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Hidden Gems'),
                          ),
                        )
                      ]),
                ),
              ),

              /// ListView widget with PageView
              /// Recommendations Section
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                recommendedModel: recommendations[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                recommendations[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          recommendations[index].name,
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// Dots Indicator
              /// Using SmoothPageIndicator Library
              Padding(
                padding: EdgeInsets.only(left: 28.8, top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFF8a8a8a),
                      dotColor: Color(0xFFababab),
                      dotHeight: 4.8,
                      dotWidth: 6,
                      spacing: 4.8),
                ),
              ),

              /// Text Widget for Popular Categories
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: FittedBox(
                        child: Text(
                          'Popular Categories',
                          style: GoogleFonts.playfairDisplay(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Container(width: MediaQuery.of(context).size.width*0.1,
                      child: FittedBox(
                        child: Text(
                          'Show All ',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8a8a8a),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              /// ListView for Popular Categories Section
              Container(
                margin: EdgeInsets.only(top: 33.6),
                height: 45.6,
                child: ListView.builder(
                  itemCount: populars.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 28.8, right: 9.6),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 19.2),
                      height: 45.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(populars[index].color),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 19.2,
                          ),
                          Image.asset(
                            populars[index].image,
                            height: 16.8,
                          ),
                          SizedBox(
                            width: 19.2,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// ListView for Beach Section
              Container(
                margin: EdgeInsets.only(top: 28.8, bottom: 16.8),
                height: 124.8,
                child: ListView.builder(
                  itemCount: beaches.length,
                  padding: EdgeInsets.only(left: 28.8, right: 12),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 124.8,
                      width: 188.4,
                      margin: EdgeInsets.only(right: 16.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              CachedNetworkImageProvider(beaches[index].image),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
