-- TypeScript/React Snippets Configuration
return {
  -- Enhanced snippets for TypeScript/React development
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "honza/vim-snippets",
    },
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      local c = ls.choice_node
      local d = ls.dynamic_node
      local sn = ls.snippet_node
      
      -- Helper function to get filename without extension
      local function get_filename()
        return vim.fn.expand("%:t:r")
      end
      
      -- Helper function to get component name from filename
      local function get_component_name()
        local filename = get_filename()
        return filename:gsub("^%l", string.upper)
      end
      
      -- TypeScript React snippets
      ls.add_snippets("typescriptreact", {
        -- React Functional Component
        s("rfc", {
          t("import React from 'react';"),
          t({"", ""}),
          t("interface "),
          f(get_component_name),
          t("Props {"),
          t({"", "  "}),
          i(1, "// Define props here"),
          t({"", "}"}),
          t({"", ""}),
          t("const "),
          f(get_component_name),
          t(": React.FC<"),
          f(get_component_name),
          t("Props> = ({"),
          i(2, "/* destructure props */"),
          t("}) => {"),
          t({"", "  return ("}),
          t({"", "    <div>"}),
          t({"", "      "}),
          i(3, "// Component content"),
          t({"", "    </div>"}),
          t({"", "  );"}),
          t({"", "};"}),
          t({"", ""}),
          t("export default "),
          f(get_component_name),
          t(";"),
        }),
        
        -- React Hook
        s("rhook", {
          t("import { useState, useEffect } from 'react';"),
          t({"", ""}),
          t("const use"),
          i(1, "CustomHook"),
          t(" = ("),
          i(2, ""),
          t(") => {"),
          t({"", "  const ["}),
          i(3, "state"),
          t(", set"),
          i(4, "State"),
          t("] = useState("),
          i(5, "initialValue"),
          t(");"),
          t({"", ""}),
          t({"", "  useEffect(() => {"}),
          t({"", "    "}),
          i(6, "// Effect logic"),
          t({"", "  }, []);"}),
          t({"", ""}),
          t({"", "  return { "}),
          i(7, "state"),
          t(" };"),
          t({"", "};"}),
          t({"", ""}),
          t("export default use"),
          i(1),
          t(";"),
        }),
        
        -- Express Route Handler
        s("route", {
          t("app."),
          c(1, {
            t("get"),
            t("post"),
            t("put"),
            t("delete"),
            t("patch"),
          }),
          t("('"),
          i(2, "/api/endpoint"),
          t("', async (req: Request, res: Response) => {"),
          t({"", "  try {"}),
          t({"", "    "}),
          i(3, "// Route logic"),
          t({"", "    res.json({ success: true });"}),
          t({"", "  } catch (error) {"}),
          t({"", "    res.status(500).json({ error: error.message });"}),
          t({"", "  }"}),
          t({"", "});"}),
        }),
        
        -- Interface
        s("interface", {
          t("interface "),
          i(1, "InterfaceName"),
          t(" {"),
          t({"", "  "}),
          i(2, "property: string;"),
          t({"", "}"}),
        }),
        
        -- Type
        s("type", {
          t("type "),
          i(1, "TypeName"),
          t(" = {"),
          t({"", "  "}),
          i(2, "property: string;"),
          t({"", "};"}),
        }),
        
        -- Async Function
        s("afn", {
          t("const "),
          i(1, "functionName"),
          t(" = async ("),
          i(2, "params"),
          t("): Promise<"),
          i(3, "ReturnType"),
          t("> => {"),
          t({"", "  "}),
          i(4, "// Function body"),
          t({"", "};"}),
        }),
        
        -- Try-Catch Block
        s("try", {
          t("try {"),
          t({"", "  "}),
          i(1, "// Code that might throw"),
          t({"", "} catch (error) {"}),
          t({"", "  console.error(error);"}),
          t({"", "  "}),
          i(2, "// Error handling"),
          t({"", "}"}),
        }),
      })
      
      -- TypeScript snippets
      ls.add_snippets("typescript", {
        -- Class
        s("class", {
          t("class "),
          i(1, "ClassName"),
          t(" {"),
          t({"", "  constructor("}),
          i(2, "params"),
          t(") {"),
          t({"", "    "}),
          i(3, "// Constructor logic"),
          t({"", "  }"}),
          t({"", ""}),
          t({"", "  "}),
          i(4, "// Methods"),
          t({"", "}"}),
        }),
        
        -- Express Middleware
        s("middleware", {
          t("const "),
          i(1, "middlewareName"),
          t(" = (req: Request, res: Response, next: NextFunction) => {"),
          t({"", "  "}),
          i(2, "// Middleware logic"),
          t({"", "  next();"}),
          t({"", "};"}),
        }),
        
        -- Express Controller
        s("controller", {
          t("export const "),
          i(1, "controllerName"),
          t(" = {"),
          t({"", "  "}),
          i(2, "methodName"),
          t(": async (req: Request, res: Response) => {"),
          t({"", "    try {"}),
          t({"", "      "}),
          i(3, "// Controller logic"),
          t({"", "      res.json({ success: true });"}),
          t({"", "    } catch (error) {"}),
          t({"", "      res.status(500).json({ error: error.message });"}),
          t({"", "    }"}),
          t({"", "  },"}),
          t({"", "};"}),
        }),
        
        -- Mongoose Schema
        s("schema", {
          t("import mongoose from 'mongoose';"),
          t({"", ""}),
          t("const "),
          i(1, "SchemaName"),
          t("Schema = new mongoose.Schema({"),
          t({"", "  "}),
          i(2, "field: { type: String, required: true }"),
          t({"", "}, {"}),
          t({"", "  timestamps: true"}),
          t({"", "});"}),
          t({"", ""}),
          t("export const "),
          i(1),
          t(" = mongoose.model('"),
          i(1),
          t("', "),
          i(1),
          t("Schema);"),
        }),
      })
      
      -- Load friendly snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
      
      -- Key mappings for snippet navigation
      vim.keymap.set({"i", "s"}, "<C-k>", function()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end, {silent = true})
      
      vim.keymap.set({"i", "s"}, "<C-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, {silent = true})
      
      vim.keymap.set({"i", "s"}, "<C-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})
    end,
  },
} 