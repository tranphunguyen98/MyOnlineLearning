/**
 * This file contains the application's variables.
 *
 * Define color, sizes, etc. here instead of duplicating them throughout the components.
 * That allows to change them more easily later on.
 */

/**
 * Colors
 */
export const Colors = {
  transparent: "rgba(0,0,0,0)",
  // Example colors:
  white: "#ffffff",
  textDark: "#37474f",
  primary: "#5EE2C5",
  success: "#28a745",
  error: "#dc3545",
  backgroundDark: "#121212",
  gray: "#464F54",
  grayLight: "#66737A",
};

/**
 * FontSize
 */
export const FontSize = {
  small: 12,
  regular: 14,
  large: 18,
};

/**
 * Metrics Sizes
 */
const tiny = 5; // 10
const small = tiny * 2; // 10
const regular = tiny * 3; // 15
const large = regular * 2; // 30
export const MetricsSizes = {
  tiny,
  small,
  regular,
  large,
};

/**
 * Space Sizes
 */

export const SpaceSizes = {
  small: 4,
  regular: 8,
  large: 16,
  extraLarge: 32,
};
