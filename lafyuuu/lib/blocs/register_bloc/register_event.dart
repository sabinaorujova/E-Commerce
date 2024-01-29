abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String email;
  final String password;
    final String fullname;
  final String? confirmpassword;


  RegisterButtonPressed( { required this.fullname, this.confirmpassword, required this.email, required this.password});
}