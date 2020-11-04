import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_outline_btn.dart';
import 'package:my_online_learning/utils/extensions.dart';

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
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
          color: context.theme.backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            children: [
              RowInfo("Product:", "Free IQ (Limited Library"),
              SizedBox(height: 16.0),
              RowInfo("Expiration:", "October 29, 2021"),
              SizedBox(height: 16.0),
              MyOutlineButton(
                "Manage your subscription",
                onPressed: () {},
              )
            ],
          )),
    );
  }
}

class RowInfo extends StatelessWidget {
  final String title, data;
  const RowInfo(
    this.title,
    this.data, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.bodyText2),
        Text(
          data,
          style: context.textTheme.subtitle2,
        ),
      ],
    );
  }
}
