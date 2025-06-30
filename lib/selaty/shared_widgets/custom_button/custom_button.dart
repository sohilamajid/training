import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton<B extends StateStreamable<S>, S> extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.width,
    this.onTap,
    this.isLoadingState,
    this.useBloc = false,
  });

  final String text;
  final Color color;
  final double width;
  final void Function()? onTap;
  final bool Function(S state)? isLoadingState;
  final bool useBloc;

  @override
  Widget build(BuildContext context) {
    if (useBloc && isLoadingState != null) {
      return BlocBuilder<B, S>(
        builder: (context, state) {
          if (isLoadingState!(state)) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildButton();
        },
      );
    } else {
      return _buildButton();
    }
  }

  Widget _buildButton() {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: width * .9,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
