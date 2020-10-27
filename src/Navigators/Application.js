import * as React from "react";

import { createStackNavigator } from "@react-navigation/stack";

import StartScreen from "../Components/Others/StartScreen";

const Stack = createStackNavigator();

function MyStack() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="StartScreen" component={StartScreen} />
    </Stack.Navigator>
  );
}

export default MyStack;
