// Switch text between English and Russian using data-en / data-ru attributes.
(function () {
  var lang = "en";
  var button = document.getElementById("toggle");
  var nodes = document.querySelectorAll("[data-en][data-ru]");
  button.addEventListener("click", function () {
    lang = lang === "en" ? "ru" : "en";
    document.documentElement.lang = lang;
    nodes.forEach(function (n) { n.textContent = n.getAttribute("data-" + lang); });
  });
})();
