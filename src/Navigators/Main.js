import React from "react";

import { NavigationContainer } from "@react-navigation/native";
import MyStack from "./Application";

const MainNavigator = () => {
  return (
    <NavigationContainer>
      <MyStack />
    </NavigationContainer>
  );
};

export default MainNavigator;
