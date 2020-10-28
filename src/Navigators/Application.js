import * as React from "react";

import { createStackNavigator } from "@react-navigation/stack";

import StartScreen from "../Components/Others/StartScreen";
import Login from "../Components/Authentication/SignIn/sc_sign_in";

const Stack = createStackNavigator();

function MyStack() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Login" component={Login} />
      <Stack.Screen name="Start" component={StartScreen} />
    </Stack.Navigator>
  );
}

export default MyStack;
