import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../utils/constants/colors.dart';

class PReadMoreText extends StatelessWidget {
  const PReadMoreText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: PColors.primary),
      lessStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: PColors.primary),
    );
  }
}
