import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/list_tiles/payment_tiles.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../utils/constants/enums.dart';
import '../models/payment_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentModel> selectedPaymentModel = PaymentModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentModel.value =
        PaymentModel(name: 'Paystack', image: PImages.paystack);
    super.onInit();
  }

  Future<dynamic> selectPaymentModel(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(PSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PSectionHeading(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              PaymentTile(
                paymentModel: PaymentModel(
                    name: PaymentMethods.paystack.name,
                    image: PImages.paystack),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              PaymentTile(
                paymentModel: PaymentModel(
                    name: PaymentMethods.paypal.name, image: PImages.paypal),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              PaymentTile(
                paymentModel: PaymentModel(
                    name: PaymentMethods.applePay.name,
                    image: PImages.applePay),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              PaymentTile(
                paymentModel: PaymentModel(
                    name: PaymentMethods.googlePay.name, image: PImages.google),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              PaymentTile(
                paymentModel: PaymentModel(
                    name: PaymentMethods.creditCard.name,
                    image: PImages.creditCard),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              PaymentTile(
                paymentModel: PaymentModel(
                    name: PaymentMethods.visa.name, image: PImages.visa),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
