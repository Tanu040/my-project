// ----- Elements -----
const svg = document.getElementById("board");
const modeSel = document.getElementById("mode");
const colorInp = document.getElementById("strokeColor");
const widthInp = document.getElementById("strokeWidth");
const clearBtn = document.getElementById("clear");

// ----- State -----
let drawing = false;
let currentShape = null;   // <path> for freehand, <rect> for rectangle
let startX = 0, startY = 0;

// Convert mouse position to SVG coordinates (since width/height are fixed, simple math works)
function getMousePosSVG(evt) {
  const rect = svg.getBoundingClientRect();
  return {
    x: evt.clientX - rect.left,
    y: evt.clientY - rect.top
  };
}

// ----- Drawing helpers -----
function startFreehand(x, y, stroke, width) {
  const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
  path.setAttribute("fill", "none");
  path.setAttribute("stroke", stroke);
  path.setAttribute("stroke-width", width);
  path.setAttribute("stroke-linecap", "round");
  path.setAttribute("stroke-linejoin", "round");
  path.dataset.d = `M ${x} ${y}`;      // keep a simple "d" string in data attribute
  path.setAttribute("d", path.dataset.d);
  svg.appendChild(path);
  return path;
}

function extendFreehand(path, x, y) {
  path.dataset.d += ` L ${x} ${y}`;
  path.setAttribute("d", path.dataset.d);
}

function startRect(x, y, stroke, width) {
  const rect = document.createElementNS("http://www.w3.org/2000/svg", "rect");
  rect.setAttribute("x", x);
  rect.setAttribute("y", y);
  rect.setAttribute("width", 0);
  rect.setAttribute("height", 0);
  rect.setAttribute("fill", "none");
  rect.setAttribute("stroke", stroke);
  rect.setAttribute("stroke-width", width);
  svg.appendChild(rect);
  return rect;
}

function updateRect(rect, x1, y1, x2, y2) {
  const x = Math.min(x1, x2);
  const y = Math.min(y1, y2);
  const w = Math.abs(x2 - x1);
  const h = Math.abs(y2 - y1);
  rect.setAttribute("x", x);
  rect.setAttribute("y", y);
  rect.setAttribute("width", w);
  rect.setAttribute("height", h);
}

// ----- Mouse events -----
svg.addEventListener("mousedown", (e) => {
  drawing = true;
  const { x, y } = getMousePosSVG(e);
  startX = x; startY = y;

  const stroke = colorInp.value;
  const width = Number(widthInp.value) || 1;

  if (modeSel.value === "freehand") {
    currentShape = startFreehand(x, y, stroke, width);
  } else { // rect
    currentShape = startRect(x, y, stroke, width);
  }
});

svg.addEventListener("mousemove", (e) => {
  if (!drawing || !currentShape) return;
  const { x, y } = getMousePosSVG(e);

  if (modeSel.value === "freehand") {
    extendFreehand(currentShape, x, y);
  } else {
    updateRect(currentShape, startX, startY, x, y);
  }
});

function finish() {
  drawing = false;
  currentShape = null;
}
svg.addEventListener("mouseup", finish);
svg.addEventListener("mouseleave", finish);

// ----- Clear button -----
clearBtn.addEventListener("click", () => {
  while (svg.firstChild) svg.removeChild(svg.firstChild);
});
