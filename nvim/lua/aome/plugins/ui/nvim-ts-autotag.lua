return {
    "windwp/nvim-ts-autotag",
    event = {
        "BufReadPre *.{html,jsx,tsx,ts,js,astro,svelte}",
        "BufNewFile *.{html,jsx,tsx,ts,js,astro,svelte}",
    },
    ft = {
        "html",
        "javascriptreact",
        "typescriptreact",
        "jsx",
        "tsx",
        "astro",
        "svelte",
    },
}
