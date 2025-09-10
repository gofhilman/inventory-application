const { validationResult } = require("express-validator");
const {
  getAllFilters,
  getFilteredProjects,
  insertProject,
} = require("../db/queries");
const validateMessage = require("../lib/form-validation");

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
