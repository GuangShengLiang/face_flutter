class Config {
  static const PAGE_SIZE = 20;
  static const DEBUG = true;
  static const USE_NATIVE_WEBVIEW = true;


  /// //////////////////////////////////////常量////////////////////////////////////// ///
  static const TOKEN_KEY = "token";
  static const USER_NAME_KEY = "user-name";
  static const PW_KEY = "user-pw";
  static const USER_BASIC_CODE = "user-basic-code";
  static const USER_INFO = "user-info";
  static const LANGUAGE_SELECT = "language-select";
  static const LANGUAGE_SELECT_NAME = "language-select-name";
  static const REFRESH_LANGUAGE = "refreshLanguageApp";
  static const THEME_COLOR = "theme-color";
  static const LOCALE = "locale";

//0 申请中 1 取消申请 2 同意 3 拒绝
  static const apply_status_apply = 0;
  static const apply_status_cancel = 1;
  static const apply_status_agree = 2;
  static const apply_status_reject = 3;
  static const act_button_list = ["待参加", "申请", "受邀", "审核", "全部"];
}