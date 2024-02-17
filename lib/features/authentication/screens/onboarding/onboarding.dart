import 'package:flutter/material.dart';
import 'package:pickafrika/features/authentication/screens/onboarding/widgets/onboardingskip.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';

import 'widgets/onboardingpage.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable pages
          PageView(
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                subtitle: TTexts.onBoardingSubTitle1,
                title: TTexts.onBoardingTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                subtitle: TTexts.onBoardingSubTitle2,
                title: TTexts.onBoardingTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                subtitle: TTexts.onBoardingSubTitle3,
                title: TTexts.onBoardingTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkip()
        ],
      ),
    );
  }
}
