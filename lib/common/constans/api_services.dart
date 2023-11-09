class ApiServices{
  static const String baseUrl = "https://7d45-103-147-8-121.ngrok-free.app";

  //auth
  static const String login = "/api/auth/local";
  static const String register = "/api/auth/local/register";

  //promotion
  static const String getAllPromotions = "/api/promotions?populate=*";  
}