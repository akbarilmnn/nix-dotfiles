return {
    'altermo/ultimate-autopair.nvim',
    event= {
        'InsertEnter',
        'CmdlineEnter'
    },
    branch='v0.6',
    config = function()
        local autopairs = require('ultimate-autopair')
        local configs = {
                autopairs.extend_default({
                    {'<','>', suround=true, fly=true, newline=true, space=true, ft={'rust', 'cpp', 'typescript', 'haskell', 'java', 'csharp'}}
                })
        }
        autopairs.init(configs)
    end
}
