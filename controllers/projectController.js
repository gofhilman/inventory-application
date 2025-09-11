const { validationResult } = require("express-validator");
const { getProject, updateProject, deleteProject } = require("../db/queries");
const validateMessage = require("../lib/form-validation");

async function projectGet(req, res) {
  const { projectId } = req.params;
  const project = await getProject(projectId);
  // view
}

async function projectEditGet(req, res) {
  const { projectId } = req.params;
  const project = await getProject(projectId);
  [project.category, project.language, project.tool] = [
    project.category,
    project.language,
    project.tool,
  ].map((item) => item.join(", "));
  // view
}

const projectEditPost = [
  validateMessage,
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      // view
    }
    const { projectId } = req.params;
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
    await updateProject(
      projectId,
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

async function projectDeletePost(req, res) {
  const { projectId } = req.params;
  await deleteProject(projectId);
  res.redirect("/?category=featured&page=1");
}

module.exports = {
  projectGet,
  projectEditGet,
  projectEditPost,
  projectDeletePost,
};
