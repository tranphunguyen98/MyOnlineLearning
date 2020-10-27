import * as React from "react";

import { Button, View } from "react-native";
import { NavigationContainer } from "@react-navigation/native";
import MyStack from "./src/Navigators/Application";

export default function App() {
  return (
    <NavigationContainer>
      <MyStack />
    </NavigationContainer>
  );
}
