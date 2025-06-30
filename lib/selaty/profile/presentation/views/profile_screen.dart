import 'package:flutter/material.dart';
import 'package:selaty/selaty/profile/presentation/widgets/appBar/profile_appBar.dart';
import '../widgets/layouts/profile_land_layout.dart';
import '../widgets/layouts/profile_portrait_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String logo = "assets/images/logo.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe2e2e2),
      appBar: const SharedAppBar(),
      // bottomNavigationBar: CustomNavigationBar(logo: logo),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              bool isPortrait = orientation == Orientation.portrait;
              return isPortrait
                  ? ProfilePortraitLayout(logo: logo, isPortrait: isPortrait)
                  : ProfileLandLayout(logo: logo, isPortrait: isPortrait);
            },
          );
        },
      ),
    );
  }
}
