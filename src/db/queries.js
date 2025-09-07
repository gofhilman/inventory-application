const pool = require("./pool");

async function getQueryNameList(sql) {
  const { rows } = await pool.query(sql);
  return rows.map((row) => row.name);
}

async function getAllFilters() {
  const [categories, languages, tools] = await Promise.all([
    getQueryNameList(`SELECT name FROM category;`),
    getQueryNameList(`SELECT name FROM language;`),
    getQueryNameList(`SELECT name FROM tool;`),
  ]);
  return { categories, languages, tools };
}

async function getFilteredProjects(category, language, tool) {
  const baseSql = `
    SELECT project.name, description, source, image, category.name
    FROM project
    LEFT JOIN project_category ON project_category.project_id = project.id
    LEFT JOIN category ON category.id = project_category.category_id
  `;
}

module.exports = { getAllFilters, getFilteredProjects };
