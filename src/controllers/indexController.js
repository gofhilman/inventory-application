const { getAllFilters, getFilteredProjects } = require("../db/queries");

async function filteredProjectGet(req, res) {
  if (Object.keys(req.query).length === 0) {
    return res.redirect("/?category=featured&page=1");
  }
  const { category, language, tool, page } = req.query;
  const filters = getAllFilters();
  const filteredProjects = getFilteredProjects(category, language, tool, page);
  // view
}
