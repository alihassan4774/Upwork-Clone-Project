document.addEventListener("turbo:load", () => {
  const btn = document.getElementById("talentBtn");
  const dropdown = document.getElementById("talentDropdown");
  const arrow = document.getElementById("talentArrow");

  if (!btn || !dropdown) return;

  btn.addEventListener("click", (e) => {
    e.stopPropagation();
    dropdown.classList.toggle("hidden");
    arrow.classList.toggle("rotate-180");
  });

  document.addEventListener("click", () => {
    dropdown.classList.add("hidden");
    arrow.classList.remove("rotate-180");
  });
});
