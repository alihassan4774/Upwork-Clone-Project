// document.addEventListener("turbo:load", () => {

//   // TALENT DROPDOWN
//   const talentBtn = document.getElementById("talentBtn");
//   const talentDropdown = document.getElementById("talentDropdown");
//   const talentArrow = document.getElementById("talentArrow");

//   if (talentBtn && talentDropdown) {
//     talentBtn.addEventListener("click", (e) => {
//       e.stopPropagation();
//       talentDropdown.classList.toggle("hidden");
//       talentArrow.classList.toggle("rotate-180");
//     });

//     talentDropdown.addEventListener("click", (e) => {
//       e.stopPropagation(); // 🔥 VERY IMPORTANT
//     });
//   }

//   // HELP DROPDOWN
//   const helpBtn = document.getElementById("helpBtn");
//   const helpDropdown = document.getElementById("helpDropdown");

//   if (helpBtn && helpDropdown) {
//     helpBtn.addEventListener("click", (e) => {
//       e.stopPropagation();
//       helpDropdown.classList.toggle("hidden");
//     });

//     helpDropdown.addEventListener("click", (e) => {
//       e.stopPropagation();
//     });
//   }

//   // CLICK OUTSIDE → CLOSE ALL
//   document.addEventListener("click", () => {
//     talentDropdown?.classList.add("hidden");
//     helpDropdown?.classList.add("hidden");
//     talentArrow?.classList.remove("rotate-180");
//   });

// });
