const pool = require("./pool");

async function getQueryNameList(sql) {
  const { rows } = await pool.query(sql);
  return rows;
}

async function getAllFilters() {
  const [categories, languages, tools] = await Promise.all([
    getQueryNameList(`SELECT * FROM category;`),
    getQueryNameList(`SELECT * FROM language;`),
    getQueryNameList(`SELECT * FROM tool;`),
  ]);
  return { categories, languages, tools };
}

async function getFilteredProjects(category, language, tool) {
  const filters = [
    { id: category, sql: `category.id = $1` },
    { id: language, sql: `language.id = $2` },
    { id: tool, sql: `tool.id = $3` },
  ];
  const baseSql = `
    SELECT DISTINCT project.id AS project_id, project.name, description, source, image, category.name AS category
    FROM project
    LEFT JOIN project_category ON project_category.project_id = project.id
    LEFT JOIN category ON category.id = project_category.category_id
    LEFT JOIN project_language ON project_language.project_id = project.id
    LEFT JOIN language ON language.id = project_language.language_id
    LEFT JOIN project_tool ON project_tool.project_id = project.id
    LEFT JOIN tool ON tool.id = project_tool.tool_id
  `;
  const filterSql = filters
    .filter((item) => item.id)
    .map((item) => item.sql)
    .join(` AND `);
  const closingSql = `
    ORDER BY project_id;
  `;
  const sql = baseSql + (filterSql ? `WHERE ` + filterSql : ``) + closingSql;
  const { rows } = await pool.query(sql, [category, language, tool]);
  // to do: reduce
}

module.exports = { getAllFilters, getFilteredProjects };
