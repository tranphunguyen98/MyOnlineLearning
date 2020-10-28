/**
 * This file defines the base application styles.
 *
 * Use it to define generic component styles (e.g. the default text styles, default button styles...).
 */
import { Colors, FontSize, SpaceSizes } from "./Variables";
import { StyleSheet } from "react-native";

export default StyleSheet.create({
  containerMain: {
    flex: 1,
    padding: SpaceSizes.large,
    backgroundColor: Colors.backgroundDark,
  },
  generalContainer: {
    flex: 1,
    backgroundColor: Colors.white,
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
  extraVMargin: {
    marginVertical: SpaceSizes.extraLarge,
  },
  textInputGeneral: {
    backgroundColor: Colors.grayLight,
    borderRadius: 8,
    padding: 8,
    marginVertical: 8,
    color: "#ffffff",
  },
  textSmall: { fontSize: 14, fontWeight: "300", color: Colors.grayLight },
  textRegular: { fontSize: 16, fontWeight: "300", color: Colors.white },
  textRegularBlue: {
    alignSelf: "center",
    marginTop: SpaceSizes.large,
    color: "#2196f3",
  },
});
