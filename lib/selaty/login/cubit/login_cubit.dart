import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:selaty/selaty/verification/verification_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/api_url.dart';
import '../../helper/dio_helper.dart';
import '../model/LoginModel.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  DioHelper _dioHelper = DioHelper();
  LoginModel loginModel = LoginModel();

  void login({
    required String phone,
    required String password,
  })async{
    emit(LoginLoadingState());
    try{
      final response = await _dioHelper.postData(
        path: ApiUrl.login,
        body: {
          "phone_email" : phone,
          "password" : password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      if(loginModel.status==true){
        // تخزن token هنا
        //store token from model in shared preference, use it in dio and profile
        //categories اعرضها عند الاكثر مبيعا و الصفحتين بعدها
        // token اذا api يحتاج authorization لازم ارسلها في postman تستخدم لعمل authorization فتح لليوزر صفحات معينه او البروفايل الخاص به
        //صفحة جديدة عند البروفايل استخدم get profile , update profile اعدل فيها الاسم والايميل  و زر الحفظ والصوره تخزن في shared preference ,واغيرها من profile photo path
        //onboarding flag اخزنه في shared preference ايضا في البداية يكون دايماtrue ثم عند اخر زر في الصفحه اجعله false ومع login اذا كان هناك token يدخل على home اما اذا لا يوجد يدخل على login screen
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", loginModel.data?.token ?? "");

        await DioHelper.refreshTokenHeader();
        Get.offAll(VerifyScreen());
        emit(LoginSuccessState());
      }else{
        Get.snackbar("Error", loginModel.message??"",backgroundColor: Colors.red);
        emit(LoginErrorState());
      }

    }catch(e){
      emit(LoginErrorState());
    }
  }

}
