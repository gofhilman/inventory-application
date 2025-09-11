// require("dotenv").config();
const pool = require("./pool");

const ITEMS_PER_PAGE = 10;

async function getQueryNameList(sql) {
  const { rows } = await pool.query(sql);
  return rows;
}

async function insertFilters(projectId, category, language, tool) {
  let filters = [
    { type: "category", name: category },
    { type: "language", name: language },
    { type: "tool", name: tool },
  ];
  filters = await Promise.all(
    filters.map(async (filter) => {
      filter.name = await Promise.all(
        filter.name.map(async (item) => {
          const { rows } = await pool.query(
            `SELECT id FROM ${filter.type} WHERE name ILIKE $1;`,
            [item]
          );
          return { name: item, id: rows[0]?.id ?? null };
        })
      );
      return filter;
    })
  );
  // filters = [{type, name: [{name, id}, ...]}, ...]
  for (const filter of filters) {
    if (filter.name.length > 0) {
      for (const item of filter.name) {
        if (!item.id) {
          const { rows } = await pool.query(
            `INSERT INTO ${filter.type} (name) VALUES ($1) ON CONFLICT DO NOTHING RETURNING id;`,
            [item.name]
          );
          item.id = rows[0].id;
        }
        await pool.query(
          `INSERT INTO project_${filter.type} (project_id, ${filter.type}_id) VALUES ($1, $2)
          ON CONFLICT DO NOTHING;`,
          [projectId, item.id]
        );
      }
    }
  }
}

async function getAllFilters() {
  const [categories, languages, tools] = await Promise.all([
    getQueryNameList(`SELECT * FROM category;`),
    getQueryNameList(`SELECT * FROM language;`),
    getQueryNameList(`SELECT * FROM tool;`),
  ]);
  return { categories, languages, tools };
}

async function getFilteredProjects(category, language, tool, page) {
  const filters = [
    { id: category, name: "category" },
    { id: language, name: "language" },
    { id: tool, name: "tool" },
  ];
  const modFilters = filters.filter((item) => item.id);
  const sqlParams = modFilters.map((item) => item.id);
  const createFilter = (index, filterName) =>
    `project.id IN (SELECT project_id FROM project_${filterName} WHERE ${filterName}_id = $${index})`;
  const baseSql = `
    SELECT project.id AS project_id, project.name, description, source, image
    FROM project
  `;
  const filterSql = modFilters
    .map((item, index) => createFilter(index + 1, item.name))
    .join(` AND `);
  const closingSql = `
    ORDER BY project_id DESC;
  `;
  const sql = baseSql + (filterSql ? `WHERE ` + filterSql : ``) + closingSql;
  const { rows } = await pool.query(sql, sqlParams);
  const result = await Promise.all(
    rows.map(async (row) => {
      const { rows: categoryRows } = await pool.query(
        `SELECT name FROM category 
        JOIN project_category ON project_category.category_id = category.id
        WHERE project_id = $1
        ORDER BY id;`,
        [row.project_id]
      );
      row.category = categoryRows.map((item) => item.name);
      return row;
    })
  );
  return result.slice((page - 1) * ITEMS_PER_PAGE, page * ITEMS_PER_PAGE);
}

// getFilteredProjects(1, undefined, undefined, 1).then((res) =>
//   console.log(res)
// );

async function insertProject(
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
) {
  const { rows } = await pool.query(
    `INSERT INTO project (name, description, features, stack, source, website, image)
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id;`,
    [name, description, features, stack, source, website, image]
  );
  const projectId = rows[0].id;
  await insertFilters(projectId, category, language, tool);
  return projectId;
}

async function getProject(projectId) {
  const { rows: projectRows } = await pool.query(
    `SELECT name, description, features, stack, source, website, image
    FROM project WHERE id = $1;`,
    [projectId]
  );
  const [categoryRows, languageRows, toolRows] = await Promise.all(
    ["category", "language", "tool"].map(async (item) => {
      const { rows } = await pool.query(
        `SELECT name FROM ${item} 
        JOIN project_${item} ON project_${item}.${item}_id = ${item}.id
        WHERE project_id = $1
        ORDER BY id;`,
        [projectId]
      );
      return rows;
    })
  );
  const result = projectRows[0];
  result.category = categoryRows.map((row) => row.name);
  result.language = languageRows.map((row) => row.name);
  result.tool = toolRows.map((row) => row.name);
  return result;
}

// getProject(15).then((res) => console.log(res));

async function updateProject(
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
) {
  await pool.query(
    `UPDATE project 
    SET name = $1, description = $2, features = $3, stack = $4, source = $5, website = $6, image = $7
    WHERE id = $8;`,
    [name, description, features, stack, source, website, image, projectId]
  );
  await insertFilters(projectId, category, language, tool);
}

module.exports = {
  getAllFilters,
  getFilteredProjects,
  insertProject,
  getProject,
  updateProject,
};
