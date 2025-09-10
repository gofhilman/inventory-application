const { getProject } = require("../db/queries");

async function projectGet(req, res) {
  const { projectId } = req.params;
  const project = await getProject(projectId);
  // view
}

async function projectEditGet(params) {}

async function projectEditPost(params) {}

async function projectDeletePost(params) {}

module.exports = {
  projectGet,
  projectEditGet,
  projectEditPost,
  projectDeletePost,
};
