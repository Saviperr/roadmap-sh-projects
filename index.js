const express = require("express");
const dotenv = require("dotenv");
const basicAuth = require("basic-auth");

dotenv.config();

const app = express();
const PORT = 3000;

// Home route
app.get("/", (req, res) => {
  res.send("Hello, world!");
});

// Middleware for Basic Auth
const auth = (req, res, next) => {
  const user = basicAuth(req);

  if (
    !user ||
    user.name !== process.env.USERNAME ||
    user.pass !== process.env.PASSWORD
  ) {
    res.set("WWW-Authenticate", "Basic realm=Authorization Required");
    return res.status(401).send("Unauthorized");
  }

  next();
};

// Secret route
app.get("/secret", auth, (req, res) => {
  res.send(process.env.SECRET_MESSAGE);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
