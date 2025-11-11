-- se  encarga de agregar las lineas de indentacion
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        indent = {
            char = "▏",
        },
        scope = {
            show_start = false,
        },
    },
}
