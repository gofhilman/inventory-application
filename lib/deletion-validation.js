const { body } = require("express-validator");

const validateDeletionMessage = [
  body("password")
    .notEmpty()
    .withMessage(
      "You really thought you could delete without serving credentials? Cute. Delusional, but cute."
    )
    .equals(process.env.ADMIN_PASSWORD)
    .withMessage(
      "Wrong password, babe. This project isn't going anywhere with that weak sauce."
    ),
];

module.exports = validateDeletionMessage;
