import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pickafrika/common/widgets/list_tiles/settings_menu_tiles.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/personalization/screens/address/address.dart';
import 'package:pickafrika/features/personalization/screens/profile/profile.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tiles/user_profile_list.dart';
import '../../../../utils/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            PPrimaryHeaderContainer(
              child: Column(
                children: [
                  PAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: PColors.white),
                    ),
                  ),

                  // USERPROFILE CARD
                  PUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            // BODY PART
            Padding(
              padding: const EdgeInsets.all(PSizes.defaultSpace),
              child: Column(
                children: [
                  // ACCOUNT SETTINGS
                  const PSectionHeading(title: 'Account Settings'),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  PSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'Set delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const PSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'Add, remove products and save to checkout'),
                  const PSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subtitle: 'View All completed and incompleted orders'),
                  const PSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to registered bank account'),
                  const PSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupon',
                      subtitle: 'List of all discounted coupons'),
                  const PSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifictions',
                      subtitle: 'See all notification messages'),
                  const PSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts'),

                  // APP SETTINGS
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  const PSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  PSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload data to your cloud datbase',
                    trailing: Switch(
                      value: true,
                      onChanged: ((value) {}),
                    ),
                  ),
                  PSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Safe search for all users',
                    trailing: Switch(
                      value: false,
                      onChanged: ((value) {}),
                    ),
                  ),
                  PSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image quality',
                    subtitle: 'Set Image quality',
                    trailing: Switch(
                      value: false,
                      onChanged: ((value) {}),
                    ),
                  ),

                  // LOGOUT BUTTON
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
