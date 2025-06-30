import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaty/selaty/helper/api_url.dart';
import 'package:selaty/selaty/profile/model/ProfileModel.dart';
import '../../helper/dio_helper.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  DioHelper _dioHelper = DioHelper();
  ProfileModel profileModel = ProfileModel();

  void getProfile() async {
    emit(ProfileLoadingState());
    try {
      final response = await _dioHelper.getData(path: ApiUrl.profile);
      print("Profile API Response: ${response.data}");
      profileModel = ProfileModel.fromJson(response.data);
      if (profileModel.status == true) {
        emit(ProfileSuccessState());
      } else {
        emit(ProfileErrorState());
      }
    } catch (e,stackTrace) {
      print("Profile API error: $e");
      print(stackTrace);
      emit(ProfileErrorState());
    }
  }

}
