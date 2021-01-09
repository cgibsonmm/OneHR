module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      animation: {
        dropDown: "fadeDown .3s ease-in-out forwards",
      },
      keyframes: {
        fadeDown: {
          "0%": { opacity: 0, display: "none", top: 0 },
          "1%": { display: "block" },
          "50%": { opacity: 0 },
          "100%": { opacity: 1, top: 34 },
        },
      },
    },
    variants: {
      extend: {},
    },
    plugins: [],
  },
};
