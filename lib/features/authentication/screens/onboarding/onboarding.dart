import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboardingnavigationdot.dart';
import 'widgets/onboardingpage.dart';
import 'widgets/onboardingskip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: PImages.onBoardingImage1,
                subtitle: PTexts.onBoardingSubTitle1,
                title: PTexts.onBoardingTitle1,
              ),
              OnBoardingPage(
                image: PImages.onBoardingImage2,
                subtitle: PTexts.onBoardingSubTitle2,
                title: PTexts.onBoardingTitle2,
              ),
              OnBoardingPage(
                image: PImages.onBoardingImage3,
                subtitle: PTexts.onBoardingSubTitle3,
                title: PTexts.onBoardingTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
