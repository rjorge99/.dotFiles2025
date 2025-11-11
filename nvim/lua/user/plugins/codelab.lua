return {
    "0x100101/lab.nvim",
    enabled = false,
    lazy = true,
    config = function()
        require("lab").setup({
            quick_data = {
                enabled = false,
            },
        })
    end,
}
