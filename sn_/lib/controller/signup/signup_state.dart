part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitialState extends SignupState {}

class RegisterState extends SignupState {
  final User user;
  RegisterState({
    required this.user,
  });
}

class ChoseImageState extends SignupState {
  final String imagepath;
  ChoseImageState({required this.imagepath});
}
