import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_outline_btn.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Subscription"),
        backgroundColor: COLOR_CONST.GRAY_DARK,
      ),
      body: Container(
          color: COLOR_CONST.BACKGROUND_DARK,
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            children: [
              _buildRowInfo("Product:", "Free IQ (Limited Library"),
              SizedBox(height: 16.0),
              _buildRowInfo("Expiration:", "October 29, 2021"),
              SizedBox(height: 16.0),
              MyOutlineButton(
                title: "Manage your subscription",
                onPressed: () {},
              )
            ],
          )),
    );
  }

  _buildRowInfo(String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: STYLE_CONST.textRegularGray),
        Text(
          data,
          style: STYLE_CONST.textRegular,
        ),
      ],
    );
  }
}
