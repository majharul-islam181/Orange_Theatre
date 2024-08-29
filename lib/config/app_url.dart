class AppUrl {
  static String baseUrl = 'http://localhost:8011';
  // http://localhost:8011
  // http://192.168.0.105:8011
  static String loginApi = '$baseUrl/api/v1/auth/login';
  static String allRooms = '$baseUrl/api/v1/room/getAll';
  static String productScreen = '$baseUrl/api/v1/room/findRoom';
  static String reservationScreen = '$baseUrl/api/v1/reservation/create';
    static String reservationList = '$baseUrl/api/v1/reservation/getReservationByUser';
}
