import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/data/repository/user/i_user_repository.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_alert_dialog_simple.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar_file.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar_network.dart';
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
          children: const [
            SizedBox(height: 32.0),
            AvatarName(),
            SizedBox(
              height: 8,
            ),
            TextFieldWithEditButton(
              editMode: TextFieldWithEditButton.kEditPhone,
            ),
            TextFieldWithEditButton(
              editMode: TextFieldWithEditButton.kEditName,
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(height: 64.0),
            InfoOfActivity(),
          ],
        ),
      ),
    );
  }
}

class AvatarName extends StatefulWidget {
  const AvatarName({
    Key key,
  }) : super(key: key);

  @override
  _AvatarNameState createState() => _AvatarNameState();
}

class _AvatarNameState extends State<AvatarName> {
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
        return GestureDetector(
            onTap: getImage,
            child: _image == null
                ? CircleAvatarNetwork(
                    networkImageUrl:
                        userModel?.user?.avatar ?? "images/account_circle.png",
                    size: 100,
                  )
                : CircleAvatarFile(
                    image: _image,
                    size: 100.0,
                  ));
      },
    );
  }
}

class TextFieldWithEditButton extends StatefulWidget {
  static const int kEditPhone = 0;
  static const int kEditName = 1;
  final int editMode;

  const TextFieldWithEditButton({@required this.editMode});

  @override
  _TextFieldWithEditButtonState createState() =>
      _TextFieldWithEditButtonState();
}

class _TextFieldWithEditButtonState extends State<TextFieldWithEditButton> {
  bool isEditTextSelected = false;

  final TextEditingController _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserModel, IUserRepository>(
      builder: (_, userModel, userRepo, __) {
        switch (widget.editMode) {
          case TextFieldWithEditButton.kEditName:
            {
              _controller.text = userModel.name;
              break;
            }
          case TextFieldWithEditButton.kEditPhone:
            {
              _controller.text = userModel.user.phone;
              break;
            }
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 48),
              child: IntrinsicWidth(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  onTap: () {
                    //_focusNode.requestFocus();
                    setState(() {
                      isEditTextSelected = true;
                    });
                  },
                  decoration: InputDecoration(
                    hintText:
                        widget.editMode == TextFieldWithEditButton.kEditName
                            ? "Name"
                            : "Phone",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            if (isEditTextSelected)
              GestureDetector(
                onTap: () async {
                  User newUser;

                  switch (widget.editMode) {
                    case TextFieldWithEditButton.kEditName:
                      {
                        newUser =
                            userModel.user.copyWith(name: _controller.text);
                        break;
                      }
                    case TextFieldWithEditButton.kEditPhone:
                      {
                        newUser =
                            userModel.user.copyWith(phone: _controller.text);
                        break;
                      }
                  }
                  try {
                    print("newUser ${newUser.toString()}");
                    await userRepo.updateUser(newUser);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (_) =>
                          AlertDialogSimple("Update user", "Error: $e"),
                    );
                  }
                  userModel.user = newUser;
                  _focusNode.unfocus();
                  setState(() {
                    isEditTextSelected = false;
                  });
                },
                child: const Icon(
                  Icons.check,
                  size: 20.0,
                ),
              )
            else
              GestureDetector(
                onTap: () async {
                  _focusNode.requestFocus();
                  setState(() {
                    isEditTextSelected = true;
                  });
                },
                child: Icon(
                  Icons.edit,
                  size: 20.0,
                ),
              ),
          ],
        );
      },
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
