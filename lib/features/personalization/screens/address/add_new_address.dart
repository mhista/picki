import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/features/personalization/controllers/address_controller.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/validators/validation.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: const PAppBar(
        title: Text('Add New Address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      PValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(
                  height: PSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) =>
                      PValidator.validateEmptyText('phone number', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: PSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            PValidator.validateEmptyText('street', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(
                      width: PSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            PValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Postal Code'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: PSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            PValidator.validateEmptyText('city', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(
                      width: PSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            PValidator.validateEmptyText('state', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: PSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      PValidator.validateEmptyText('country', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(
                  height: PSizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.createAddress(),
                      child: const Text('Save Address')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
