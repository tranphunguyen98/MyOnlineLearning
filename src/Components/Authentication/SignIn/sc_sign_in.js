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

function Login({ navigation }) {
  return (
    <View style={Common.containerMain}>
      <View style={{ marginTop: SpaceSizes.extraLarge }}>
        <Text style={Common.textSmall}>Email and username</Text>
        <TextInput
          placeholder="Email"
          style={Common.textInputGeneral}
        ></TextInput>
        <Text style={Common.textSmall}>Password</Text>
        <TextInput
          placeholder="Password"
          secureTextEntry={true}
          style={Common.textInputGeneral}
        ></TextInput>
      </View>
      <View style={{ marginTop: SpaceSizes.large }}>
        <Button
          title={"Login"}
          buttonStyle={Common.regularVMargin}
          onPress={() => {}}
        />
        <Text style={Common.textRegularBlue}>FORGET PASSWORD?</Text>
        <Text style={Common.textRegularBlue}>DON'T HAVE A ACCOUNT?</Text>
      </View>
    </View>
  );
}

export default Login;
