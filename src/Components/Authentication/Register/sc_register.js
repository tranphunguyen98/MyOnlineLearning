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

function Register({ navigation }) {
  return (
    <View style={Common.containerMain}>
      <View style={{ marginTop: SpaceSizes.extraLarge }}>
        <Text style={Common.textSmall}>Username</Text>
        <TextInput style={Common.textInputGeneral}></TextInput>
        <Text style={Common.textSmall}>Email</Text>
        <TextInput style={Common.textInputGeneral}></TextInput>
        <Text style={Common.textSmall}>Full name</Text>
        <TextInput style={Common.textInputGeneral}></TextInput>
        <Text style={Common.textSmall}>Password</Text>
        <TextInput
          secureTextEntry={true}
          style={Common.textInputGeneral}
        ></TextInput>
        <Text style={Common.textSmall}>Confirm password</Text>
        <TextInput
          secureTextEntry={true}
          style={Common.textInputGeneral}
        ></TextInput>
      </View>
      <View style={{ marginTop: SpaceSizes.large }}>
        <Button
          title={"REGISTER"}
          buttonStyle={Common.regularVMargin}
          onPress={() => {}}
        />
        <Text style={Common.textRegularBlue}>ALREADY HAVE A ACCOUNT?</Text>
      </View>
    </View>
  );
}

export default Register;
