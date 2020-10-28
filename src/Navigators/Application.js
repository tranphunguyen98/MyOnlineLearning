import * as React from "react";

import { createStackNavigator } from "@react-navigation/stack";

import StartScreen from "../Components/Others/StartScreen";
// import Login from "../Components/Authentication/SignIn/sc_sign_in";
import { Login, Register } from "../Components/Authentication/index";
import { Colors } from "../Theme/index";

const Stack = createStackNavigator();

function MyStack() {
  return (
    <Stack.Navigator>
      <Stack.Screen
        name="Register"
        component={Register}
        options={optionsHeader}
      />
      <Stack.Screen name="Login" component={Login} />
      <Stack.Screen name="Start" component={StartScreen} />
    </Stack.Navigator>
  );
}

const optionsHeader = {
  headerTintColor: Colors.white,
  headerStyle: { backgroundColor: "#464F54" },
};

export default MyStack;
