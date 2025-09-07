const pool = require("./pool");

async function getQueryNameList(sql) {
  const { rows } = await pool.query(sql);
  return rows.map((row) => row.name);
}

async function getAllFilters() {
  const [categories, languages, tools] = await Promise.all([
    getQueryNameList(`SELECT name FROM category`),
    getQueryNameList(`SELECT name FROM language`),
    getQueryNameList(`SELECT name FROM tool`),
  ]);
  return { categories, languages, tools };
}

async function getFilteredProjects(category, language, tool) {
  
}

module.exports = { getAllFilters };
