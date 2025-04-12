-- The plugin provides mappings to easily delete,
-- change and add such surroundings in pairs.
return {
    "tpope/vim-surround",
    event = { "BufReadPre", "BufNewFile" },
    config = function() end,
}
