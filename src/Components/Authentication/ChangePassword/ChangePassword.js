import * as React from "react";
import { View, Image, Text, TextInput } from "react-native";

import { Button } from "react-native-elements";

import {
  Images,
  Colors,
  Common,
  Layout,
  SpaceSizes,
} from "../../../Theme/index";

function ChangePassword({ navigation }) {
  return (
    <View style={Common.containerMain}>
      <View style={{ marginTop: SpaceSizes.extraLarge }}>
        <Text style={Common.textSmall}>New Password</Text>
        <TextInput
          style={Common.textInputGeneral}
          secureTextEntry={true}
        ></TextInput>
        <Text style={Common.textSmall}>Confirm New Password</Text>
        <TextInput
          style={Common.textInputGeneral}
          secureTextEntry={true}
        ></TextInput>
        <Button
          title={"CHANGE PASSWORD"}
          buttonStyle={[
            Common.regularVMargin,
            { marginTop: SpaceSizes.extraLarge },
          ]}
          onPress={() => {}}
        />
      </View>
    </View>
  );
}

export default ChangePassword;
