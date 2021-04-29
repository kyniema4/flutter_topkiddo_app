import 'languages.dart';

class LanguageVi extends Languages {
  @override
  //login-screen
  String get canNotPhoneNumber => "Không thể để trống số điện thoại";
  String get phoneNumber10 => "Số điện thoại phải có 10 chữ số";
  String get canNotPassword => "Không thể trống mật khẩu";
  //register-screen
  String get canNotconfirmPassword => "Không thể xác nhận mật khẩu trống";
  String get passwordSameAbove => "Mật khẩu phải giống như trên";
  //login-home
  String get login => "Đăng nhập";
  String get register => 'Đăng ký';
  String get easy => "DỄ";
  String get medium => "TRUNG BÌNH";
  String get advanced => "KHÓ";
  String get lesson => "BÀI HỌC";
  String get youLearning => 'Bạn đạng học:';
  String get topic => 'chủ đề';
  String get translate => 'giao tiếp';
  String get designedCourses => 'Học theo lộ trình thiết kế sẵn';
  String get flexibleLearning => 'Học theo chủ đề tự do';
  String get expressionsPhrases => 'Mẫu câu cụm từ giao tiếp với con';
  String get phoneNumber => 'Số điện thoại';
  String get password => 'Mật khẩu';
  String get confirmPassword => 'Nhập lại mật khẩu';
}
