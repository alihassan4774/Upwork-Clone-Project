document.addEventListener("turbo:load", () => {
  const btn = document.getElementById("helpBtn");
  const dropdown = document.getElementById("helpDropdown");

  if (!btn || !dropdown) return;

  btn.addEventListener("click", (e) => {
    e.stopPropagation();
    dropdown.classList.toggle("hidden");
  });

  document.addEventListener("click", () => {
    dropdown.classList.add("hidden");
  });
});
