import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/data/repository/user/i_user_repository.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_alert_dialog_simple.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar_file.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar_network.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_outline_btn.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("Account"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32.0),
            InfoOfUser(),
            SizedBox(height: 8.0),
            TextFieldWithEditButton(),
            SizedBox(height: 16.0),
            SizedBox(
              height: 8,
            ),
            SizedBox(height: 64.0),
            //InfoOfActivity(),
          ],
        ),
      ),
    );
  }
}

class InfoOfUser extends StatefulWidget {
  const InfoOfUser({
    Key key,
  }) : super(key: key);

  @override
  _InfoOfUserState createState() => _InfoOfUserState();
}

class _InfoOfUserState extends State<InfoOfUser> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    print('No image selected.');
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserModel, IUserRepository>(
      builder: (_, userModel, userRepo, __) {
        return Column(
          children: [
            GestureDetector(
              onTap: getImage,
              child: _image == null
                  ? CircleAvatarNetwork(
                      networkImageUrl: userModel?.user?.avatar ??
                          "images/account_circle.png",
                      size: 150,
                    )
                  : CircleAvatarFile(
                      image: _image,
                      size: 100.0,
                    ),
            ),
          ],
        );
      },
    );
  }
}

class TextFieldWithEditButton extends StatefulWidget {
  const TextFieldWithEditButton();

  @override
  _TextFieldWithEditButtonState createState() =>
      _TextFieldWithEditButtonState();
}

class _TextFieldWithEditButtonState extends State<TextFieldWithEditButton> {
  bool isEditTextSelected = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  //final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserModel, IUserRepository>(
      builder: (_, userModel, userRepo, __) {
        _nameController.text = userModel.user.username;
        _phoneController.text = userModel.user.phone;
        _emailController.text = userModel.user.email;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Name:',
                    style: context.textTheme.subtitle2,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 280.0,
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 16.0),
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Phone:',
                    style: context.textTheme.subtitle2,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 280.0,
                    child: TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 16.0),
                        hintText: "Phone",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Email:',
                    style: context.textTheme.subtitle2,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 280.0,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 16.0),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              CircleOutlineButton("EDIT INFO", onPressed: () async {
                final newUser = userModel.user.copyWith(
                  phone: _phoneController.text,
                  name: _nameController.text,
                );
                try {
                  print("newUser ${newUser.toString()}");
                  await userRepo.updateUser(newUser);
                  AlertDialogSimple("Update user", "Succeed:");
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (_) =>
                        AlertDialogSimple("Update user", "Error: $e"),
                  );
                }
                userModel.user = newUser;
              }),
              CircleOutlineButton(
                "EDIT EMAIL",
                onPressed: isEditTextSelected
                    ? () {
                        setState(() {
                          isEditTextSelected = false;
                        });
                      }
                    : () {
                        setState(() {
                          isEditTextSelected = true;
                        });
                      },
              ),
            ],
          ),
        );
      },
    );
  }
}
//
// if (isEditTextSelected)
// GestureDetector(
// onTap: () async {
// User newUser;
//
// switch (widget.editMode) {
// case TextFieldWithEditButton.kEditName:
// {
// newUser =
// userModel.user.copyWith(name: _controller.text);
// break;
// }
// case TextFieldWithEditButton.kEditPhone:
// {
// newUser = userModel.user.copyWith(
// phone: _controller.text,
// avatar:
// "http://xenangmatban.com/upload/images/hot-girl-1.jpg",
// );
// break;
// }
// }
// try {
// print("newUser ${newUser.toString()}");
// await userRepo.updateUser(newUser);
// } catch (e) {
// showDialog(
// context: context,
// builder: (_) =>
// AlertDialogSimple("Update user", "Error: $e"),
// );
// }
// userModel.user = newUser;
// _focusNode.unfocus();
// setState(() {
// isEditTextSelected = false;
// });
// },
// child: const Icon(
// Icons.check,
// size: 20.0,
// ),
// )
// else
// GestureDetector(
// onTap: () async {
// _focusNode.requestFocus();
// setState(() {
// isEditTextSelected = true;
// });
// },
// child: Icon(
// Icons.edit,
// size: 20.0,
// ),
// ),

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
