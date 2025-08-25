index.html (Structure Explanation)

The very first line tells the browser that the document type is HTML5.

The HTML document begins and sets the language to English.

The head section starts:

A meta tag sets the character encoding to UTF-8, which supports almost all characters and symbols worldwide.

Another meta tag defines the viewport, making the page adjust properly on mobile and desktop screens (responsive design).

A title is given to the page ("Dynamic Product Filter"), which appears on the browser’s tab.

A link is added to connect the external CSS file (style.css) so that the page gets its styling.

The head section ends and the body section begins.

Inside the body, a container division is created to hold all the content in one box.

A heading is placed inside the container with the text "Product List".

A label is written with the text "Filter by Category:" – this tells the user what the dropdown is for.

A dropdown menu is created (select element).

The dropdown has multiple options:

"All" → when selected, all products will be displayed.

"Clothing" → shows only clothing items.

"Electronics" → shows only electronic items.

"Books" → shows only books.

Below the dropdown, a list of products is created using an unordered list.

Each product is written as a list item (li).

Every product is tagged with a data-category attribute (a hidden property that stores its category).

Example: T-Shirt has data-category = "clothing".

Headphones have data-category = "electronics".

Novel has data-category = "books".

The container division ends.

A script tag is included at the bottom to connect the JavaScript file (script.js) which will handle the dynamic filtering.

The body ends, and finally the HTML document ends.

 style.css (Styling Explanation)

The body of the page is styled:

The font is set to a clean sans-serif type (Arial).

A margin is added around the whole page for spacing.

The background is given a very light gray color for a soft look.

The container box is styled:

A thin border is added around it.

Padding inside the box makes sure content doesn’t touch the edges.

The background color of the box is white so it stands out.

A fixed width is set so it doesn’t stretch too wide.

The heading (Product List) is styled to have spacing below it so it doesn’t stick to the next element.

The dropdown menu is styled:

Space is added below it so the product list isn’t too close.

Padding is added inside the dropdown so it’s easy to click and looks neat.

The unordered list (ul) is styled:

Default bullet points are removed.

Extra padding is removed so items align nicely.

Each list item (li), i.e., product, is styled:

A light gray background is given.

Small vertical spacing between items (margin).

Padding inside each item makes the text look balanced.

Rounded corners are added for a modern look.

⚙️ script.js (Logic Explanation)

First, the dropdown element is selected from the page using its id and stored in a variable.

Next, all the product list items (li) inside the product list are selected and stored in a list-like structure.

An event listener is added to the dropdown. This means the program is “listening” for any change in the dropdown.

When the user changes the dropdown selection:

The program reads the selected value (example: "clothing").

It goes through each product one by one.

For every product, it checks:

If the selected category is "all" → show the product.

Else if the product’s data-category matches the selected category → show the product.

Otherwise → hide the product.

This process happens instantly without reloading the page.

 Step-by-Step Working Flow

The user loads the page.

They see a heading, a dropdown, and a list of all products.

By default, "All" is selected in the dropdown.

Therefore, all products (Clothing, Electronics, Books) are visible.

The user clicks the dropdown and selects "Clothing".

JavaScript detects the change.

It hides all products that are not in the clothing category.

Only "T-Shirt" and "Jeans" remain visible.

If the user selects "Electronics":

JavaScript shows only "Headphones" and "Smartphone".

All other items are hidden.

If the user selects "Books":

Only "Novel" and "Cookbook" are displayed.

If the user selects "All" again:

All products reappear immediately.

Final Summary

HTML builds the structure: heading, dropdown, and product list with categories.

CSS makes the page look neat, with styled lists and dropdown.

JavaScript provides the brain of the page: it listens to the dropdown change and dynamically shows/hides products based on category.

Together, this creates a simple Dynamic Product Filter that works in real-time without reloading the page.