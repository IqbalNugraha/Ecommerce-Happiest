class ApiServices {
  static const String baseUrl = "https://09d4-103-147-8-252.ngrok-free.app";

  //auth
  static const String login = "/api/auth/local";
  static const String register = "/api/auth/local/register";

  //promotion
  static const String getAllPromotions = "/api/promotions?populate=*";

  //products
  static const String getAllProducts = "/api/products?populate=*";

  //user-address
  static const String getUserAddress = "/api/user-addresses?populate=*";
  static const String addUserAddress = "/api/user-addresses";
}
