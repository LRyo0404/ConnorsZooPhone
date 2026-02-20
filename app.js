// Splash screen fade out
window.addEventListener("load", () => {
  const splash = document.getElementById("splash-screen");
  const app = document.getElementById("app");

  setTimeout(() => {
    splash.style.opacity = "0";

    setTimeout(() => {
      splash.style.display = "none";
      app.classList.remove("hidden");
    }, 800);
  }, 1500); // splash duration
});

// Example dynamic interaction
document.addEventListener("click", (e) => {
  if (e.target.classList.contains("animal-btn")) {
    const animal = e.target.textContent;
    alert(`${animal} sound coming soon!`);
  }
});