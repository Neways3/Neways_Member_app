import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/auth/bloc/AuthController.dart';
import 'package:super_home_member/screens/home/components/ActivitiesSection.dart';
import 'package:super_home_member/screens/home/components/AppbarProfileSection.dart';
import 'package:super_home_member/screens/home/components/FacilitiesSection.dart';
import 'package:super_home_member/screens/home/components/MemberProfileSection.dart';
import 'package:super_home_member/screens/home/components/NewsSection.dart';
import 'package:super_home_member/screens/home/components/OthersActivitiesSection.dart';
import 'package:super_home_member/screens/home/components/SliderAdsImage.dart';
import 'package:super_home_member/screens/home/components/WelcomeSection.dart';
import 'package:super_home_member/screens/home/components/WifiSection.dart';
import 'package:super_home_member/screens/widgets/MySideNavigationBar.dart';
import '../../chat_with_us/chat_complain/chat_components/ComplainScreen.dart';
import 'package:url_launcher/url_launcher.dart';

_makingPhoneCall() async {
  var url = Uri.parse("tel:+8809638666333");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                        visible: controller.isLogin,
                        child: const AppbarProfileSection()),
                    Visibility(
                        visible: controller.isLogin,
                        child: MemberProfileSection(
                            scrollController: scrollController)),
                    Visibility(
                        visible: !controller.isLogin,
                        child: const WelcomeSection()),
                    ActivitiesSection(scrollController: scrollController),
                    WifiSection(),
                    const SliderAdsImage(),
                    OthersActivitiesSection(scrollController: scrollController),
                    NewsSection(scrollController: scrollController),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child:
                          FacilitiesSection(scrollController: scrollController),
                    ),
                  ],
                );
              }),
        ),
        const MySideNavigationBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ComplainScreen()),
                    );
                  },
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.1,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                'Chat With Us'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'CeraProBol'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7,
                            child: Image.asset(
                              'assets/icons/chat.png',
                              height: 25,
                              width: 35,
                            ),
                          ),
                        ],
                      ))),
                ),
                GestureDetector(
                  onTap: () {
                    _makingPhoneCall();
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                'Call Us'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'CeraProBol'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Image.asset(
                                'assets/icons/ph.png',
                                height: 22,
                                width: 35,
                              ),
                            ),
                          ),
                        ],
                      ))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
