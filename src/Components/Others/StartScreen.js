import * as React from "react";
import { View, Image, Text } from "react-native";

import { Button } from "react-native-elements";

import { Images, Colors, Common, Layout } from "../../Theme/index";

function StartScreen({ navigation }) {
  return (
    <View style={[Common.containerMain, Layout.justifyContentEvenly]}>
      <View style={Layout.colCenter}>
        <Image style={Common.imageLogo} source={Images.logo} />
        <Text style={[Common.textLogo, Common.regularVMargin]}>
          ONLINE LEARNING
        </Text>
      </View>
      <View>
        <Button
          title={"Login"}
          buttonStyle={Common.regularVMargin}
          onPress={() => {
            navigation.navigate("Login");
          }}
        />
        <Button
          title={"Register"}
          type="outline"
          buttonStyle={Common.regularVMargin}
          onPress={() => {}}
        />
        <Button
          title={"Explore without sign in"}
          type="outline"
          buttonStyle={Common.regularVMargin}
          onPress={() => {}}
        />
      </View>
    </View>
  );
}

export default StartScreen;
