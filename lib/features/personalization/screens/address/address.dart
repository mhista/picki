import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/features/personalization/controllers/address_controller.dart';
import 'package:pickafrika/features/personalization/screens/address/add_new_address.dart';
import 'package:pickafrika/features/personalization/screens/address/widgets/single_address.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/cloud_helper_function.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddAddressScreen()),
        backgroundColor: PColors.primary,
        child: const Icon(
          Iconsax.add,
          color: PColors.white,
        ),
      ),
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                return FutureBuilder(
                    key: Key(controller.refreshData.value.toString()),
                    future: controller.allUserAddress(),
                    builder: (context, snapshot) {
                      const loader =
                          Center(child: CircularProgressIndicator.adaptive());
                      final widget = KCloudHelperFunction.checkMultiRecordState(
                          snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;
                      final addresses = snapshot.data!;
                      return ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: addresses.length,
                        itemBuilder: (context, index) {
                          final address = addresses[index];
                          return SingleAddress(
                            onTap: () =>
                                controller.selectAddress(addresses[index]),
                            address: address,
                          );
                        },
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
