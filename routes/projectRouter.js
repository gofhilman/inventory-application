const { Router } = require("express");
const {
  projectGet,
  projectEditGet,
  projectEditPost,
  projectDeletePost,
} = require("../controllers/projectController");

const projectRouter = Router();

projectRouter.get("/:projectId", projectGet);
projectRouter.get("/:projectId/edit", projectEditGet);
projectRouter.post("/:projectId/edit", projectEditPost);
projectRouter.post("/:projectId/delete", projectDeletePost);

module.exports = projectRouter;
