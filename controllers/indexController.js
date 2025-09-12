const { validationResult } = require("express-validator");
const {
  getAllFilters,
  getFilteredProjects,
  insertProject,
} = require("../db/queries");
const validateMessage = require("../lib/form-validation");

async function filteredProjectGet(req, res) {
  if (Object.keys(req.query).length === 0) {
    return res.redirect("/?category=1&page=1");
  }
  const { category, language, tool, page } = req.query;
  const filters = await getAllFilters();
  const filteredProjects = await getFilteredProjects(
    +category,
    +language,
    +tool,
    +page
  );
  res.render("main-layout", {
    filters,
    filteredProjects,
    page: "index",
    title: "Home",
  });
}

async function projectFormGet(_, res) {
  res.render("main-layout", { page: "new-project", title: "New project" });
}

const projectFormPost = [
  validateMessage,
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).render("main-layout", {
        page: "new-project",
        title: "New project",
        errors: errors.array(),
      });
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
    [category, language, tool] = [category, language, tool].map((csv) =>
      csv.split(",").map((string) => string.trim())
    );
    const projectId = await insertProject(
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
    res.redirect(`/project/${projectId}`);
  },
];

module.exports = { filteredProjectGet, projectFormGet, projectFormPost };
