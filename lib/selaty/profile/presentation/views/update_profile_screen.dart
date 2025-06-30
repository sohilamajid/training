import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selaty/selaty/login/widgets/custom_text_field.dart';
import 'package:selaty/selaty/profile/cubit/profile_cubit.dart';
import 'package:selaty/selaty/shared_widgets/custom_button/custom_button.dart';
import '../../../../const.dart';
import '../../cubit/update_profile/update_profile_cubit.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        _pickedImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحديث البيانات الشخصية'),
      ),
      body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم تحديث البيانات بنجاح')),
            );
            context.read<ProfileCubit>().getProfile();
            Navigator.pop(context);
          } else if (state is UpdateProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('فشل في تحديث البيانات')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 58,
                      backgroundColor: Colors.white.withOpacity(.3),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.greyColor,
                        backgroundImage: _pickedImage != null
                            ? FileImage(_pickedImage!)
                            : const AssetImage("assets/images/logo.png")
                        as ImageProvider,
                      ),
                    ),
                    InkWell(
                      onTap: _pickImage,
                      child: const CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  height: height.h,
                  text: "تغيير الإسم",
                  controller: _nameController,
                ),
                CustomTextField(
                  height: height.h,
                  text: "تغيير رقم الهاتف",
                  controller: _phoneController,
                ),
                CustomTextField(
                  height: height.h,
                  text: "تغيير البريد الالكتروني",
                  controller: _emailController,
                ),
                SizedBox(height: 20.h),
                state is UpdateProfileLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                  text: "حفظ",
                  color: AppColors.greenColor,
                  width: 300.w,
                  onTap: () {
                    final name = _nameController.text.trim();
                    final mobile = _phoneController.text.trim();
                    final email = _emailController.text.trim();
                    context.read<UpdateProfileCubit>().updateProfile(
                      name: name,
                      mobile: mobile,
                      email: email,
                      image: _pickedImage,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
