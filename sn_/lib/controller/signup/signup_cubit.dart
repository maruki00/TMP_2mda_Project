import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sn/model/baseapi.dart';
import 'package:sn/model/user.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  late User user;
  late String imagepath;
  SignupCubit() : super(SignupInitialState());

  Future<void> registerAction(User user) async {
    emit(RegisterState(user: user));
    final data = await BaseApi.post("http://127.0.0.1/user/register", {
      "username": user.username,
      "fullname": user.fullname,
      "password": user.password,
      "address_email": user.addressemail,
      "phone_number": user.phonenumber,
      "file": await MultipartFile.fromFile(imagepath)
    });
    print(data);
  }

  Future<void> choseImageAction({required String img}) async {
    emit(ChoseImageState(imagepath: img));
  }
}
