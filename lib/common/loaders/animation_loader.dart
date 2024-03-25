import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

/// a widget for displaying animated loading with optional text and action button
class AnimationLoaderWidget extends StatelessWidget {
  // /  params:
// text: the text to be displayed below the animation
// animation: the path to the lottie animation file
// showAction: Wheteher to show the action button
//  actionText: the text to be displayed on the actipon button
//  onActionPressed: callback function to be executed when the action button is pressed
  const AnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), //display lottie animation
          const SizedBox(
            height: PSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: PSizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    child: Text(actionText!,
                        style: Theme.of(context).textTheme.bodyMedium!
                        // .apply(color: PColors.light),
                        ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
