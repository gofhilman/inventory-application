const { body } = require("express-validator");

const emptyToNull = (string) => string || null;

const validateMessage = [
  body("password")
    .notEmpty()
    .withMessage(
      "Darling, the gates of power don't open without the sacred admin password. " +
        "Don't leave her blank, she demands attention."
    )
    .equals(process.env.ADMIN_PASSWORD)
    .withMessage("Wrong password. But we love the confidence."),
  body("name")
    .trim()
    .notEmpty()
    .withMessage(
      "Darling, this project needs a name, not a ghost. Give her identity, " +
        "or she's not stepping onto the stage."
    ),
  ...["source", "website", "image"].map((field) =>
    body(field)
      .optional({ values: "falsy" })
      .trim()
      .isURL()
      .withMessage(
        `Darling, the project ${field} link is giving confusion, not connection. ` +
          `Drop a valid URL or let her rest.`
      )
      .customSanitizer(emptyToNull)
  ),
  ...["description", "features", "stack", "category", "language", "tool"].map(
    (field) => body(field).trim().customSanitizer(emptyToNull)
  ),
];

module.exports = validateMessage;
