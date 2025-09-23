const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

let cards = [
  { id: 1, suit: "Hearts", value: "Ace" },
  { id: 2, suit: "Spades", value: "King" },
  { id: 3, suit: "Diamonds", value: "Queen" }
];

// GET /cards
app.get('/cards', (req, res) => {
  res.status(200).json(cards);
});

// GET /cards/:id
app.get('/cards/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const card = cards.find(c => c.id === id);

  if (card) {
    res.status(200).json(card);
  } else {
    res.status(404).json({ message: 'Card not found' });
  }
});

// POST /cards
app.post('/cards', (req, res) => {
  const newCard = {
    id: cards.length > 0 ? Math.max(...cards.map(c => c.id)) + 1 : 1,
    suit: req.body.suit,
    value: req.body.value
  };

  if (!newCard.suit || !newCard.value) {
    return res.status(400).json({ message: 'Suit and value are required.' });
  }

  cards.push(newCard);
  res.status(201).json(newCard);
});

// DELETE /cards/:id
app.delete('/cards/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const cardIndex = cards.findIndex(c => c.id === id);

  if (cardIndex > -1) {
    const deletedCard = cards.splice(cardIndex, 1)[0];
    res.status(200).json({ message: `Card with ID ${id} removed`, card: deletedCard });
  } else {
    res.status(404).json({ message: 'Card not found' });
  }
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});