import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:selaty/selaty/profile/model/UpdateProfileModel.dart';
import '../../../helper/api_url.dart';
import '../../../helper/dio_helper.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  final DioHelper _dioHelper = DioHelper();
  UpdateProfileModel updateProfileModel = UpdateProfileModel();


    Future<void> updateProfile({
      required String name,
      required String mobile,
      required String email ,
      File? image,
    }) async {
      emit(UpdateProfileLoading());

      try {
        final formData = dio.FormData.fromMap({
          "name": name,
          "mobile": mobile,
          "email" : email ,
          if (image != null)
            "profile_photo_path": await dio.MultipartFile.fromFile(image.path,
                filename: image.path.split("/").last),
        });

        final response = await _dioHelper.postData(
          path: ApiUrl.updateProfile,
          body: formData,
        );

        print("Update Profile API Response--------------: ${response.data}");


        updateProfileModel = UpdateProfileModel.fromJson(response.data);
        if (updateProfileModel.status == true) {
          emit(UpdateProfileSuccess());
        } else {
          Get.snackbar("Error", updateProfileModel.message??"",backgroundColor: Colors.red);
          emit(UpdateProfileError());
        }
      } catch (e) {
        print("Update profile error---------------: $e");
        emit(UpdateProfileError());
      }
    }
  }
