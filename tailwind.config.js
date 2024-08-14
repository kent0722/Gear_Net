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
      },
      animation: {
        slideInAndFadeOut: 'slideInAndFadeOut 3s ease-in-out forwards',
        fadeIn: 'fadeIn 0.5s ease-in-out',
      },
      screens: {
        sm: '640px',
        md: '768px',
        lg: '1024px',
        xl: '1280px',
      },
    },
  },
  plugins: [],
}