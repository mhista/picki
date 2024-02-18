import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/authentication/screens/onboarding/widgets/onboardingskip.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';
import 'package:pickafrika/utils/device/device_utility.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controllers.onboarding/onboarding_controller.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboardingnavigationdot.dart';
import 'widgets/onboardingpage.dart';

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
