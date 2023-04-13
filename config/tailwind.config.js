const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
    content: [
        "./public/*.html",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/views/**/*.{erb,haml,html,slim}",
    ],
    theme: {
        extend: {
            fontFamily: {
                sans: ["Be Vietnam Pro", ...defaultTheme.fontFamily.sans],
            },
            typography: {
                DEFAULT: {
                    css: {
                        maxWidth: '100%',
                        h1: {fontSize: '1.5rem', fontWeight: '500'},
                        h2: {fontSize: '1.5rem', fontWeight: '500'},
                    }
                },
            }
        },
    },

    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/aspect-ratio"),
        require("@tailwindcss/typography"),
        require("@tailwindcss/container-queries"),
    ],
    mode: "jit",
};
