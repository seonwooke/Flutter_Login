class AppRoutes {
  /// 싱글톤(Singleton) 패턴 : 객체의 인스턴스가 오직 하나만 생성되는 것
  AppRoutes._privateConstructor();
  static final AppRoutes _instance = AppRoutes._privateConstructor();

  static AppRoutes get instance => _instance;

  final String SPLASH = '/';
  final String START = '/start';
  final String SIGNIN = '/sign_in';
  final String SIGNUP = '/sign_up';
  final String HOME = '/home';
}
