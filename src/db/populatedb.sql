CREATE TABLE IF NOT EXISTS project (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  description TEXT,
  features TEXT,
  stack TEXT,
  source TEXT,
  website TEXT,
  image TEXT
);

CREATE TABLE IF NOT EXISTS category (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT
);

CREATE TABLE IF NOT EXISTS language (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT
);

CREATE TABLE IF NOT EXISTS tool (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT
);

CREATE TABLE IF NOT EXISTS project_category (
  project_id INTEGER REFERENCES project(id) ON DELETE CASCADE,
  category_id INTEGER REFERENCES category(id) ON DELETE CASCADE,
  PRIMARY KEY (project_id, category_id)
);

CREATE TABLE IF NOT EXISTS project_language (
  project_id INTEGER REFERENCES project(id) ON DELETE CASCADE,
  language_id INTEGER REFERENCES language(id) ON DELETE CASCADE,
  PRIMARY KEY (project_id, language_id)
);

CREATE TABLE IF NOT EXISTS project_tool (
  project_id INTEGER REFERENCES project(id) ON DELETE CASCADE,
  tool_id INTEGER REFERENCES tool(id) ON DELETE CASCADE,
  PRIMARY KEY (project_id, tool_id)
);

INSERT INTO project (name, description, features, stack, source, website, image)
VALUES 
  (
    'Shopping List', 
    'A shopping list web where ones can add and remove items.',
    E'Add items\nRemove items',
    NULL, 
    'https://github.com/gofhilman/shopping-list', 
    'https://gofhilman.github.io/shopping-list/', 
    $1
  ),
  (
    'Odin Recipes', 
    'A simple food recipe website using HTML and CSS only. This is my first web development project.',
    E'Index page containing food recipe list\nRecipe pages in separated HTML',
    NULL,
    'https://github.com/gofhilman/odin-recipes',
    'https://gofhilman.github.io/odin-recipes/',
    $2
  ),
  (
    'Odin Landing Page',
    'My landing page using HTML and CSS only.',
    'CSS styling with flexbox',
    NULL,
    'https://github.com/gofhilman/odin-landing-page',
    'https://gofhilman.github.io/odin-landing-page/',
    $3
  ),
  (
    'Rock-Paper-Scissors Game',
    'A web-based rock-paper-scissors game. It features computer opponent using random selection in 5-round match.',
    E'Responsive design and interactive UI\nScore tracking for both player and computer\nRandomized computer moves for fair gameplay',
    NULL,
    'https://github.com/gofhilman/rock-paper-scissors',
    'https://gofhilman.github.io/rock-paper-scissors/',
    $4
  ),
  (
    'Etch-A-Sketch',
    'A web-based etch-a-sketch where ones can draw on the page based on the cursor movement. '
    || 'It features grid number customization, multi-color drawing, increased opacity based on stacking, and repeatable drawing.',
    'Grid number customization: Adjust the number of squares in the grid.'
    || E'\nMulti-color drawing: Choose from a variety of colors to draw.'
    || E'\nIncreased opacity: Stacking strokes increases the opacity of the color.'
    || E'\nRepeatable drawing: Easily reset and redraw on the canvas.',
    NULL,
    'https://github.com/gofhilman/etch-a-sketch',
    'https://gofhilman.github.io/etch-a-sketch/',
    $5
  ),
  (
    'Calculator',
    'A simple calculator web application that performs basic arithmetic operations. It is designed to be user-friendly and efficient.',
    'Error handling for invalid inputs and division by zero'
    || E'\nSupport for decimal numbers'
    || E'\nBackspace functionality to correct input errors'
    || E'\nPlus-minus toggle for changing the sign of a number',
    NULL,
    'https://github.com/gofhilman/calculator',
    'https://gofhilman.github.io/calculator/',
    $6
  ),
  (
    'Planet Table',
    'This provides a solution for a challenge by MDN to structure a planet data table.',
    'A table with multiple headings and subheadings',
    NULL,
    'https://github.com/gofhilman/planet-table',
    'https://gofhilman.github.io/planet-table/',
    $7
  ),
  (
    'High School Python',
    'An interactive teaching material for an introduction to data analysis with Python',
    E'A teaching material with concepts and problems+solutions\nInteractive material with python notebook',
    NULL,
    'https://github.com/gofhilman/high-school-python',
    'https://gofhilman.github.io/high-school-python/',
    $8
  ),
  (
    'Sign Up Form',
    'Sign up form page with HTML form validation about house music website.',
    E'Responsive and modern design\nHTML form validation on the client side',
    NULL,
    'https://github.com/gofhilman/sign-up-form',
    'https://gofhilman.github.io/sign-up-form/',
    $9
  ),
  (
    'Admin Dashboard',
    'A dashboard page with a visually appealing and functional interface for administrators using HTML and CSS only.',
    'Incorporate flexbox and grid design for modern looks',
    NULL,
    'https://github.com/gofhilman/admin-dashboard',
    'https://gofhilman.github.io/admin-dashboard/',
    $10
  ),
  (
    'Odin Library',
    'A simple web application that allows users to manage their personal book collection. '
    || 'Users can add books with details such as title, author, number of pages, and whether the book has been read. '
    || 'The application dynamically updates the book list and provides an option to remove books from the collection.',
    '<strong>Add Books</strong>: Users can add books by providing details like title, author, pages, and read status.'
    || E'\n<strong>Dynamic Table</strong>: Books are displayed in a table format with columns for title, author, pages, read status, and actions.'
    || E'\n<strong>Read Status</strong>: A checkbox allows users to mark whether a book has been read.'
    || E'\n<strong>Remove Books</strong>: Users can remove books from the collection using a "remove" button.'
    || E'\n<strong>Form Validation</strong>: Ensures that all required fields are filled before adding a book.',
    NULL,
    'https://github.com/gofhilman/odin-library',
    'https://gofhilman.github.io/odin-library/',
    $11
  ),
  (
    'Tic-Tac-Toe',
    'A simple implementation of the classic Tic-Tac-Toe game. '
    || 'The game allows two players to compete against each other by taking turns to mark spaces in a 3x3 grid. '
    || 'The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row wins the game.',
    '<strong>Player Name Input</strong>: Players can input their names before starting the game.'
    || E'\n<strong>Dynamic Turn Display</strong>: The game dynamically displays whose turn it is.'
    || E'\n<strong>Win and Draw Detection</strong>: The game detects and announces the winner or if the game ends in a draw.'
    || E'\n<strong>Interactive UI</strong>: Players can click on the grid to make their moves, and the game updates in real-time.'
    || E'\n<strong>Reset Functionality</strong>: Players can reset the game and start a new round easily.',
    NULL,
    'https://github.com/gofhilman/tic-tac-toe',
    'https://gofhilman.github.io/tic-tac-toe/',
    $12
  ),
  (
    'Image Carousel',
    'An image carousel package with an implementation example.',
    '<strong>Responsive Design</strong>: Automatically adjusts to the specified frame dimensions.'
    || E'\n<strong>Swipe Navigation</strong>: Includes left and right swipe functionality for easy navigation.'
    || E'\n<strong>Navigation Dots</strong>: Displays dots for each slide, allowing users to jump to specific slides.'
    || E'\n<strong>Auto-Cycling</strong>: Automatically cycles through slides at a configurable interval.'
    || E'\n<strong>Customizable</strong>: Easily configurable styles and behaviors.',
    NULL,
    'https://github.com/gofhilman/image-carousel',
    'https://www.npmjs.com/package/@gofhilman/image-carousel',
    $13
  ),
  (
    'Recursion',
    'Create Fibonacci sequence and merge sort functions based on recursion method.',
    '<code>fibs(seqNum)</code>: Generates a Fibonacci sequence iteratively up to the given number of terms.'
    || E'\n<code>fibsRec(seqNum)</code>: Generates a Fibonacci sequence recursively up to the given number of terms.'
    || E'\n<code>mergeSort(array)</code>: Implements the merge sort algorithm to sort an array of numbers in ascending order.'
    || E'\n<code>merge(sortedLeft, sortedRight)</code>: Merges two sorted arrays into a single sorted array.',
    NULL,
    'https://github.com/gofhilman/recursion',
    NULL,
    NULL
  ),
  (
    'Linked List',
    'This project creates a LinkedList class manually in JavaScript. The LinkedList class provides a dynamic data '
    || 'structure that allows for efficient insertion, deletion, and traversal of elements. Each node in the linked list '
    || 'contains a value and a reference to the next node, forming a chain-like structure.',
    '<code>append(value)</code>: Adds a new node with the specified value to the end of the list.'
    || E'\n<code>prepend(value)</code>: Adds a new node with the specified value to the beginning of the list.'
    || E'\n<code>size()</code>: Returns the total number of nodes in the list.'
    || E'\n<code>toHead()</code>: Returns the first node (head) of the list.'
    || E'\n<code>toTail()</code>: Returns the last node (tail) of the list.'
    || E'\n<code>at(index)</code>: Returns the node at the specified index.'
    || E'\n<code>pop()</code>: Removes the last node from the list.'
    || E'\n<code>contains(value)</code>: Checks if a node with the specified value exists in the list.'
    || E'\n<code>find(value)</code>: Returns the index of the node with the specified value, or <code>null</code> if not found.'
    || E'\n<code>toString()</code>: Returns a string representation of the linked list.',
    NULL,
    'https://github.com/gofhilman/linked-lists',
    NULL,
    NULL
  ),
  (
    'Hashmap',
    'This project creates a HashMap class manually in JavaScript, which is a data structure that maps keys to values. '
    || 'It uses a hashing function to determine the index for storing key-value pairs in an array of linked lists. '
    || 'The HashMap dynamically resizes itself when the load factor exceeds a certain threshold, ensuring efficient operations.',
    '<strong>Set Key-Value Pairs</strong>: Add or update key-value pairs in the hashmap.'
    || E'\n<strong>Get Values</strong>: Retrieve the value associated with a given key.'
    || E'\n<strong>Check Key Existence</strong>: Verify if a key exists in the hashmap.'
    || E'\n<strong>Remove Key-Value Pairs</strong>: Delete a key-value pair from the hashmap.'
    || E'\n<strong>Dynamic Resizing</strong>: Automatically resizes the hashmap when the load factor exceeds 0.75.'
    || E'\n<strong>Retrieve All Keys, Values, or Entries</strong>: Get all keys, values, or key-value pairs as arrays.'
    || E'\n<strong>Clear the HashMap</strong>: Reset the hashmap to its initial state.'
    || E'\n<strong>Customizable Capacity</strong>: Starts with an initial capacity of 16 and grows dynamically.',
    NULL,
    'https://github.com/gofhilman/hashmap',
    NULL,
    NULL
  ),
  (
    'Binary Search Trees',
    'This project creates a balanced Binary Search Tree (BST) manually in JavaScript. It includes various methods '
    || 'to manipulate and traverse the tree, ensuring efficient data storage and retrieval.',
    '<strong>Tree Construction</strong>: Build a balanced binary search tree from an array of unique values.'
    || E'\n<strong>Insertion and Deletion</strong>: Insert new values or delete existing ones while maintaining the BST properties.'
    || E'\n<strong>Traversal Methods</strong>: Supports level-order, in-order, pre-order, and post-order traversal.'
    || E'\n<strong>Tree Properties</strong>: Check if the tree is balanced and calculate the height and depth of nodes.'
    || E'\n<strong>Rebalancing</strong>: Automatically rebalances the tree when it becomes unbalanced.'
    || E'\n<strong>Visualization</strong>: Pretty-print the tree structure for better understanding.',
    NULL,
    'https://github.com/gofhilman/binary-search-trees',
    NULL,
    NULL
  ),
  (
    'Knights Travails',
    'Knights Travails is a program that calculates the shortest path for a knight on a chessboard to move from a starting position ' 
    || 'to a target position. It uses a graph-based approach to explore all possible moves and determine the optimal path.',
    'Calculates the shortest path for a knight on an 8x8 chessboard.'
    || E'\nDisplays the sequence of moves from the starting position to the target position.'
    || E'\nImplements a breadth-first search (BFS) algorithm for optimal pathfinding.'
    || E'\nEnsures all moves are within the bounds of the chessboard.',
    NULL,
    'https://github.com/gofhilman/knights-travails',
    NULL,
    NULL
  ),
  (
    'JavaScript Form Validation',
    'This project demonstrates basic form validation using JavaScript on client side. It ensures that user inputs meet specific criteria '
    || 'before allowing form submission. The validation is implemented dynamically, providing real-time feedback to users.',
    '<strong>Email Validation</strong>: Ensures the email field contains a valid email address.'
    || E'\n<strong>Country Field</strong>: Requires the country field to be filled.'
    || E'\n<strong>Postal Code Validation</strong>: Validates the postal code to be exactly 5 digits.'
    || E'\n<strong>Password Strength Check</strong>: Ensures the password contains at least one uppercase letter, one lowercase letter, and one number.'
    || E'\n<strong>Password Confirmation</strong>: Verifies that the password confirmation matches the original password.'
    || E'\n<strong>Real-Time Feedback</strong>: Provides immediate feedback on input validity.'
    || E'\n<strong>Custom Error Messages</strong>: Displays user-friendly error messages for invalid inputs.',
    NULL,
    'https://github.com/gofhilman/js-form-validation',
    'https://gofhilman.github.io/js-form-validation/',
    $14
  ),
  (
    'Testing Practice',
    'This project contains a collection of utility functions implemented using Test-Driven Development (TDD). '
    || 'Each function is thoroughly tested to ensure correctness and reliability.',
    '<strong>capitalize(string)</strong>: Capitalizes the first letter of a string.'  
    || E'\n<strong>reverseString(string)</strong>: Reverses the given string.'  
    || E'\n<strong>calculator</strong>: An object with methods for basic arithmetic operations: add(a, b), subtract(a, b), divide(a, b), and multiply(a, b).'
    || E'\n<strong>caesarCipher(string, shiftFactor)</strong>: Encodes a string using the Caesar cipher technique, preserving case and punctuation.'  
    || E'\n<strong>analyzeArray(array)</strong>: Analyzes an array and returns an object with the average, minimum, maximum, and length of the array.',
    '<strong>jest</strong>: A JavaScript testing framework used for writing and running unit tests with ease and flair.'  
    || E'\n<strong>babel</strong>: A JavaScript compiler that transforms modern code into backwards-compatible versions for diverse environments.',
    'https://github.com/gofhilman/testing-practice',
    NULL,
    NULL
  ),
  (
    'Webpack Front End Template',
    'This is a template for frontend package configurations using webpack.',
    'Pre-configured Webpack setup for development and production environments.'  
    || E'\nSupport for JavaScript and CSS bundling.'  
    || E'\nHot Module Replacement (HMR) for efficient development.'  
    || E'\nCode splitting and lazy loading for optimized performance.'  
    || E'\nAsset management for images and fonts.'  
    || E'\nBabel integration for modern JavaScript support.'  
    || E'\nESLint and Prettier for code quality and formatting.'  
    || E'\nTailwind CSS integration for utility-first styling.'  
    || E'\nJest for unit testing.'  
    || E'\nImage optimization using Imagemin plugins.',
    '<strong>Webpack</strong>: Module bundler for JavaScript applications.'  
    || E'\n<strong>Babel</strong>: JavaScript compiler to ensure compatibility with older browsers.'  
    || E'\n<strong>CSS Loaders</strong>: For processing and bundling CSS files.'  
    || E'\n<strong>PostCSS</strong>: For transforming CSS with JavaScript plugins.'  
    || E'\n<strong>Tailwind CSS</strong>: Utility-first CSS framework.'  
    || E'\n<strong>ESLint</strong>: For maintaining code quality and consistency.'  
    || E'\n<strong>Prettier</strong>: For code formatting.'  
    || E'\n<strong>Jest</strong>: For unit testing.'  
    || E'\n<strong>Imagemin</strong>: For optimizing images.',
    'https://github.com/gofhilman/webpack-frontend-template',
    NULL,
    NULL
  ),
  (
    'Restaurant Page',
    'Meater is a restaurant website that provides users with an interactive experience to explore the restaurant''s menu, '
    || 'contact details, and opening hours. The website is built with modular JavaScript and styled for a clean and modern look.',
    '<strong>Home Page</strong>: Displays the restaurant''s tagline and navigation options.'  
    || E'\n<strong>Menu Page</strong>: Showcases the restaurant''s menu items categorized into Breakfast, Lunch, and Dinner, along with nutritional information.'  
    || E'\n<strong>Contact Page</strong>: Provides the restaurant''s contact details and opening hours.'  
    || E'\n<strong>Responsive Design</strong>: Ensures the website is accessible on various devices.',
    '<strong>Webpack</strong>: Bundling and asset optimization.'  
    || E'\n<strong>Image Optimization</strong>: Utilized plugins like imagemin for optimized image loading.',
    'https://github.com/gofhilman/restaurant-page',
    'https://gofhilman.github.io/restaurant-page/',
    $15
  ),
  (
    'To Do List',
    'The To Do List application is a task management tool designed to help users organize their daily activities, prioritize tasks, and keep track of deadlines. '
    || 'It allows users to create projects, add tasks, set priorities, and manage task completion efficiently. '
    || 'The application is built with a focus on simplicity and usability, making it an ideal choice for personal productivity.',
    '<strong>Project Management</strong>: Create, rename, and delete projects to organize tasks.'  
    || E'\n<strong>Task Management</strong>: Add, edit, and delete tasks within projects.'  
    || E'\n<strong>Task Prioritization</strong>: Mark tasks as important to highlight them.'  
    || E'\n<strong>Due Dates</strong>: Assign due dates to tasks and view them in the "Planned" section.'  
    || E'\n<strong>Completion Tracking</strong>: Mark tasks as complete and view completed tasks separately.'  
    || E'\n<strong>Dynamic Updates</strong>: Automatically update the UI when tasks or projects are modified.'  
    || E'\n<strong>Persistent Storage</strong>: Save tasks and projects in local storage to retain data across sessions.'  
    || E'\n<strong>Predefined Lists</strong>: Access predefined lists like "My Day", "Important", and "Planned" for quick task categorization.',
    '<strong>Webpack</strong>: Module bundler for managing assets and dependencies.'  
    || E'\n<strong>Date-fns</strong>: Library for date manipulation.'  
    || E'\n<strong>Lodash</strong>: Utility library for JavaScript.',
    'https://github.com/gofhilman/todo-list',
    'https://gofhilman.github.io/todo-list/',
    $16
  ),
  (
    'Weather App',
    'WeatherApp allows users to search for weather information, pin locations, and view detailed weather forecasts. '
    || 'It features dynamic backgrounds, unit toggling, and real-time updates for an interactive user experience.',
    '<strong>Search Locations</strong>: Search for weather information by entering a location name.'  
    || E'\n<strong>Pinned Locations</strong>: Pin multiple locations for quick access.'  
    || E'\n<strong>Weekly Weather Forecast</strong>: View a 7-day weather forecast for the selected location.'  
    || E'\n<strong>Current Weather Details</strong>: Get detailed current weather information, including temperature, humidity, wind speed, and more.'  
    || E'\n<strong>Dynamic Backgrounds</strong>: Background updates dynamically based on the current weather conditions.'  
    || E'\n<strong>Unit Toggle</strong>: Switch between metric and imperial units for temperature and wind speed.'  
    || E'\n<strong>Real-Time Updates</strong>: Time and weather data update in real-time.',
    '<strong>Webpack</strong>: For bundling and managing assets.'  
    || E'\n<strong>date-fns</strong>: For date and time formatting.'  
    || E'\n<strong>Visual Crossing Weather API</strong>: For fetching weather data.'  
    || E'\n<strong>API Ninjas World Time API</strong>: For fetching real-time location-based time.',
    'https://github.com/gofhilman/weather-app',
    'https://gofhilman.github.io/weather-app/',
    $17
  ),
  (
    'Battleship Game',
    'The Battleship Game is a classic strategy game implemented as a web application. Players can compete against a computer '
    || 'or another human player by strategically placing their ships on a grid and taking turns to attack the opponent''s grid. '
    || 'The game ends when all ships of one player are sunk.',
    '<strong>Single-player mode</strong>: Play against a computer opponent with intelligent attack strategies, including the use of the Breadth-First Search (BFS) algorithm for targeted attacks.'  
    || E'\n<strong>Multiplayer mode</strong>: Play against another human player on the same device.'  
    || E'\n<strong>Ship placement</strong>: Drag and drop ships onto the grid or randomize their positions.'  
    || E'\n<strong>Game status tracking</strong>: Visual indicators for hits, misses, and ship statuses.'  
    || E'\n<strong>Game reset</strong>: Easily restart the game after completion.'  
    || E'\n<strong>Responsive design</strong>: Optimized for various screen sizes.',
    '<strong>Build Tools</strong>: Webpack'  
    || E'\n<strong>Testing</strong>: Jest'  
    || E'\n<strong>State Management</strong>: PubSub-JS',
    'https://github.com/gofhilman/battleship',
    'https://gofhilman.github.io/battleship/',
    $18
  ),
  (
    'FMR Analysis',
    'A MATLAB-based program designed to analyze raw ferromagnetic resonance (FMR) measurement data with precision and flexibility. '
    || 'The fmr-analysis program is tailored for researchers and engineers working with ferromagnetic materials. '
    || 'It provides tools to process, visualize, and interpret FMR measurement data, enabling users to extract meaningful insights efficiently. '
    || 'The program is designed to handle large datasets and offers customizable analysis workflows to suit diverse experimental setups.',
    '<strong>Data Import</strong>: Supports various raw data formats for seamless integration.'  
    || E'\n<strong>Data Processing</strong>: Includes noise reduction, baseline correction, and normalization tools.'  
    || E'\n<strong>Visualization</strong>: Generates high-quality plots for data interpretation.'  
    || E'\n<strong>Customizable Workflows</strong>: Allows users to define and modify analysis pipelines.'  
    || E'\n<strong>Batch Processing</strong>: Handles multiple datasets simultaneously to save time.'  
    || E'\n<strong>Export Options</strong>: Outputs processed data and visualizations in multiple formats.',
    E'Signal Processing Toolbox\nCurve Fitting Toolbox',
    'https://github.com/gofhilman/fmr-analysis',
    NULL,
    NULL
  ),
  (
    'Multiple Sphere T-Matrix',
    'A computational study exploring how different particle configurations affect optical scattering characteristics. '
    || 'This project uses Multiple Sphere T-Matrix (MSTM) method to simulate light interaction with spherical aggregates, '
    || 'enabling precise analysis of extinction spectra and scattering behavior. The simulations provide insight '
    || 'into how structural geometry influences optical response, with potential applications in nanophotonics and material science.',
    'Efficient computation of scattering properties for multiple spheres.'  
    || E'\nSupport for various sphere configurations and material properties.'  
    || E'\nHigh accuracy using the T-Matrix method.'  
    || E'\nCustomizable parameters for advanced simulations.'  
    || E'\nDetailed output for analysis and visualization.',
    NULL,
    'https://github.com/gofhilman/mstm',
    NULL,
    NULL
  ),
  (
    'Home Page',
    'This project is a personal portfolio website designed to highlight my skills and projects. '
    || 'It includes interactive elements such as typing animations, embedded YouTube videos, and smooth scrolling navigation. '
    || 'The website is fully responsive and optimized for various devices.',
    '<strong>Typing Animations</strong>: Dynamic typing effects for the header and introduction sections.'  
    || E'\n<strong>Embedded Videos</strong>: Featured projects include embedded YouTube videos that play/pause based on scroll visibility.'  
    || E'\n<strong>Responsive Design</strong>: Adapts seamlessly to different screen sizes and devices.'  
    || E'\n<strong>Smooth Navigation</strong>: Scroll-smooth functionality for a better user experience.',
    '<strong>Build Tools</strong>: Webpack'  
    || E'\n<strong>Styling</strong>: Tailwind CSS, PostCSS'  
    || E'\n<strong>Optimization</strong>: Imagemin',
    'https://github.com/gofhilman/homepage',
    'https://gofhilman.github.io/homepage/',
    $19
  ),
  (
    'Vite + React Template',
    'This is a template for building React applications using Vite. '
    || 'It includes a set of tools and configurations tailored for efficient development and production workflows.',
    'Fast development server with Vite.'  
    || E'\nReact 19 for building user interfaces.'  
    || E'\nTailwind CSS for styling with utility-first classes.'  
    || E'\nPrettier and ESLint for code formatting and linting.'  
    || E'\nVitest for fast and reliable testing.'  
    || E'\nReact Router for client-side routing.'  
    || E'\nOptimized image handling via vite-plugin-image-optimizer.',
    '<strong>Frontend</strong>: React, Tailwind CSS'  
    || E'\n<strong>Build Tool</strong>: Vite'  
    || E'\n<strong>Testing</strong>: Vitest, Testing Library'  
    || E'\n<strong>Linting/Formatting</strong>: ESLint, Prettier'  
    || E'\n<strong>Other Tools</strong>: clsx, lucide-react, modern-normalize, svgo',
    'https://github.com/gofhilman/vite-react-template',
    NULL,
    NULL
  ),
  (
    'CV Application',
    'This is a React-based CV application that allows users to create and preview their CVs dynamically. '
    || 'Users can input their personal, educational, and professional details, and the application provides a live preview of the CV. '
    || 'The application also supports theme customization.',
    'Dynamic form sections for Profile, Contact, Education, and Experience.'  
    || E'\nLive preview of the CV as the user inputs data.'  
    || E'\nTheme customization with multiple color options.'  
    || E'\nResponsive design for various screen sizes.',
    '<strong>Frontend</strong>: React, TailwindCSS'  
    || E'\n<strong>Build Tool</strong>: Vite'  
    || E'\n<strong>Additional Libraries</strong>: html2canvas for capturing screenshots, jspdf for generating PDF files, and modern-normalize for CSS normalization'  
    || E'\n<strong>Development Tools</strong>: Prettier, ESLint',
    'https://github.com/gofhilman/cv-application',
    'https://cv-application-epd.pages.dev/',
    $20
  ),
  (
    'Pokémon Memory Card Game',
    'The Pokémon Memory Card Game is a fun and interactive web application where players test their memory '
    || 'by selecting Pokémon cards without repeating their choices. The game dynamically fetches Pokémon data from an API.',
    '<strong>Dynamic Pokémon Cards</strong>: Fetches Pokémon data from the PokéAPI to display unique cards'  
    || E'\n<strong>Scoreboard</strong>: Tracks the current score and the best score achieved'  
    || E'\n<strong>Responsive Design</strong>: Optimized for various screen sizes'  
    || E'\n<strong>Randomized Gameplay</strong>: Ensures no two games are the same by randomizing the Pokémon cards',
    '<strong>Frontend</strong>: React.js'  
    || E'\n<strong>Styling</strong>: Tailwind CSS'  
    || E'\n<strong>Build Tool</strong>: Vite'  
    || E'\n<strong>API</strong>: PokéAPI'  
    || E'\n<strong>Utilities</strong>: Prettier, ESLint',
    'https://github.com/gofhilman/memory-card',
    'https://memory-card-4lo.pages.dev/',
    $21
  ),
  (
    'ShopShop',
    'A mock shopping website that allows users to browse products, add them to a cart, and simulate a shopping experience. '
    || 'The app features a responsive design and a user-friendly interface.',
    '<strong>Product Listing</strong>: Browse a variety of products fetched from a mock API.'  
    || E'\n<strong>Search Functionality</strong>: Fuzzy search powered by Fuse.js for quick product discovery.'  
    || E'\n<strong>Shopping Cart</strong>: Add, remove, and view items in the cart with real-time updates.'  
    || E'\n<strong>Category Filtering</strong>: Filter products by categories.'  
    || E'\n<strong>Pagination</strong>: Navigate through products with pagination.'  
    || E'\n<strong>Responsive Design</strong>: Optimized for both desktop and mobile devices.'  
    || E'\n<strong>Error Handling</strong>: Graceful error pages for better user experience.',
    '<strong>React 19</strong>: UI library for building interactive interfaces'  
    || E'\n<strong>Vite</strong>: Fast build tool and dev server'  
    || E'\n<strong>React Router v7</strong>: Declarative routing'  
    || E'\n<strong>Tailwind CSS v4</strong>: Utility-first CSS framework'  
    || E'\n<strong>shadcn/ui</strong>: Component library built on Radix UI and Tailwind CSS'  
    || E'\n<strong>Fuse.js</strong>: Fuzzy search functionality'  
    || E'\n<strong>Vitest</strong>: Unit testing framework'  
    || E'\n<strong>Testing Library</strong>: DOM-centric testing utilities'  
    || E'\n<strong>ESLint + Prettier</strong>: Code linting and formatting',
    'https://github.com/gofhilman/shopping-cart',
    'https://shopping-cart-b3g.pages.dev/',
    $22
  ),
  (
    'Next.js Dashboard App',
    'The Next.js Dashboard App is a full-stack application designed to provide a modern and responsive dashboard interface using Next.js. '
    || 'It is built using Next.js and integrates various features to manage and display data effectively.',
    'User authentication and authorization'  
    || E'\nDynamic routing and server-side rendering'  
    || E'\nDashboard with key metrics and visualizations'  
    || E'\nCustomer and invoice management'  
    || E'\nSearch functionality with pagination'  
    || E'\nResponsive design for mobile and desktop'  
    || E'\nLoading skeletons for better user experience',
    '<strong>Frontend</strong>: Next.js, React, Tailwind CSS'  
    || E'\n<strong>Backend</strong>: Node.js, PostgreSQL'  
    || E'\n<strong>Database</strong>: PostgreSQL'  
    || E'\n<strong>Styling</strong>: Tailwind CSS'  
    || E'\n<strong>State Management</strong>: React Context API'  
    || E'\n<strong>Other Tools</strong>: Vercel for deployment',
    'https://github.com/gofhilman/nextjs-dashboard-app',
    'https://nextjs-dashboard-app-kappa-beryl.vercel.app',
    $23
  ),
  (
    'Basic Informational Site',
    'This is a basic informational site built using Express server. It serves as a simple example of a static website with multiple pages, '
    || 'including a homepage, an about page, a contact page, and a 404 error page.',
    '<strong>Homepage</strong>: Provides an overview of the site and links to other pages.'  
    || E'\n<strong>404 Page</strong>: A custom error page for non-existent routes.'  
    || E'\n<strong>Express.js Server</strong>: Serves the HTML files dynamically.',
    '<strong>Backend</strong>: Node.js with Express.js'  
    || E'\n<strong>File System</strong>: Node.js fs module for reading HTML files',
    'https://github.com/gofhilman/basic-informational-site',
    'https://basic-informational-site-1r1b.onrender.com/',
    $24
  ),
  (
    'Mini Message Board',
    'The Mini Message Board is a simple web application that allows users to post messages with their name and view messages posted by others.',
    'View all messages on the homepage.'  
    || E'\nPost a new message with a name and content.'  
    || E'\nView details of individual messages.'  
    || E'\nForm validation to ensure proper input.',
    '<strong>Backend</strong>: Node.js, Express'  
    || E'\n<strong>Frontend</strong>: EJS (Embedded JavaScript Templates), CSS'  
    || E'\n<strong>Database</strong>: PostgreSQL'  
    || E'\n<strong>Utilities</strong>: date-fns for formatting dates, express-validator for input validation',
    'https://github.com/gofhilman/mini-message-board',
    'https://mini-message-board-9bsr.onrender.com/',
    $25
  ),
  (
    'Gerak Parabola',
    'Proyek ini mensimulasikan gerak parabola dalam berbagai kondisi fisik, seperti tanpa gesekan udara, dengan gesekan udara, '
    || 'dipengaruhi gerakan angin, dan kombinasi dari gesekan udara dan gerakan angin. Simulasi ini '
    || 'bertujuan untuk mempelajari pengaruh berbagai faktor terhadap lintasan benda yang ditembakkan pada sudut tertentu.',
    'Simulasi gerak parabola tanpa gesekan udara.'  
    || E'\nSimulasi gerak parabola dengan gesekan udara.'  
    || E'\nSimulasi gerak parabola yang dipengaruhi oleh gerakan angin.'  
    || E'\nSimulasi gerak parabola dengan kombinasi gesekan udara dan gerakan angin.',
    NULL,
    'https://github.com/gofhilman/parabolic-motion',
    NULL,
    NULL
  ),
  (
    'Regresi',
    'Proyek ini bertujuan untuk melakukan analisis regresi menggunakan dataset yang tersedia. '
    || 'Analisis regresi digunakan untuk memprediksi nilai berdasarkan hubungan antara variabel independen dan dependen.',
    'Analisis data menggunakan pandas'  
    || E'\nVisualisasi data menggunakan matplotlib'  
    || E'\nImplementasi model regresi'  
    || E'\nEvaluasi performa model',
    '<strong>Pandas</strong>: Library for data manipulation and analysis'  
    || E'\n<strong>Matplotlib</strong>: Visualization library for creating static, animated, and interactive plots'  
    || E'\n<strong>Scikit-learn</strong>: Machine learning library for classification, regression, and clustering',
    'https://github.com/gofhilman/regression',
    NULL,
    NULL
  ),
  (
    'Klasifikasi dengan EMNIST dan Gambar Pindai',
    'Proyek ini bertujuan untuk mengembangkan model klasifikasi menggunakan dataset EMNIST dan gambar hasil pindai. '
    || 'Model ini dilatih untuk mengenali karakter dan angka dari dataset EMNIST serta gambar yang telah diproses.',
    '<strong>Persiapan Dataset</strong>: Menggunakan dataset EMNIST untuk pelatihan dan gambar hasil pindai untuk pengujian.'  
    || E'\n<strong>Visualisasi Data</strong>: Menampilkan gambar dari dataset dan hasil prediksi.'  
    || E'\n<strong>Klasifikasi dengan SGDClassifier</strong>: Menggunakan Stochastic Gradient Descent untuk klasifikasi.'  
    || E'\n<strong>Evaluasi Model</strong>: Menggunakan matriks kebingungan dan validasi silang.'  
    || E'\n<strong>Visualisasi t-SNE</strong>: Menampilkan distribusi data dalam ruang 2D menggunakan t-SNE.',
    '<strong>NumPy</strong>: Fundamental package for numerical computing in Python'  
    || E'\n<strong>Matplotlib</strong>: Library for creating static, animated, and interactive visualizations'  
    || E'\n<strong>Scikit-learn</strong>: Machine learning library for classification, regression, and clustering'  
    || E'\n<strong>PIL (Pillow)</strong>: Image processing library for opening, manipulating, and saving images'  
    || E'\n<strong>mlxtend</strong>: Extension library for machine learning and data science utilities',
    'https://github.com/gofhilman/classification',
    NULL,
    NULL
  ),
  (
    'Prediksi Seedling',
    'Proyek ini bertujuan untuk memprediksi pertumbuhan seedling berdasarkan data yang tersedia. '
    || 'Model prediksi dikembangkan menggunakan data historis dan teknik pembelajaran mesin.',
    'Prediksi pertumbuhan seedling berdasarkan parameter tertentu.'  
    || E'\nVisualisasi hasil prediksi.'  
    || E'\nLog pelatihan model untuk setiap sesi.'  
    || E'\nHasil prediksi dan pengajuan dalam format yang mudah diakses.',
    '<strong>Pandas</strong>: Library for data manipulation and analysis using labeled data structures'  
    || E'\n<strong>NumPy</strong>: Core library for numerical operations and array processing'  
    || E'\n<strong>Scikit-learn</strong>: Machine learning toolkit for classification, regression, and clustering'  
    || E'\n<strong>Matplotlib</strong>: Visualization library for creating static, animated, and interactive plots'  
    || E'\n<strong>Seaborn</strong>: High-level interface for statistical data visualization built on Matplotlib',
    'https://github.com/gofhilman/seedling-prediction',
    NULL,
    NULL
  ),
  (
    'Klasifikasi CNN',
    'Proyek ini bertujuan untuk mengembangkan model Convolutional Neural Network (CNN) untuk melakukan klasifikasi gambar. '
    || 'Model ini dirancang untuk mengenali berbagai kategori gambar dengan akurasi tinggi.',
    'Preprocessing data gambar.'  
    || E'\nArsitektur CNN yang dapat disesuaikan.'  
    || E'\nPelatihan model dengan visualisasi metrik.'  
    || E'\nEvaluasi model pada dataset uji.'  
    || E'\nKemampuan untuk menyimpan dan memuat model terlatih.',
    '<strong>TensorFlow/Keras</strong>: Framework for building and training deep learning models efficiently'  
    || E'\n<strong>NumPy</strong>: Core library for numerical operations and array manipulation in Python'  
    || E'\n<strong>Matplotlib</strong>: Visualization library for creating static, animated, and interactive plots'  
    || E'\n<strong>OpenCV</strong>: Open-source library for image processing and computer vision tasks',
    'https://github.com/gofhilman/cnn-classification',
    NULL,
    NULL
  );

INSERT INTO category (name)
VALUES
  ('featured'),
  ('front end'),
  ('back end'),
  ('fullstack'),
  ('vanilla'),
  ('web development'),
  ('game'),
  ('tool'),
  ('utility'),
  ('data structure and algorithm'),
  ('package'),
  ('template'),
  ('data analysis'),
  ('simulation'),
  ('machine learning');

INSERT INTO language (name)
VALUES
  ('JavaScript'),
  ('TypeScript'),
  ('Python'),
  ('MATLAB'),
  ('Mathematica'),
  ('Fortran'),
  ('SQL'),
  ('C++');

INSERT INTO tool (name)
VALUES
  ('Jest'),
  ('Babel'),
  ('Webpack'),
  ('PostCSS'),
  ('Tailwind CSS'),
  ('date-fns'),
  ('PubSubJS'),
  ('React'),
  ('Vite'),
  ('Vitest'),
  ('Testing Library'),
  ('React Router'),
  ('shadcn/ui'),
  ('Fuse.js'),
  ('Next.js'),
  ('Node.js'),
  ('PostgreSQL'),
  ('React Context API'),
  ('Express.js'),
  ('EJS'),
  ('express-validator'),
  ('Pandas'),
  ('Matplotlib'),
  ('scikit-learn'),
  ('NumPy'),
  ('Pillow'),
  ('mlxtend'),
  ('Seaborn'),
  ('TensorFlow/Keras'),
  ('OpenCV');

WITH pair (project, category) AS (
  VALUES
    ('Shopping List', 'front end'),
    ('Shopping List', 'vanilla'),
    ('Shopping List', 'web development'),
    ('Shopping List', 'tool'),
    ('Odin Recipes', 'front end'),
    ('Odin Recipes', 'vanilla'),
    ('Odin Recipes', 'web development'),
    ('Odin Landing Page', 'front end'),
    ('Odin Landing Page', 'vanilla'),
    ('Odin Landing Page', 'web development'),
    ('Rock-Paper-Scissors Game', 'front end'),
    ('Rock-Paper-Scissors Game', 'vanilla'),
    ('Rock-Paper-Scissors Game', 'web development'),
    ('Rock-Paper-Scissors Game', 'game'),
    ('Etch-A-Sketch', 'front end'),
    ('Etch-A-Sketch', 'vanilla'),
    ('Etch-A-Sketch', 'web development'),
    ('Etch-A-Sketch', 'tool'),
    ('Calculator', 'front end'),
    ('Calculator', 'vanilla'),
    ('Calculator', 'web development'),
    ('Calculator', 'tool'),
    ('Planet Table', 'front end'),
    ('Planet Table', 'vanilla'),
    ('Planet Table', 'web development'),
    ('High School Python', 'data analysis'),
    ('Sign Up Form', 'front end'),
    ('Sign Up Form', 'vanilla'),
    ('Sign Up Form', 'web development'),
    ('Admin Dashboard', 'front end'),
    ('Admin Dashboard', 'vanilla'),
    ('Admin Dashboard', 'web development'),
    ('Odin Library', 'front end'),
    ('Odin Library', 'vanilla'),
    ('Odin Library', 'web development'),
    ('Odin Library', 'tool'),
    ('Tic-Tac-Toe', 'front end'),
    ('Tic-Tac-Toe', 'vanilla'),
    ('Tic-Tac-Toe', 'web development'),
    ('Tic-Tac-Toe', 'game'),
    ('Image Carousel', 'front end'),
    ('Image Carousel', 'vanilla'),
    ('Image Carousel', 'web development'),
    ('Image Carousel', 'utility'),
    ('Image Carousel', 'package'),
    ('Recursion', 'vanilla'),
    ('Recursion', 'utility'),
    ('Recursion', 'data structure and algorithm'),
    ('Linked List', 'vanilla'),
    ('Linked List', 'utility'),
    ('Linked List', 'data structure and algorithm'),
    ('Hashmap', 'vanilla'),
    ('Hashmap', 'utility'),
    ('Hashmap', 'data structure and algorithm'),
    ('Binary Search Trees', 'featured'),
    ('Binary Search Trees', 'vanilla'),
    ('Binary Search Trees', 'utility'),
    ('Binary Search Trees', 'data structure and algorithm'),
    ('Knights Travails', 'vanilla'),
    ('Knights Travails', 'utility'),
    ('Knights Travails', 'data structure and algorithm'),
    ('JavaScript Form Validation', 'front end'),
    ('JavaScript Form Validation', 'vanilla'),
    ('JavaScript Form Validation', 'web development'),
    ('Testing Practice', 'vanilla'),
    ('Testing Practice', 'utility'),
    ('Webpack Front End Template', 'front end'),
    ('Webpack Front End Template', 'web development'),
    ('Webpack Front End Template', 'template'),
    ('Restaurant Page', 'front end'),
    ('Restaurant Page', 'vanilla'),
    ('Restaurant Page', 'web development'),
    ('To Do List', 'featured'),
    ('To Do List', 'front end'),
    ('To Do List', 'vanilla'),
    ('To Do List', 'web development'),
    ('To Do List', 'tool'),
    ('Weather App', 'featured'),
    ('Weather App', 'front end'),
    ('Weather App', 'vanilla'),
    ('Weather App', 'web development'),
    ('Weather App', 'tool'),
    ('Battleship Game', 'featured'),
    ('Battleship Game', 'front end'),
    ('Battleship Game', 'vanilla'),
    ('Battleship Game', 'web development'),
    ('Battleship Game', 'game'),
    ('FMR Analysis', 'tool'),
    ('FMR Analysis', 'data analysis'),
    ('Multiple Sphere T-Matrix', 'tool'),
    ('Multiple Sphere T-Matrix', 'data analysis'),
    ('Multiple Sphere T-Matrix', 'simulation'),
    ('Home Page', 'featured'),
    ('Home Page', 'front end'),
    ('Home Page', 'vanilla'),
    ('Home Page', 'web development'),
    ('Vite + React Template', 'front end'),
    ('Vite + React Template', 'web development'),
    ('Vite + React Template', 'template'),
    ('CV Application', 'featured'),
    ('CV Application', 'front end'),
    ('CV Application', 'web development'),
    ('CV Application', 'tool'),
    ('Pokémon Memory Card Game', 'front end'),
    ('Pokémon Memory Card Game', 'web development'),
    ('Pokémon Memory Card Game', 'game'),
    ('ShopShop', 'featured'),
    ('ShopShop', 'front end'),
    ('ShopShop', 'web development'),
    ('Next.js Dashboard App', 'fullstack'),
    ('Next.js Dashboard App', 'web development'),
    ('Next.js Dashboard App', 'tool'),
    ('Basic Informational Site', 'back end'),
    ('Basic Informational Site', 'web development'),
    ('Mini Message Board', 'fullstack'),
    ('Mini Message Board', 'web development'),
    ('Gerak Parabola', 'vanilla'),
    ('Gerak Parabola', 'simulation'),
    ('Regresi', 'data analysis'),
    ('Regresi', 'machine learning'),
    ('Klasifikasi dengan EMNIST dan Gambar Pindai', 'data analysis'),
    ('Klasifikasi dengan EMNIST dan Gambar Pindai', 'machine learning'),
    ('Prediksi Seedling', 'data analysis'),
    ('Prediksi Seedling', 'machine learning'),
    ('Klasifikasi CNN', 'data analysis'),
    ('Klasifikasi CNN', 'machine learning')
)
INSERT INTO project_category (project_id, category_id)
SELECT project.id, category.id
FROM pair
JOIN project ON project.name = pair.project
JOIN category ON category.name = pair.category
WHERE NOT EXISTS (
  SELECT 1 FROM project_category
  WHERE project_category.project_id = project.id
    AND project_category.category_id = category.id
);

WITH pair (project, language) AS (
  VALUES
    (),
    (),
)
