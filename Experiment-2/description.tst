FUNCTIONAL ELEMENTS (Static Only — No JS):
FIELD: Balance Display

Requirement: Always visible. Shows current balance. (Default: $0)

Design: Big font, green color, centered text.

Valid Examples:

"$0"

"$500"

"$1,000.75"

BUTTON: Deposit

Requirement: Green color button, labeled as "Deposit"

Function: Only shows design. No real function added.

Design Check:

Centered, full width

Color: Green background with white text

Hover: Slight zoom animation

BUTTON: Withdraw

Requirement: Red color button, labeled as "Withdraw"

Function: Only UI — no JavaScript behavior

Design Check:

Centered, full width

Color: Red background with white text

Hover: Slight zoom animation

RESPONSIVENESS:

UI must adjust properly on different screens:

Mobile view: buttons stack properly

Tablet/Desktop: card stays centered, readable layout

Checked using @media queries in CSS


 CSS Styling Breakdown: A Structured Overview
1. ELEMENT: body (Page Centering)
display: flex;, justify-content: center;, align-items: center;
 Brings the card to center

background-color: #f2f2f2;
 Light gray background

2. ELEMENT: .card (Main Box)
background-color: white;
 Clean white box

border-radius: 10px;
 Rounded edges

box-shadow: 0 4px 12px rgba(0,0,0,0.1);
 Soft shadow

padding: 30px 40px;
 Space inside the card

max-width: 300px;
 Fix card width

3. ELEMENT: .balance (Text Showing Money)
font-size: 2rem;
 Big size

color: green;
 Green color to show positive balance

text-align: center;
 Centered text

4. ELEMENT: .btn (Both Buttons)
width: 100%;, padding: 12px;, font-weight: bold;
 Full-width buttons, easy to click

border-radius: 6px;
Rounded buttons

transition: transform 0.2s;
 Small hover animation

5. ELEMENT: .deposit & .withdraw (Individual Buttons)
.deposit:

background-color: #28a745; (green)

.withdraw:

background-color: #dc3545; (red)

Both use color: white; for text

6. Responsive Design using Media Queries
@media (max-width: 500px)
 Changes font size and padding for small screens
 Keeps layout readable on mobile
