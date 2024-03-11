import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class PChoiceChip extends StatelessWidget {
  const PChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final color = PHelperFunctions.getColor(text);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        visualDensity: const VisualDensity(horizontal: -2.0),
        label: color != null ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? PColors.white : null),
        avatar: color != null
            ? PCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: color,
              )
            : null,
        shape: color != null ? const CircleBorder() : null,
        backgroundColor: color,
        labelPadding: color != null ? const EdgeInsets.all(0) : null,
        padding: color != null ? const EdgeInsets.all(0) : null,
        // selectedColor: color,
      ),
    );
  }
}
