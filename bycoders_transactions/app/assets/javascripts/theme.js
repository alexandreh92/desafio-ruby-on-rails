$("document").ready(function () {
  const html = document.querySelector("html");
  const checkbox = document.querySelector("input[name=theme]");

  const getStyle = (element, style) =>
    window.getComputedStyle(element).getPropertyValue(style);

  const initialColors = {
    backgroundPrimary: getStyle(html, "--background-primary"),
    backgroundSecondary: getStyle(html, "--background-secondary"),
    backgroundDark: getStyle(html, "--background-dark"),
    lightGray: getStyle(html, "--light-gray"),
    tableBorders: getStyle(html, "--table-borders"),
    black: getStyle(html, "--black"),
    white: getStyle(html, "--white"),
    bycoders: getStyle(html, "--bycoders"),
    placeholder: getStyle(html, "--placeholder"),
  };

  const darkMode = {
    backgroundPrimary: "#2a2a2a",
    backgroundSecondary: "#1a1a1a",
    backgroundDark: "#ebebeb",
    lightGray: "#ebebeb",
    tableBorders: "#787878",
    black: "#ebebeb",
    white: "#fff",
    bycoders: "#00f0a2",
    placeholder: "#bbb",
  };

  const transformKey = (key) =>
    "--" + key.replace(/([A-Z])/, "-$1").toLowerCase();

  const changeColors = (colors) => {
    Object.keys(colors).map((key) =>
      html.style.setProperty(transformKey(key), colors[key])
    );
  };

  checkbox.addEventListener("change", ({ target }) => {
    if (target.checked) {
      changeColors(darkMode);
      localStorage.setItem("themeSwitch", "dark");
    } else {
      changeColors(initialColors);
      localStorage.removeItem("themeSwitch");
    }
  });

  const initTheme = () => {
    var darkThemeSelected =
      localStorage.getItem("themeSwitch") !== null &&
      localStorage.getItem("themeSwitch") === "dark";
    checkbox.checked = darkThemeSelected;
    darkThemeSelected ? changeColors(darkMode) : changeColors(initialColors);
  };

  initTheme();
});
