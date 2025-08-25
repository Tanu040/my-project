Part 1: HTML Structure (index.html)

The file begins with the standard HTML5 document declaration to tell the browser that the page is an HTML5 document.
The <html> tag opens the document and defines the language as English.
Inside the <head> section, metadata and links to external resources are included.
The character encoding is set to UTF-8, which allows almost all characters and symbols.
The viewport meta tag ensures that the web page is responsive and adjusts correctly on different screen sizes.
The title tag sets the name that appears on the browser tab.
A link is included to connect the external CSS file that defines the page’s look and styling.
The <body> tag starts the visible content of the page.
At the top, a heading is placed with the text “SVG Drawing Tool.”
Next, there is a toolbar section wrapped in a div element with a class name for styling.
Inside the toolbar, the first element is a label for Mode selection.
A dropdown menu is used, allowing the user to choose between two drawing modes: Freehand or Rectangle.
The dropdown has two options—Freehand and Rectangle—with Freehand selected by default.
Another label is created for Color selection.
Inside this label, there is a color input box that shows a color picker; by default, it is set to a shade of blue.
Then comes a label for Width selection.
An input field of type number is added, so the user can set the stroke thickness.
The width input has a minimum value of 1, a maximum of 20, and a default of 3.
A button is added to the toolbar with the label “Clear,” which will later erase all drawings.
Below the toolbar, a container div is created with a class name indicating it’s a canvas wrapper.
Inside this container, an SVG element is placed which acts as the drawing area.
The SVG is given an id so it can be accessed in JavaScript.
The SVG has a fixed width of 900 pixels and height of 450 pixels.
A CSS class is also applied to the SVG for styling.
Inside the SVG, no shapes are initially present; new shapes will be appended dynamically using JavaScript.
At the bottom of the body, a script tag is included that connects to the external JavaScript file.
The closing tags for body and html complete the file.
So overall, the HTML part defines the structure of the page: a heading, a toolbar with inputs, and an empty SVG board where drawings will appear.

 Part 2: CSS Styling (styles.css)

The CSS file begins with a global rule that ensures padding and borders are included inside an element’s total width and height.
The body styling sets the font to a clean system font, applies a margin, sets background to white, and text color to dark gray.
The main heading is styled with a small bottom margin for spacing.
A toolbar class is defined for the toolbar container.
The toolbar uses flexbox layout to arrange items horizontally.
It also sets spacing between items using gap.
Vertical alignment is centered so that labels and inputs align neatly.
Padding is added inside the toolbar for comfortable spacing.
A border with light gray color surrounds the toolbar.
Border radius is applied to make the corners rounded.
A light background color is used for the toolbar to separate it visually from the page.
The canvas-wrap class styles the container that holds the SVG.
It has a dark border, padding, and rounded corners for neat appearance.
The background color is set to white so the SVG looks clean.
The board class applies to the SVG drawing area.
It ensures the SVG is displayed as a block element and can resize responsively.
The maximum width is limited so it doesn’t stretch too much.
The background color of the SVG is set to a very light gray to resemble paper.
A border is added around the SVG in a medium gray color.
Button styles are also defined globally.
Buttons have padding to look clickable.
A border and rounded corners make the button appear neat.
The background color is light gray by default.
The cursor changes to a pointer when hovering to indicate clickability.
On hover, the background becomes slightly darker, providing user feedback.
Overall, the CSS makes the page clean, modern, and easy to interact with.

 Part 3: JavaScript Functionality (app.js)

The JavaScript starts by connecting to important elements using their IDs.
It grabs the SVG board element.
It also grabs the dropdown menu for mode selection.
It gets the color picker input.
It gets the width input box.
It also selects the “Clear” button.
Then a few state variables are declared to track the drawing process.
A drawing flag is set to false initially, meaning the user is not drawing yet.
A currentShape variable is kept to store the active SVG element being drawn.
Two variables, startX and startY, store the position where the mouse was first pressed.

 Utility Function for Mouse Coordinates

A function is defined to calculate the mouse position relative to the SVG.
This is important because raw mouse coordinates are based on the entire browser window, not the SVG area.
The function gets the bounding rectangle of the SVG.
It subtracts the rectangle’s left and top from the mouse position to get local coordinates.
It then returns an object with x and y values.

 Functions for Freehand Drawing

A function is written to start freehand drawing.
It creates a new SVG path element using the SVG namespace.
The path’s fill is set to none because we only want outlines.
The stroke color is set to the chosen color from the input.
The stroke width is set to the chosen number from the width input.
Round line caps and joins are applied for smooth curves.
The initial path data (d attribute) is started with a “Move” command which tells the path where to begin.
The data is also stored inside a custom dataset attribute.
The path is added to the SVG.
Finally, the function returns the path element to keep updating it later.
Another function is defined to extend freehand drawing.
It takes the current path and adds a “Line” command to it.
This creates a continuous path that follows the mouse movement.
The new data is updated on the path’s d attribute.

 Functions for Rectangle Drawing

A function is written to start a rectangle.
It creates an SVG rect element.
The x and y coordinates are set to where the mouse was pressed.
The width and height are initialized to zero.
Fill is set to none.
Stroke color and width are applied just like in the freehand path.
The rectangle is added to the SVG.
The function returns the rectangle element.
Another function updates the rectangle as the mouse moves.
It calculates the minimum of the two x-coordinates for the left edge.
It calculates the minimum of the two y-coordinates for the top edge.
It calculates the absolute difference in x-coordinates for the width.
It calculates the absolute difference in y-coordinates for the height.
These values are applied to the rectangle’s attributes so it stretches as the mouse moves.

 Mouse Event Listeners

An event listener is added for mousedown on the SVG.
When the mouse is pressed, drawing is set to true.
The starting x and y positions are recorded.
The chosen stroke color and width are fetched.
If the current mode is freehand, the freehand start function is called.
If the mode is rectangle, the rectangle start function is called.
The returned shape is stored in currentShape.

Another event listener is added for mousemove.
If the user is not currently drawing, the function exits immediately.
The mouse’s new position is calculated.
If the mode is freehand, the extend function adds new line points.
If the mode is rectangle, the update function resizes the rectangle.

A separate function called finish is written.
It sets drawing back to false.
It resets currentShape to null.
This ensures no extra drawing continues after mouse release.
The mouseup event is attached to call finish.
The mouseleave event is also attached to call finish.
This means if the mouse leaves the SVG area, drawing also stops automatically.

 Clear Button Functionality

An event listener is attached to the Clear button.
When clicked, it loops through the SVG children.
One by one, it removes all child nodes inside the SVG.
This effectively clears all drawings from the board.
The user is then left with a clean blank canvas.

 Putting It All Together

The HTML provides the structure with toolbar, canvas, and buttons.
The CSS makes it look neat with borders, spacing, and colors.
The JavaScript handles all the logic and interactivity.
Users can choose freehand mode to draw paths like handwriting.
Or they can switch to rectangle mode to drag and create rectangular shapes.
They can select different stroke colors using the color picker.
They can adjust line thickness using the number input.
They can draw as many shapes as they like without reloading the page.
Each click-drag action creates a new independent shape.
Freehand paths are smooth because of rounded joins.
Rectangles adjust dynamically as the mouse moves.
The Clear button wipes everything instantly.
Mouse handling is robust—drawing stops if the mouse is released or leaves the canvas.
The SVG acts like a flexible drawing board because shapes are vector elements.
Since it uses SVG, the drawings remain crisp even if zoomed in.
All interactions happen in real time without reloading the page.
The program demonstrates DOM manipulation (creating and updating elements).
It also shows event handling (listening to mouse actions).
It teaches state management (tracking when drawing starts, continues, and ends).
It is a clean example of how JavaScript can create interactive web applications.
Beginners can easily extend it with circles, lines, or polygons.
The program also shows how to mix HTML inputs with SVG graphics for creativity.
Each part of the code is modular—functions handle specific tasks.
The flow is logical: start shape → update shape → finish shape.
Users can explore SVG attributes by experimenting with code.
The separation of HTML, CSS, and JS makes the project neat and maintainable.
This project is a small but powerful demonstration of interactive graphics on the web.