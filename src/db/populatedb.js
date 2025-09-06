const { argv } = require("node:process");
const { Client } = require("pg");
const fs = require("node:fs/promises");
const path = require("node:path");

async function nameImages(imageNumber) {
  const imageNames = [];
  for (let tens = 0; tens <= Math.floor(imageNumber / 10); tens++) {
    for (let units = 0; units < 10; units++) {
      const currentNumber = tens * 10 + units;
      if (currentNumber === 0 || currentNumber > imageNumber) continue;
      imageNames.push(`${tens}${units}.png`);
    }
  }
  return imageNames;
}

async function main() {
  console.log("seeding...");
  const client = new Client({
    connectionString: argv[2],
  });
  await client.connect();
  const tables = await fs.readFile(path.join(__dirname, "tables.sql"), {
    encoding: "utf8",
  });
  const project = await fs.readFile(path.join(__dirname, "project.sql"), {
    encoding: "utf8",
  });
  const rest = await fs.readFile(path.join(__dirname, "rest.sql"), {
    encoding: "utf8",
  });
  const imageNames = await nameImages(25);
  await client.query(tables);
  await client.query(project, imageNames);
  await client.query(rest);
  await client.end();
  console.log("done");
}

main();
