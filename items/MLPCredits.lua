MLPconfig = SMODS.current_mod.config

SMODS.current_mod.extra_tabs = function()
    local scale = 0.5
    return {
        label = "Credits",
        tab_definition_function = function()
            return {
                n = G.UIT.ROOT,
                config = {
                    align = "cm",
                    padding = 0.05,
                    colour = G.C.CLEAR
                },
                nodes = {{
                    n = G.UIT.R,
                    config = {
                        padding = 0,
                        align = "cm"
                    },
                    nodes = {{
                        n = G.UIT.T,
                        config = {
                            text = "Code: Jaye",
                            shadow = false,
                            scale = scale,
                            colour = G.C.WHITE
                        }
                    }}
                }, {
                    n = G.UIT.R,
                    config = {
                        padding = 0,
                        align = "cm"
                    },
                    nodes = {{
                        n = G.UIT.T,
                        config = {
                            text = "Art: Jaye, Tarkan809, Alex6886, Tihan",
                            shadow = false,
                            scale = scale,
                            colour = G.C.WHITE
                        }
                    }}
                }, {
                    n = G.UIT.R,
                    config = {
                        padding = 0,
                        align = "cm"
                    },
                    nodes = {{
                        n = G.UIT.T,
                        config = {
                            text = "Special thanks: JPingu, PoxyBoxy, TobbyMLP, 15, ManePxls",
                            shadow = false,
                            scale = scale,
                            colour = G.C.WHITE
                        }
                    }}
                }, {
                    n = G.UIT.R,
                    config = {
                        padding = 0,
                        align = "cm"
                    },
                    nodes = {{
                        n = G.UIT.T,
                        config = {
                            text = "Please refer to Modded Balatro Wiki for list of all card design references.",
                            shadow = false,
                            scale = scale * 0.6,
                            colour = G.C.WHITE
                        }
                    }}
                }}
            }
        end
    }
end

SMODS.current_mod.config_tab = function() -- Config tab
    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR
        },
        nodes = {create_toggle({
            label = localize("k_MLPblueprintfrequency"),
            ref_table = MLPconfig,
            ref_value = "MLPblueprintfrequency"
        }), create_toggle({
            label = localize("k_MLPretexturejokers"),
            ref_table = MLPconfig,
            ref_value = "MLPretexturejokers"
        })}
    }
end
