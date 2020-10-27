import React from "react";
import { StyleSheet, Text, View, Image } from "react-native";

import { Layout, Images, Common } from "../../../Theme/index";

function LoginScreen() {
  return (
    <View style={styles.container}>
      <Text>
        Open up App.js to start working on werweeeyour a1111111111spp!
      </Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});

export default LoginScreen;
