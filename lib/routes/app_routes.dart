import 'package:get/get.dart';
import 'package:pickafrika/features/authentication/screens/login/login.dart';
import 'package:pickafrika/features/authentication/screens/onboarding/onboarding.dart';
import 'package:pickafrika/features/authentication/screens/password_config/forget_password.dart';
import 'package:pickafrika/features/authentication/screens/signup/signup.dart';
import 'package:pickafrika/features/authentication/screens/signup/verify_email.dart';
import 'package:pickafrika/features/personalization/screens/address/address.dart';
import 'package:pickafrika/features/personalization/screens/profile/profile.dart';
import 'package:pickafrika/features/personalization/screens/settings/settings.dart';
import 'package:pickafrika/features/shop/screens/cart/cart.dart';
import 'package:pickafrika/features/shop/screens/checkout/checkout.dart';
import 'package:pickafrika/features/shop/screens/home/home.dart';
import 'package:pickafrika/features/shop/screens/order/order.dart';
import 'package:pickafrika/features/shop/screens/store/store.dart';
import 'package:pickafrika/features/shop/screens/wishlist/wishlist.dart';
import 'package:pickafrika/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: KRoutes.home, page: () => const HomeScreen()),
    GetPage(name: KRoutes.store, page: () => const Store()),
    GetPage(name: KRoutes.favourites, page: () => const WishListScreen()),
    GetPage(name: KRoutes.settings, page: () => const SettingsScreen()),
    // GetPage(
    //     name: KRoutes.productDetail, page: () => const ProductDetailScreen()),
    GetPage(name: KRoutes.order, page: () => const OrderScreen()),
    GetPage(name: KRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: KRoutes.cart, page: () => const CartScreen()),
    GetPage(name: KRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: KRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: KRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: KRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: KRoutes.sigin, page: () => const LoginScreen()),
    GetPage(
        name: KRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: KRoutes.onBoardinig, page: () => const OnBoardingScreen()),
  ];
}
