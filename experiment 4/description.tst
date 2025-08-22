index.html

<!DOCTYPE html>

Tells browser this is an HTML5 document.

<html lang="en">

Starts HTML document and sets language to English.

<head>

Contains meta info, title, links to CSS etc.

<meta charset="UTF-8">

Sets character encoding to UTF-8 (supports all characters/symbols).

<title>Live Character Counter</title>

Title shown in browser tab.

<link rel="stylesheet" href="style.css">

Connects external CSS file (style.css) to style the page.

</head>

Ends head section.

<body>

Starts visible content of the page.

<div class="container">

Creates a box (container) for the whole counter feature.

<h2>Live Character Counter</h2>

Heading inside container.

<textarea id="text-input" placeholder="Start typing..."></textarea>

Input box where user types.

id="text-input" → used in JavaScript to identify it.

placeholder="Start typing..." → shows gray hint text.

<div class="counter">Characters: <span id="char-count">0</span></div>

Displays live count of characters.

Characters: → static label text.

<span id="char-count">0</span> → shows number of characters (starts from 0).

</div>

Ends container.

<script src="script.js"></script>

Links external JavaScript file (script.js) to add live counting logic.

</body>

Ends page content.

</html>

Ends HTML document.

style.css

body { ... }

Styles the whole page.

font-family: Arial, sans-serif; → sets font style.

padding: 20px; → adds space inside page edges.

.container { ... }

Styles the box that holds counter.

border: 1px solid #000; → black border.

padding: 20px; → space inside box.

margin-bottom: 30px; → gap below box.

max-width: 500px; → limits width.

h2 { margin-top: 0; }

Removes default extra space above heading.

textarea { ... }

Styles the typing box.

width: 100%; → full width.

height: 100px; → fixed height.

padding: 10px; → space inside typing area.

font-size: 14px; → readable text size.

resize: vertical; → only resizable up and down.

.counter { ... }

Styles the character counter text.

font-weight: bold; → makes text bold.

margin-top: 10px; → small gap above counter.

 script.js

const textarea = document.getElementById('text-input');

Finds <textarea> using its id="text-input".

Stores it in variable textarea.

const charCount = document.getElementById('char-count');

Finds <span> that shows count (id="char-count").

Stores it in variable charCount.

textarea.addEventListener('input', () => { ... });

Adds an event listener to textarea.

input event triggers whenever user types, deletes, or pastes text.

Runs the function inside { ... } every time input changes.

charCount.textContent = textarea.value.length;

textarea.value → gets text inside textarea.

.length → counts number of characters.

charCount.textContent = ... → updates <span> text with the new number.

 So line by line, this code:

Creates a page → Adds a typing area → Styles it → Adds JavaScript that counts characters in real time → Updates counter immediately as user types.