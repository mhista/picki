import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/images/circular_images.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                // PROFILE PICTURE
                const PCircularImage(
                  imageUrl: PImages.appLogo,
                  width: 88,
                  height: 88,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Change Profile Pics'),
                ),

                // PROFILE INFO HEADING
                const SizedBox(
                  height: PSizes.spaceBtwItems / 2,
                ),
                const Divider(),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                const PSectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                PProfileMenu(
                    onPressed: () {}, title: 'Name', value: 'Diwe Innocent'),
                PProfileMenu(
                    onPressed: () {}, title: 'Username', value: 'Somtech'),

                // PERSONAL INFO HEADING

                const SizedBox(
                  height: PSizes.spaceBtwItems / 2,
                ),
                const Divider(),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                const PSectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                PProfileMenu(
                  icon: Iconsax.copy,
                  onPressed: () {},
                  title: 'User ID',
                  value: '45689',
                ),
                PProfileMenu(
                    onPressed: () {},
                    title: 'E-Mail',
                    value: 'diweesomchi@gmail.com'),
                PProfileMenu(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: '+2347068884102'),
                PProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
                PProfileMenu(
                    onPressed: () {},
                    title: 'Date Of Birth',
                    value: '30 May, 2000'),
                const Divider(),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Close Account',
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
