return {
    "0x100101/lab.nvim",
    lazy = true,
    config = function()
        require("lab").setup({
            quick_data = {
                enabled = false,
            },
        })
    end,
}
