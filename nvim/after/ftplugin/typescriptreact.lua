local options = {
    bo = {
        tabstop = 2,
        softtabstop = 2,
        shiftwidth = 2,
        expandtab = true,
    },
}

for scope, opts in pairs(options) do
    for opt, value in pairs(opts) do
        vim[scope][opt] = value
    end
end
