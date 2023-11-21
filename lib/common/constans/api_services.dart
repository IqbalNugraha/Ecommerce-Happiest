class ApiServices {
  static const String baseUrl = "https://8655-103-147-8-167.ngrok-free.app";
  static const String baseUrlRajaOngkir = "https://pro.rajaongkir.com/api";
  static const String rajaOngkirKey = 'a9da3c4359fafde97f03ee2be60147b2';

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

  //order
  static const String order = "/api/orders";
}
