import 'package:flutter/material.dart';
import 'package:shoppingapp/components/custom_bottom_nav_bar.dart';
import 'package:shoppingapp/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile User"),
        backgroundColor: Colors.orange,
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
