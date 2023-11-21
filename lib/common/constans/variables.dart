import 'package:flutter/material.dart';

import 'colors.dart';
import 'images.dart';

class Variables {
  //landing page
  static const String landingPage = "Everything you need is here.";
  static const String welcomePage =
      "Welcome to Happiest Stuff Store, let's find a something what u need";
  static const String getStarted = "Get Started";
  static const String skip = "Skip";

  //login
  static const String headerLogin = "Please Secure Your Account";
  static const String email = "Email";
  static const String password = "Password";
  static const String hintEmail = "Input your email address";
  static const String hintPassword = "Input your password";
  static const String hintPostalCode = "Input your postal code";
  static const String hintAddress = "Input your home address";
  static const String hintPhoneNumber = "Input your phone number";

  static const String notHaveAccount = "Not have an account?";
  static const String register = "Register";
  static const String forgotPassword = "Forgot Password?";

  //register
  static const String headerRegister = "Let's Register and Find Your Journey";
  static const String name = "Fullname";
  static const String rePassword = "Retype Password";
  static const String hintRePassword = "Input your retype password";
  static const String hintName = "Input your fullname";

  static const String haveAccount = "Have an account?";
  static const String login = "Login";

  //bottom-navigation
  static const String home = "Home";
  static const String search = "Search";
  static const String favorite = "Favorite";
  static const String profile = "Profile";

  //home
  static const String yourLocation = "Your Location";
  static const String locationStatic = "West Java, Bandung";
  static const String categories = "Categories";
  static const String viewMore = "View More";

  //promotion
  static const String getNow = "Get It Now";

  //product
  static const String detailProduct = "Detail Product";
  static const String stock = "Stock";
  static const String sendFrom = "Send From";
  static const String description = "Description";
  static const String review = "Review";

  //cart
  static const String total = "Total";
  static const String discount = "Discount";
  static const String grandTotal = "Grand Total";
  static const String addToCart = "Add to Cart";
  static const String cartAppbar = "Cart Page";
  static const String totalCart = "Total Cart";

  //voucher
  static const String myVoucher = "My Voucher";
  static const String btnSaveVoucher = "Save Voucher";

  //checkout
  static const String checkoutAppbar = "Checkout Page";
  static const String courierDropdown = "Choose Courier";
  static const String shippingCost = "Shipping Cost";

  //user-address
  static const String checkoutAddress = "Checkout Address";
  static const String userAddress = "User Address";
  static const String addAddress = "Add Address";
  static const String receiverName = "Receiver Name";
  static const String receiverPhone = "Receiver Phone Number";
  static const String receiverAddress = "Receiver Address";
  static const String receiverProvince = "Receiver Province";
  static const String receiverCity = "Receiver City/Sub City";
  static const String receiverSubdistrict = "Receiver Subdistrict";
  static const String receiverPostalCode = "Receiver Postal Code";

  //button
  static const String btnOkay = "Okay";
  static const String btnLogin = "Login";
  static const String btnRegister = "Register";
  static const String btnCheckout = "Check Out";
  static const String btnSeeAll = "See All";
  static const String btnAddAddress = "Add Address";
  static const String btnSave = "Save";
  static const String btnEdit = "Edit";
  static const String btnDelete = "Delete";

  //message
  static const String msgCantEmpty = "Field can't empty";
  static const String msgVoucherCantUse = "Cart is empty, can't use voucher";
  static const String msgCartEmpty = "Cart is empty, can't checkout";
  static const String msgPasswordEmpty = "Password can't empty";
  static const String msgPasswordNotSame = "Password is not same";
  static const String msgSuccessCart = "Success add to Cart";
  static const String msgUseVoucher = "Use some Voucher?";
  static const String msgEmptyAddress = "Please input your home address";
  static const String msgChooseAddress = "Choose your default address";
  static const String msgHttp408 = "Request Time Out";
  static const String msgHttpService = "Internal Services Error";

  //hardcode
  static const String emptyReview = "Nothing Review";
  static const String emptyCart = "Cart is Empty";

  static const List<String> images = [
    ImageAssets.landing1,
    ImageAssets.landing2,
    ImageAssets.landing3,
  ];

  // shadow
  static const List<BoxShadow> shadowRadius1 = [
    BoxShadow(
      color: MyColors.shadow,
      blurRadius: 1,
      spreadRadius: 1,
    ),
  ];

  static const List<BoxShadow> shadowRadius8 = [
    BoxShadow(
      color: MyColors.shadow,
      blurRadius: 8,
      spreadRadius: 1,
    ),
  ];
}
