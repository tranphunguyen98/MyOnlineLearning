/**
 * This file defines the base application styles.
 *
 * Use it to define generic component styles (e.g. the default text styles, default button styles...).
 */
import { Colors, FontSize, SpaceSizes } from "./Variables";
import { StyleSheet } from "react-native";

export default StyleSheet.create({
  evenlyContainer: {
    flex: 1,
    padding: 16,
    justifyContent: "space-evenly",
  },
  generalContainer: {
    flex: 1,
    backgroundColor: "#ffffff",
  },
  button: {
    backgroundColor: Colors.primary,
  },
  backgroundPrimary: {
    backgroundColor: Colors.primary,
  },
  backgroundReset: {
    backgroundColor: Colors.transparent,
  },
  textInput: {
    borderWidth: 1,
    borderColor: Colors.text,
    backgroundColor: Colors.white,
    color: Colors.text,
    minHeight: 50,
    textAlign: "center",
    marginTop: 10,
    marginBottom: 10,
  },
  imageLogo: { width: 100, height: 100 },
  textLogo: { color: Colors.primary, fontSize: FontSize.large },
  regularVMargin: {
    marginVertical: SpaceSizes.regular,
  },
});
