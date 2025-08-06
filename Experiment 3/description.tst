1. SECTION: Header (Top Navigation Bar)
Purpose:
Displays the dashboard title and a theme switch button.

Elements Used:

<header> tag

<h1> for the title

<button> with ID themebutton for light/dark theme switch

Features:

Spans full width using grid-column: 1 / span 2

Fixed height of 100px

Styled with green background color (background-color: rgb(117, 228, 117);)

Theme button allows switching between light and dark modes

2. SECTION: Sidebar (Navigation Panel)
Purpose:
Provides easy navigation links: Home, Users, and Settings

Elements Used:

<nav class="sidebar">

<ul> list with <li> items containing <a> links

Features:

Placed on the left side using CSS Grid

Styled with border for separation

Easily extendable with more menu items

3. SECTION: Main Content Area
Purpose:
Displays main admin content like messages, charts, reports, etc.

Elements Used:

<main> tag

<h3> and <p> for content placeholder

Features:

Positioned next to sidebar

Placeholder content for real dashboard elements

Easy to add more content inside

4. SECTION: Footer
Purpose:
Displays copyright
Elements Used:

<footer> tag

Features:

Spans full width using grid-column: 1 / span 2

Fixed height of 50px

Styled with same background as header (rgb(117, 228, 117))

CSS STYLING BREAKDOWN
1. ELEMENT: * (Universal Selector)
Purpose:
Applies margin and padding
Properties & Effects:

margin: 10px; – Adds spacing around all elements

padding: 0; – Resets padding to zero

2. ELEMENT: body
Purpose:
Main container using CSS Grid
Properties & Effects:

display: grid; – Turns body into grid container

grid-template-columns: auto auto; – Two equal columns (Sidebar + Main)

height: 100vh; – Full viewport height

3. ELEMENT: header
Purpose:
Styles the top navigation bar
Properties & Effects:

grid-column: 1 / span 2; – Makes header span both columns

background-color: rgb(117, 228, 117); – Green background

height: 100px; – Fixed height

border: 1px solid black; – Simple border

4. ELEMENT: footer
Purpose:
Styles the bottom area of the dashboard
Properties & Effects:

grid-column: 1 / span 2; – Full width

background-color: rgb(117, 228, 117); – Matches header

height: 50px; – Shorter than header

border: 1px solid black; – Visible edge

5. ELEMENT: nav (Sidebar)
Purpose:
Left-side menu styling
Properties & Effects:

border: 1px solid black; – Adds border for clear separation

6. ELEMENT: main
Purpose:
Center content area
Properties & Effects:

border: 1px solid black; – Gives section visual boundary

THEME SWITCHING FUNCTIONALITY
The theme switch button (#themebutton) toggles between light and dark themes

JavaScript can be used to change body class between light-theme and dark-theme

Different background and text colors can be set in CSS for each theme

Works without refreshing the page

LEARNING OUTCOMES
Learned how to build an admin dashboard layout using HTML and CSS Grid

Understood how to use grid-template-columns and grid-column to position elements

Practiced creating reusable UI sections like header, footer, and sidebar

Learned how to add light/dark theme switch using a button (can be extended with JavaScript)

Understood basic responsive layout structure for admin panels and web apps

