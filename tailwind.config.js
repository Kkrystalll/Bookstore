module.exports = {
  mode: "jit",
  purge: ["./app/**/*.html.erb", "./app/helpers/**/*.rb", "./app/javascript/**/*.js"],
  theme: {
    extend: {
      colors: {
        mint: "#91B493",
        grassGreen: "#86C166",
        vermilion: "#AB3B3A",
        paleVermilion: "#D75455",
        gentleYellow: "#F3EADA",
        ironGray: "#7A7573",
        ironGrayHover: "#A5A2A0",
        bgGray: "#a4b5c4",
      },
    },
  },
}
