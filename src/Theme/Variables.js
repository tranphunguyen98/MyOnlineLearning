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
  text: "#212529",
  primary: "#5EE2C5",
  success: "#28a745",
  error: "#dc3545",
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
