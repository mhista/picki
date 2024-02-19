import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            PPrimaryHeaderContainer(
              child: Column(
                children: [
                  // APP BAR
                  PHomeAppbar(),

                  // SEARCHBAR

                  // CATEGORIES
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
