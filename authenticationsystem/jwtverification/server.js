const express = require("express");
const jwt = require("jsonwebtoken");

const app = express();
app.use(express.json());

const SECRET_KEY = "your_secret_key"; // replace with your secret key

// Sample route to generate token
app.post("/login", (req, res) => {
  const user = { id: 1, username: "Tanu" };
  const token = jwt.sign(user, SECRET_KEY, { expiresIn: "1h" });
  res.json({ token });
});

// Sample route to verify token
app.get("/protected", (req, res) => {
  const token = req.headers["authorization"];
  if (!token) return res.status(401).send("Access denied.");

  try {
    const verified = jwt.verify(token, SECRET_KEY);
    res.json({ message: "Protected data", user: verified });
  } catch (err) {
    res.status(400).send("Invalid token");
  }
});

app.listen(3000, () => console.log("Server running on port 3000"));
