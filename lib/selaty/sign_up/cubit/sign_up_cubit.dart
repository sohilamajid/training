import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:selaty/selaty/login/login_screen.dart';
import 'package:selaty/selaty/sign_up/model/SignUpModel.dart';
import '../../helper/api_url.dart';
import '../../helper/dio_helper.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  DioHelper _dioHelper = DioHelper();
  SignUpModel signupModel = SignUpModel();

  void signUp({
    required String phone,
    required String password,
    required String name,

  })async{
    emit(SignUpLoadingState());
    try{
      final response = await _dioHelper.postData(
        path: ApiUrl.register,
        body: {
          "name": name,
          "mobile" : phone ,
          "password" : password,
        },
      );
      signupModel = SignUpModel.fromJson(response.data);
      if(signupModel.status==true){
        Get.offAll(LoginScreen());
        emit(SignUpSuccessState());
      }else{
        Get.snackbar("Error", signupModel.errorMessage??"",backgroundColor: Colors.red);
        emit(SignUpErrorState());
      }

    }catch(e){
      emit(SignUpErrorState());
    }
  }
}
