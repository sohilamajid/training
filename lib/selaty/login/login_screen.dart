import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/selaty/login/cubit/login_cubit.dart';
import 'package:selaty/selaty/login/widgets/login_land_layout.dart';
import 'package:selaty/selaty/login/widgets/login_portrait_layout.dart';
import '../shared_widgets/custom_app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .sizeOf(context)
        .height;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                bool isPortrait = orientation == Orientation.portrait;
                return isPortrait
                    ? LoginPortraitLayout(
                  formKey: _formKey,
                  height: height,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isPortrait: isPortrait,
                )
                    : LoginLandLayout(
                  formKey: _formKey,
                  height: height,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isPortrait: isPortrait,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
