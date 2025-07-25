# 🚀 LazyVim Configuration for TypeScript/React/Express Development

This is a comprehensive LazyVim configuration optimized for TypeScript, React, and Express development. It includes all the necessary language servers, formatters, linters, and productivity tools for modern full-stack JavaScript/TypeScript development.

## 🔧 Features

### Language Support
- **TypeScript** - Full LSP support with type checking, auto-completion, and refactoring
- **React/JSX** - Enhanced JSX support with auto-closing tags and better syntax highlighting
- **Express** - Node.js server development with proper IntelliSense
- **JSON/JSONC** - Enhanced JSON support with schema validation
- **CSS/SCSS** - Styling support with auto-completion
- **Tailwind CSS** - Utility-first CSS framework support
- **HTML** - Full HTML language support

### Development Tools
- **ESLint** - JavaScript/TypeScript linting with auto-fix
- **Prettier** - Code formatting with automatic formatting on save
- **Package.json** - Enhanced package management with version info
- **REST Client** - Built-in HTTP client for API testing
- **Database UI** - Database management and querying interface
- **Git Integration** - Enhanced git workflow with blame, status, and more
- **Terminal** - Integrated terminal for running dev servers and commands

### Productivity Features
- **Auto-completion** - Intelligent code completion with emoji support
- **Snippets** - Pre-configured snippets for React components, Express routes, and more
- **Auto-import** - Automatic import organization and unused import removal
- **File Navigation** - Enhanced file finding with project-specific searches
- **Diagnostics** - Real-time error and warning display
- **Inlay Hints** - Type information display inline with code

## 📦 Included Plugins

### Core Language Support
- `lazyvim.plugins.extras.lang.typescript` - TypeScript language support
- `lazyvim.plugins.extras.lang.json` - JSON support
- `lazyvim.plugins.extras.lang.tailwind` - Tailwind CSS support
- `lazyvim.plugins.extras.formatting.prettier` - Prettier formatting
- `lazyvim.plugins.extras.linting.eslint` - ESLint linting

### Development Tools
- `nvim-treesitter` - Enhanced syntax highlighting
- `nvim-lspconfig` - Language server configuration
- `mason.nvim` - Package manager for LSP servers
- `nvim-cmp` - Auto-completion engine
- `telescope.nvim` - Fuzzy finder and search
- `neo-tree.nvim` - File explorer
- `toggleterm.nvim` - Terminal integration
- `gitsigns.nvim` - Git integration
- `package-info.nvim` - Package.json management
- `nvim-ts-autotag` - Auto-closing HTML/JSX tags
- `rest.nvim` - REST client
- `vim-dadbod` - Database interface

## ⌨️ Key Mappings

### TypeScript/React Development
- `<leader>co` - Organize imports
- `<leader>cR` - Rename file
- `<leader>cu` - Remove unused imports
- `<leader>cF` - Fix all TypeScript issues
- `<leader>cA` - Add missing imports

### Package Management
- `<leader>ns` - Show package info
- `<leader>nt` - Toggle package info
- `<leader>nu` - Update package
- `<leader>nd` - Delete package
- `<leader>ni` - Install package

### Terminal & Development
- `<leader>tn` - Toggle horizontal terminal
- `<leader>tf` - Toggle floating terminal
- `<leader>tv` - Toggle vertical terminal
- `<leader>rs` - Start dev server (`npm start`)
- `<leader>rb` - Build project (`npm run build`)
- `<leader>rt` - Run tests (`npm test`)
- `<leader>rd` - Run dev command (`npm run dev`)
- `<leader>rl` - Run linter (`npm run lint`)

### File Navigation
- `<leader>fs` - Find in source directory
- `<leader>fC` - Find components
- `<leader>fP` - Find pages/routes
- `<leader>fN` - Find in node_modules
- `<leader>fc` - Find config files

### Git Integration
- `<leader>gf` - Find git files
- `<leader>gc` - Git commits
- `<leader>gb` - Git branches
- `<leader>gs` - Git status

### REST Client
- `<leader>rr` - Run REST request
- `<leader>rp` - Preview REST request
- `<leader>rl` - Re-run last request

### Database
- `<leader>db` - Toggle database UI

### LSP
- `<leader>li` - LSP info
- `<leader>lr` - LSP restart
- `<leader>ld` - Go to definition
- `<leader>lR` - Find references
- `<leader>lI` - Go to implementation

## 🎨 Snippets

### React Components
- `rfc` - React functional component with TypeScript
- `rhook` - Custom React hook template

### Express Development
- `route` - Express route handler
- `middleware` - Express middleware
- `controller` - Express controller
- `schema` - Mongoose schema

### TypeScript
- `interface` - TypeScript interface
- `type` - TypeScript type
- `afn` - Async function
- `try` - Try-catch block
- `class` - TypeScript class

## 🔧 Configuration

### Auto-commands
- **Auto-format** - Formats TypeScript/JavaScript files on save
- **Auto-organize imports** - Organizes imports on save for TypeScript files
- **Auto-remove unused imports** - Removes unused imports on save
- **Project root detection** - Automatically changes to project root
- **Config file watchers** - Notifications when config files change

### File Associations
- `.ts`, `.tsx` - TypeScript files
- `.js`, `.jsx` - JavaScript files
- `.json`, `.jsonc` - JSON files with comments
- `.env*` - Environment files
- Config files - Various configuration file types

### Development Settings
- **Indentation** - 2 spaces for web development
- **Line length** - 80/120 character guides
- **Auto-completion** - Enhanced completion with emoji support
- **Diagnostics** - Real-time error display
- **Performance** - Optimized for large projects

## 🚀 Getting Started

1. **Install LazyVim** (if not already installed):
   ```bash
   git clone https://github.com/LazyVim/starter ~/.config/nvim
   ```

2. **Replace configuration** with this setup (already done!)

3. **Start Neovim** and let LazyVim install all plugins:
   ```bash
   nvim
   ```

4. **Install Node.js tools** (if not already installed):
   ```bash
   npm install -g typescript
   npm install -g @types/node
   ```

5. **Create a new project** or open an existing one:
   ```bash
   cd your-project
   nvim .
   ```

## 🛠️ Usage Examples

### Creating a React Component
1. Create a new `.tsx` file
2. Type `rfc` and press Tab
3. The component template will be inserted with proper TypeScript typing

### Testing APIs
1. Create a `.http` file
2. Write HTTP requests:
   ```http
   GET http://localhost:3000/api/users
   Content-Type: application/json
   ```
3. Use `<leader>rr` to run the request

### Running Development Server
- Press `<leader>rs` to run `npm start`
- Press `<leader>rd` to run `npm run dev`
- Use `<leader>tn` to toggle terminal

### Package Management
- Open `package.json`
- Use `<leader>nt` to toggle package info overlay
- Use `<leader>nu` to update a package under cursor

## 📝 Notes

- This configuration assumes you're using npm as your package manager
- All LSP servers and formatters are automatically installed via Mason
- The configuration is optimized for TypeScript, but works great with plain JavaScript too
- REST client files use `.http` extension
- Database UI supports various database types (PostgreSQL, MySQL, SQLite, etc.)

## 🆘 Troubleshooting

- **LSP not working**: Check `:LspInfo` and ensure TypeScript is installed
- **Prettier not formatting**: Ensure prettier is installed in your project
- **Snippets not working**: Check if LuaSnip is properly loaded
- **Terminal not opening**: Ensure your shell is properly configured

Enjoy your enhanced TypeScript/React/Express development experience! 🎉
