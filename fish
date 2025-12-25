<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fish It Store</title>

<style>
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background: #020617;
  color: white;
}

/* HEADER */
header {
  background: linear-gradient(135deg, #14532d, #166534);
  padding: 30px 15px;
  text-align: center;
}

header h1 {
  margin: 0;
  font-size: 30px;
  color: gold;
}

/* ROW TITLE */
.row-title {
  padding: 10px 15px;
  font-weight: bold;
  color: #e5e7eb;
}

/* WRAPPER */
.row-wrapper {
  position: relative;
  overflow: hidden;
}

/* ROW */
.row {
  display: flex;
  transition: transform 0.4s ease;
}

/* CARD */
.game-card {
  flex: 0 0 100%;
  padding: 20px;
  box-sizing: border-box;
}

/* CARD CONTENT */
.card-inner {
  background: #020617;
  border-radius: 16px;
  padding: 25px;
  box-shadow: 0 15px 35px rgba(0,0,0,0.5);
}

.card-inner h3 {
  color: gold;
  margin: 0 0 10px;
}

.card-inner p {
  font-size: 14px;
}

.price {
  margin: 15px 0;
  font-size: 20px;
  font-weight: bold;
  color: #22c55e;
}

.buy-btn {
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 10px;
  background: linear-gradient(135deg, #22c55e, #16a34a);
  color: white;
  font-size: 16px;
  cursor: pointer;
}

/* PANAH */
.arrow-left,
.arrow-right {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 44px;
  height: 44px;
  border-radius: 50%;
  border: none;
  background: rgba(34,197,94,0.95);
  color: white;
  font-size: 24px;
  cursor: pointer;
  z-index: 10;
  box-shadow: 0 6px 15px rgba(0,0,0,0.4);
}

.arrow-left { left: 12px; }
.arrow-right { right: 12px; }

.arrow-left.hidden,
.arrow-right.hidden {
  display: none;
}

.arrow-left:active,
.arrow-right:active {
  transform: translateY(-50%) scale(0.9);
}

/* FOOTER */
footer {
  text-align: center;
  padding: 20px;
  color: #9ca3af;
}
</style>
</head>

<body>

<header>
  <h1>🎄🐟 Fish It Store</h1>
  <p>Gunakan panah • 1 klik = 1 card</p>
</header>

<div id="store"></div>

<footer>
  © 2025 Fish It Store • Merry Christmas 🎄
</footer>

<script>
const store = document.getElementById("store");
let gameNumber = 1;

/* GENERATE BARIS */
for (let row = 1; row <= 5; row++) {

  const title = document.createElement("div");
  title.className = "row-title";
  title.innerText = `Barisan ${row}`;
  store.appendChild(title);

  const wrapper = document.createElement("div");
  wrapper.className = "row-wrapper";

  const rowDiv = document.createElement("div");
  rowDiv.className = "row";

  for (let i = 1; i <= 8; i++) {
    const card = document.createElement("div");
    card.className = "game-card";
    card.innerHTML = `
      <div class="card-inner">
        <h3>Fish It #${gameNumber}</h3>
        <p>Game memancing seru 🎣</p>
        <div class="price">Rp ${(40 + gameNumber) * 1000}</div>
        <button class="buy-btn">🎁 Beli</button>
      </div>
    `;
    rowDiv.appendChild(card);
    gameNumber++;
  }

  const arrowLeft = document.createElement("button");
  arrowLeft.className = "arrow-left hidden";
  arrowLeft.innerHTML = "‹";

  const arrowRight = document.createElement("button");
  arrowRight.className = "arrow-right";
  arrowRight.innerHTML = "›";

  wrapper.appendChild(rowDiv);
  wrapper.appendChild(arrowLeft);
  wrapper.appendChild(arrowRight);
  store.appendChild(wrapper);

  let index = 0;
  const total = rowDiv.children.length;

  function update() {
    rowDiv.style.transform = `translateX(-${index * 100}%)`;
    arrowLeft.classList.toggle("hidden", index === 0);
    arrowRight.classList.toggle("hidden", index === total - 1);
  }

  arrowRight.onclick = () => {
    if (index < total - 1) {
      index++;
      update();
    }
  };

  arrowLeft.onclick = () => {
    if (index > 0) {
      index--;
      update();
    }
  };
}
</script>

</body>
</html>
