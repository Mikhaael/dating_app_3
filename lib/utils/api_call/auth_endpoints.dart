class ApiEndPoints {
  static const String baseUrl = 'https://nimble-api.listedhosting.com/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'auth/login';
}