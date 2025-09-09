const { Router } = require("express");
const {
  filteredProjectGet,
  projectFormGet,
  projectFormPost,
} = require("../controllers/indexController");

const indexRouter = Router();

indexRouter.get("/", filteredProjectGet);
indexRouter.get("/add", projectFormGet);
indexRouter.post("/add", projectFormPost);

module.exports = indexRouter;
