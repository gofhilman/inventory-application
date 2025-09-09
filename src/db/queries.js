// require("dotenv").config();
const pool = require("./pool");

const ITEMS_PER_PAGE = 10;

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
    SELECT DISTINCT project.id AS project_id, project.name, description, source, image, category.name AS category
    FROM project
    LEFT JOIN project_category ON project_category.project_id = project.id
    LEFT JOIN category ON category.id = project_category.category_id
  `;
  const filterSql = modFilters
    .map((item, index) => createFilter(index + 1, item.name))
    .join(` AND `);
  const closingSql = `
    ORDER BY project_id DESC;
  `;
  const sql = baseSql + (filterSql ? `WHERE ` + filterSql : ``) + closingSql;
  const { rows } = await pool.query(sql, sqlParams);
  return rows
    .reduce((acc, row) => {
      if (
        acc.length === 0 ||
        acc[acc.length - 1].project_id !== row.project_id
      ) {
        row.category = [row.category];
        acc.push(row);
      } else {
        acc[acc.length - 1].category.push(row.category);
      }
      return acc;
    }, [])
    .slice((page - 1) * ITEMS_PER_PAGE, page * ITEMS_PER_PAGE);
}

// getFilteredProjects(undefined, undefined, undefined, 2).then((res) =>
//   console.log(res)
// );

module.exports = { getAllFilters, getFilteredProjects };
