import 'package:flutter/material.dart';
import 'package:selaty/selaty/shared_widgets/custom_app_bar.dart';
import 'package:selaty/selaty/sign_up/widgets/sign_up_land_layout.dart';
import 'package:selaty/selaty/sign_up/widgets/sign_up_portrait_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              bool isPortrait = orientation == Orientation.portrait;
              return isPortrait
                  ? SignUpPortraitLayout(
                    height: height,
                    nameController: _nameController,
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  )
                  : SignUpLandLayout(
                    height: height,
                    nameController: _nameController,
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  );
            },
          );
        },
      ),
    );
  }
}
