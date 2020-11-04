import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        color: context.theme.backgroundColor,
        child: Column(
          children: const [
            SizedBox(height: 32.0),
            AvatarName(),
            SizedBox(height: 64.0),
            InfoOfActivity(),
          ],
        ),
      ),
    );
  }
}

class AvatarName extends StatelessWidget {
  const AvatarName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatarNormal(
          assetImageUrl: "images/account_circle.png",
          size: 100,
        ),
        SizedBox(height: 4.0),
        Text(
          "Tran Phu Nguyen",
          style: StyleConst.textTitle,
        )
      ],
    );
  }
}

class WidgetInfoOfActivityItem extends StatelessWidget {
  final String title, data, extraData;

  const WidgetInfoOfActivityItem({
    Key key,
    @required this.title,
    @required this.data,
    this.extraData = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StyleConst.textRegularGray,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          children: [
            Text(data, style: StyleConst.textMedium),
            const SizedBox(
              width: 8.0,
            ),
            Text(extraData, style: StyleConst.textRegularGray),
          ],
        )
      ],
    );
  }
}

class InfoOfActivity extends StatelessWidget {
  const InfoOfActivity({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Activity insights (last 30 days)",
            style: StyleConst.textMedium,
          ),
          SizedBox(height: 64.0),
          WidgetInfoOfActivityItem(
              title: context.translate("total_active_day"),
              data: "1",
              extraData: "0 day streak"),
          SizedBox(height: 32.0),
          WidgetInfoOfActivityItem(
              title: "MOST ACTIVE TIME OF DAY", data: "8:00 PM"),
          SizedBox(height: 32.0),
          WidgetInfoOfActivityItem(
              title: "MOST VIEWED SUBJECT", data: "Angular"),
        ],
      ),
    );
  }
}
