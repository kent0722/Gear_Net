module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      keyframes: {
        slideInAndFadeOut: {
          "0%": { opacity: 0, transform: "translate3d(0, -100%, 0)" },
          "20%": { opacity: 1, transform: "translate3d(0, 0, 0)" },
          "80%": { opacity: 1, transform: "translate3d(0, 0, 0)" },
          "100%": { opacity: 0, transform: "translate3d(0, -100%, 0)" },
        },
        fadeIn: {
          '0%': { opacity: 0 },
          '100%': { opacity: 1 },
        },
        jiggle: {
          "0%": {
              transform: "scale3d(1, 1, 1)"
          },
          "30%": {
              transform: "scale3d(1.25, 0.75, 1)"
          },
          "40%": {
              transform: "scale3d(0.75, 1.25, 1)"
          },
          "50%": {
              transform: "scale3d(1.15, 0.85, 1)"
          },
          "65%": {
              transform: "scale3d(0.95, 1.05, 1)"
          },
          "75%": {
              transform: "scale3d(1.05, 0.95, 1)"
          },
          "100%": {
              transform: "scale3d(1, 1, 1)"
          },
        },
      },
      animation: {
        slideInAndFadeOut: 'slideInAndFadeOut 3s ease-in-out forwards',
        fadeIn: 'fadeIn 0.5s ease-in-out',
        jiggle: 'jiggle 0.6s ease-in-out 0.25s 1',
      },
    },
  },
  plugins: [],
}