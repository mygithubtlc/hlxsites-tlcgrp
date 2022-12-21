module.exports = {
  root: true,
  extends: "airbnb-base",
  env: {
    browser: true,
    node: 1,
  },

  parser: "@babel/eslint-parser",
  parserOptions: {
    allowImportExportEverywhere: true,
    sourceType: "module",
    requireConfigFile: false,
  },
  rules: {
    quotes: [1, "single", { avoidEscape: true }],
    // allow reassigning param
    "no-param-reassign": [2, { props: false }],
    "linebreak-style": ["error", "unix"],
    "import/extensions": [
      "error",
      {
        js: "always",
      },
    ],
  },
};
