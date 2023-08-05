require("Comment").setup {
    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },

    mappings = {
        -- operator pendings mapping
        -- Includes:
        -- `gcc`        -> line-comment (current line)
        -- `gcb`        -> block-comment (current line)
        -- `gc[count]{motion}`  -> line comment the region
        -- `gb[count]{motion}`  -> block comment the region
        basic = true,
        -- extra mapping
        -- Includes `gco`, `gcO`, `gcA`
        extra = true,
        -- extended mapping
        -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    },

    -- Pre-hook, called before commenting the line
    --    Can be used to determine the commentstring value
    pre_hook = nil,

    -- Post-hook, called after commenting is done
    --    Can be used to alter any formatting / newlines / etc. after commenting
    post_hook = nil,

    -- Can be used to ignore certain lines when doing linewise motions.
    --    Can be string (lua regex)
    --    Or function (that returns lua regex)
    ignore = nil,

}

