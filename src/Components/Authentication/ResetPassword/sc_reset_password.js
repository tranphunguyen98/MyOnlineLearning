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

function ForgotPassword({ navigation }) {
  return (
    <View style={Common.containerMain}>
      <View style={{ marginTop: SpaceSizes.extraLarge }}>
        <Text style={[Common.textRegular]}>
          Enter your email address. We will send you a verification code.
        </Text>
        <TextInput
          style={[
            Common.textInputGeneral,
            ,
            { marginTop: SpaceSizes.extraLarge },
          ]}
        ></TextInput>

        <Button
          title={"SEND CODE"}
          buttonStyle={Common.extraVMargin}
          onPress={() => {}}
        />
      </View>
    </View>
  );
}

export default ForgotPassword;
