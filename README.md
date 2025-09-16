# Hilman's Project Inventory

Hilman's Project Inventory is a web application designed to showcase and manage a collection of projects. It allows users to view project details, filter projects by categories, languages, and tools, and perform CRUD operations on the projects. The application is built with a focus on simplicity, usability, and scalability.

Live: <https://inventory-application-production-d04e.up.railway.app/>

## Features

- **Project Management**: Add, edit, and delete projects with detailed information.
- **Filtering**: Filter projects by category, language, and tool.
- **Pagination**: Navigate through projects with pagination for better user experience.
- **Dynamic Tags**: Display categories, languages, and tools as tags for each project.
- **Validation**: Form validation for adding and editing projects.
- **Admin Authentication**: Password-protected actions for creating, editing, and deleting projects.

## Tech Stack

- **EJS**: Embedded JavaScript templates for dynamic rendering.
- **CSS**: Tailwind-inspired custom styles for a modern UI.
- **Node.js**: JavaScript runtime for server-side development.
- **Express.js**: Web framework for building the application.
- **PostgreSQL**: Relational database for storing project data.
- **express-validator**: Middleware for form validation.
- **dotenv**: Environment variable management.
- **pg**: PostgreSQL client for Node.js.

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/gofhilman/inventory-application.git
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Set up the database:
   - Create a PostgreSQL database.
   - Configure the `.env` file with the database connection string.
   - Seed the database:

     ```bash
     node db/populatedb.js <DATABASE_URL>
     ```

4. Start the application:

   ```bash
   npm start
   ```

5. Access the application at `http://localhost:3000`.

## To Do

- Add responsive design
