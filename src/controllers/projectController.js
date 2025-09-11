const { validationResult } = require("express-validator");
const { getProject } = require("../db/queries");
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
    // to do: consider '' instead of NULL, change insert to update
    // const projectId = await insertProject(
    //   name,
    //   description,
    //   features,
    //   stack,
    //   source,
    //   website,
    //   image,
    //   category,
    //   language,
    //   tool
    // );
    res.redirect(`/project/${projectId}`);
  },
];

async function projectDeletePost(params) {}

module.exports = {
  projectGet,
  projectEditGet,
  projectEditPost,
  projectDeletePost,
};
