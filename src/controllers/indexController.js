const { body, validationResult } = require("express-validator");
const {
  getAllFilters,
  getFilteredProjects,
  insertProject,
} = require("../db/queries");

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

async function filteredProjectGet(req, res) {
  if (Object.keys(req.query).length === 0) {
    return res.redirect("/?category=featured&page=1");
  }
  const { category, language, tool, page } = req.query;
  const filters = await getAllFilters();
  const filteredProjects = await getFilteredProjects(
    category,
    language,
    tool,
    page
  );
  // view
}

async function projectFormGet(_, res) {
  // view
}

const projectFormPost = [
  validateMessage,
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      // view
    }
    let {
      name,
      description,
      features,
      stack,
      source,
      website,
      image,
      category,
      language,
      tool,
    } = req.body;
    [category, language, tool] = [category, language, tool].map(
      (csv) => csv?.split(",").map((string) => string.trim()) || null
    );
    await insertProject(
      name,
      description,
      features,
      stack,
      source,
      website,
      image,
      category,
      language,
      tool
    );
    res.redirect("/?category=featured&page=1");
  },
];

module.exports = { filteredProjectGet, projectFormGet, projectFormPost };
