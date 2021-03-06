local gpu, screens, gpu1, screen1 = ...
local term                        = require("term")
local event                       = require("event")
local a                           = {}

a.stargatefarbe                   = 0x3C3C3C
a.chevron_an                      = 0xFF6D00
a.chevron_aus                     = 0x996D40
a.wurmloch                        = 0x0000FF
a.irisfarbe                       = 0xA5A5A5
a.aussen                          = 0x000000

a.timer                           = {}
a.aktiv                           = {}
a.c                               = {}
a.s                               = {}

a.timer.iris                      = 0
a.timer.zeig                      = 0

for i = 1, 9 do
    a.aktiv[i] = false
end

a.s.a = {
    {1,  1, "                                "},
    {1,  2, "         ▁▄▄████████▄▄▁         "},
    {1,  3, "       ▄▟█"},{23,  3, "█▙▄       "},
    {1,  4, "     ▗██"},  {25,  4,   "██▖     "},
    {1,  5, "    ▟█"},    {27,  5,     "█▙    "},
    {1,  6, "   ▟█"},     {28,  6,      "█▙   "},
    {1,  7, "  ▐█"},      {29,  7,       "█▌  "},
    {1,  8, "  ██"},      {29,  8,       "██  "},
    {1,  9, "  ██"},      {29,  9,       "██  "},
    {1, 10, "  ▐█"},      {29, 10,       "█▌  "},
    {1, 11, "   ▜█"},     {28, 11,      "█▛   "},
    {1, 12, "    ▜█"},    {27, 12,     "█▛    "},
    {1, 13, "     ▝██"},  {25, 13,   "██▘     "},
    {1, 14, "       ▀▜█"},{23, 14, "█▛▀       "},
    {1, 15, "         ▔▀▀████████▀▀▔         "},
    {1, 16, "                                "},
}

a.s.i = {
    {11,  3, "▛▀▔▔    ▔▔▀▜"},
    { 9,  4, "▀              ▀"},
    { 7,  5, "▀                  ▀"},
    { 6,  6, "▘                    ▝"},
    { 5,  7, "▌                      ▐"},
    { 5,  8, "                        "},
    { 5,  9, "                        "},
    { 5, 10, "▌                      ▐"},
    { 6, 11, "▖                    ▗"},
    { 7, 12, "▄                  ▄"},
    { 9, 13, "▄              ▄"},
    {11, 14, "▙▄▁▁    ▁▁▄▟"},
}

a.c["A"] = {
    "                                ",
    "                                ",
    "            ██████████          ",
    "            ██      ██          ",
    "            ██     ██           ",
    "           ███     ██           ",
    "           █████████            ",
    "           █████████            ",
    "          ███     ███           ",
    "         ████     ████          ",
    "         ███       ████         ",
    "         ███        ███         ",
    "          ███       ███         ",
    "         ████      █████        ",
    "                                ",
    "                                ",
}

a.c["B"] = {
    "                                ",
    "                                ",
    "              ██████   █        ",
    "            ██████    ████      ",
    "          ██ █      ███         ",
    "           ███    ███           ",
    "            ███████             ",
    "           ███ ███              ",
    "           ███ ███              ",
    "           ███████              ",
    "          ███ █ ████            ",
    "         ███       ████         ",
    "        ███          █          ",
    "        ███                     ",
    "                                ",
    "                                ",
}

a.c["C"] = {
    "                                ",
    "                                ",
    "               ████             ",
    "            █████               ",
    "          █████                 ",
    "       █████ ██                 ",
    "            ████                ",
    "              ████              ",
    "               ████             ",
    "                 ████           ",
    "                  ██████        ",
    "                    ██  ██      ",
    "                    ████        ",
    "                    ██          ",
    "                                ",
    "                                ",
}

a.c["D"] = {
    "                                ",
    "                    ██          ",
    "                   ████         ",
    "                   ███          ",
    "                   ██           ",
    "            █      ██           ",
    "            ███   ███           ",
    "           ██████████           ",
    "                  ███           ",
    "              ███  ██           ",
    "            ████   ██           ",
    "        ████       ███          ",
    "          ██       ████         ",
    "           █       █            ",
    "                                ",
    "                                ",
}

a.c["E"] = {
    "                                ",
    "                                ",
    "                   ████         ",
    "           ███████████          ",
    "          █████████             ",
    "         ████                   ",
    "        █████                   ",
    "        ██ ██                   ",
    "       ██  ██                   ",
    "        ██ ██   ████████        ",
    "         ████ ██████████        ",
    "         ████████               ",
    "          █████                 ",
    "           ██                   ",
    "                                ",
    "                                ",
}

a.c["F"] = {
    "                                ",
    "                                ",
    "                      ████      ",
    "                      ███       ",
    "                     ███        ",
    "                    ███         ",
    "                    ██          ",
    "             ████████           ",
    "           ████  ███            ",
    "         ████████               ",
    "        ███                     ",
    "        ██                      ",
    "        ██                      ",
    "       ███                      ",
    "                                ",
    "                                ",
}

a.c["G"] = {
    "                                ",
    "                                ",
    "                                ",
    "     ████                       ",
    "      █ █████                   ",
    "      ██  ███                   ",
    "      █████                     ",
    "      ███                       ",
    "                   ███          ",
    "                   ██ ███       ",
    "                   ██  ███      ",
    "                    ████        ",
    "                    ██          ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["H"] = {
    "                                ",
    "                                ",
    "                 ████████       ",
    "                 ████████       ",
    "                 ██    ███      ",
    "                ███   ████      ",
    "                ███  ███        ",
    "       ████     ██    █         ",
    "       ███     ███              ",
    "       ███  █████               ",
    "       ████████                 ",
    "       █████                    ",
    "       ███                      ",
    "      ████                      ",
    "                                ",
    "                                ",
}

a.c["I"] = {
    "                                ",
    "                  █             ",
    "                ███             ",
    "               ██ ██            ",
    "              ███████           ",
    "                  ████          ",
    "                    ███         ",
    "                     ███        ",
    "         █           ███        ",
    "        ██          ███         ",
    "       █  █        ████         ",
    "      ██████ █████████          ",
    "             ███████            ",
    "                                ",
    "                                ",
}

a.c["J"] = {
    "                                ",
    "                                ",
    "            █                   ",
    "           ██                   ",
    "           ██                   ",
    "           ███                  ",
    "           █ █ ██               ",
    "           █ ██ ██              ",
    "          ██ ██ ███             ",
    "          ██████                ",
    "              ███               ",
    "               ███              ",
    "                █████           ",
    "                 ███            ",
    "                                ",
    "                                ",
}


a.c["K"] = {
    "                                ",
    "                                ",
    "                 ████           ",
    "           █     ███████        ",
    "         ███          ██        ",
    "        ████          ██        ",
    "       ██ ██          ██        ",
    "       ██ ██    ██    ███       ",
    "       ██ █████████   ███       ",
    "       █ ████████████████       ",
    "       ███    ███ █████         ",
    "       █     █████              ",
    "               ████             ",
    "                 ██             ",
    "                                ",
    "                                ",
}

a.c["L"] = {
    "                                ",
    "                                ",
    "            ██                  ",
    "            ███                 ",
    "            ██                  ",
    "           ███                  ",
    "           ███                  ",
    "           ███                  ",
    "           ███████              ",
    "               ████████         ",
    "                 ██████         ",
    "              █████  ██         ",
    "           ██████               ",
    "            ██                  ",
    "            █                   ",
    "                                ",
}

a.c["M"] = {
    "                                ",
    "                                ",
    "                                ",
    "         █████                  ",
    "         ███                    ",
    "         ███      ██            ",
    "         ███     ██ ██          ",
    "        ███      ███            ",
    "        ███                     ",
    "        ███             █       ",
    "        ███     ██████████      ",
    "        ██████████████████      ",
    "        ███████                 ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["N"] = {
    "                                ",
    "                                ",
    "                                ",
    "            ███                 ",
    "            █████               ",
    "           ████████             ",
    "          ███   █████           ",
    "          ███     ████          ",
    "         ███        ████        ",
    "        ████         ████       ",
    "        ███████████████████     ",
    "       ██████████████   ███     ",
    "      ███                       ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["O"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "               █████████        ",
    "        █████████    █ ██       ",
    "     ████            █ ██       ",
    "     ██              ███        ",
    "      ████           ██         ",
    "        ██████████████          ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["P"] = {
    "                                ",
    "                                ",
    "        █████     █             ",
    "         ██████████             ",
    "         ███   █████            ",
    "          ██      ██            ",
    "          ███                   ",
    "           ██                   ",
    "           ███                  ",
    "            ███                 ",
    "            ███   ███           ",
    "             ████████           ",
    "             █████████          ",
    "              ██                ",
    "                                ",
    "                                ",
}

a.c["Q"] = {
    "                                ",
    "                                ",
    "                  ███           ",
    "                  ██            ",
    "                  ██            ",
    "                  ██            ",
    "                  ███   █       ",
    "             ██    ██████       ",
    "            ████     ███        ",
    "              ███    ███        ",
    "               ███ ████         ",
    "                ██████          ",
    "        ████████████            ",
    "        ██                      ",
    "                                ",
    "                                ",
}

a.c["R"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                     ███        ",
    "       ██████      █████        ",
    "      ██████████████            ",
    "     ███        ██              ",
    "       ███       ██      ██     ",
    "      █████████████      █      ",
    "    ███         █████           ",
    "     █                          ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["S"] = {
    "                                ",
    "                                ",
    "                    ███         ",
    "                    ████        ",
    "                    ██          ",
    "                   ███          ",
    "                   ██           ",
    "                  ███           ",
    "                  ██            ",
    "                 ███            ",
    "       ████████████             ",
    "        ██     ████             ",
    "         ██ ████                ",
    "          ███                   ",
    "                                ",
    "                                ",
}

a.c["T"] = {
    "                                ",
    "                                ",
    "                        ██      ",
    "      ████            ████      ",
    "     ██ █████     ███████       ",
    "      ███████████████ ███       ",
    "        █             ██        ",
    "                      ██        ",
    "                     ███        ",
    "                    ███         ",
    "                    ███         ",
    "                    ███         ",
    "                    ███         ",
    "                    ██          ",
    "                                ",
    "                                ",
}


a.c["U"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "              ███    ██ ██      ",
    "       ███████████████████      ",
    "     ██████    ██     █         ",
    "    █████████████               ",
    "              ██                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["V"] = {
    "                                ",
    "                                ",
    "       ██                       ",
    "       ████                     ",
    "        ██████                  ",
    "        ███ █████               ",
    "         ██    ████             ",
    "          ██     █████          ",
    "          ███       █████       ",
    "           ██       ████        ",
    "           ███    ████          ",
    "            ███ ████            ",
    "             █████              ",
    "             ███                ",
    "                                ",
    "                                ",
}

a.c["W"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "     █                          ",
    "     ██████           █████     ",
    "     ██████████████████████     ",
    "            ███████             ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["X"] = {
    "                                ",
    "                                ",
    "        ██                      ",
    "       ████                     ",
    "       ███████                  ",
    "           █████                ",
    "             █████              ",
    "               ████             ",
    "                 █████          ",
    "         ██       ████          ",
    "        ████       █ █          ",
    "        ████████   █ █          ",
    "            ███████████         ",
    "                  █████         ",
    "                                ",
    "                                ",
}

a.c["Y"] = {
    "                                ",
    "                                ",
    "                                ",
    "        ██                      ",
    "        ██████                  ",
    "        ███ ████                ",
    "              ██████████        ",
    "                ████████        ",
    "               ██     ██        ",
    "               ██      ██       ",
    "               ██   █████       ",
    "              ██████████        ",
    "              ███               ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["Z"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                        ██      ",
    "           ███████████████      ",
    "    █████████████████    █      ",
    "     ██        █████            ",
    "                  █████████     ",
    "                         ██     ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["0"] = {
    "                                ",
    "                                ",
    "               ██               ",
    "               ███              ",
    "         █                      ",
    "         ████                   ",
    "          ██                    ",
    "          ██       █            ",
    "          ███      ███          ",
    "          ███      ██           ",
    "          ███     ███           ",
    "         █████    ██            ",
    "          ██████████            ",
    "           ███████              ",
    "                                ",
    "                                ",
}

a.c["1"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                       ████     ",
    "                ██████ █████    ",
    "               ██████████       ",
    "      ███    ████  ███          ",
    "      ███████████               ",
    "         █████                  ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["2"] = {
    "                                ",
    "                                ",
    "              ██                ",
    "              ████████          ",
    "               █   ██           ",
    "               ██ ██            ",
    "               █  ██            ",
    "              ██ ██             ",
    "              █████             ",
    "            ██   ██             ",
    "           ██    ██             ",
    "         ██████  ██             ",
    "             ███████            ",
    "                  ██            ",
    "                                ",
    "                                ",
}

a.c["3"] = {
    "                                ",
    "                                ",
    "               ███              ",
    "          ████████              ",
    "        █████   ██              ",
    "          ███  ██               ",
    "            █████               ",
    "              ███               ",
    "               ███              ",
    "               █████            ",
    "               ██  ████         ",
    "              ██    █████       ",
    "              ████████          ",
    "              ████              ",
    "                                ",
    "                                ",
}


a.c["4"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                    ███         ",
    "        ███        █████        ",
    "     █████████   ████ ███       ",
    "     █     ████████    ████     ",
    "              ███        █      ",
    "          ██████                ",
    "       ███  ██                  ",
    "         ███                    ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["5"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                     ████       ",
    "                     ███        ",
    "            ████████████        ",
    "       █████████████████        ",
    "      ███             ██        ",
    "      ███             ██        ",
    "       ██████████████████       ",
    "       ██████         ███       ",
    "       ██                       ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["6"] = {
    "                                ",
    "                                ",
    "                                ",
    "      ███                       ",
    "      ███                       ",
    "      ███                       ",
    "        ████  ██                ",
    "           ███ █                ",
    "            █   ██ ████         ",
    "                  █████         ",
    "                      █         ",
    "                     █████      ",
    "                       ███      ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["7"] = {
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "   ████████████         █       ",
    "  ███████████████      ██       ",
    "   █           ██████████       ",
    "                  ███           ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
}

a.c["8"] = {
    "                                ",
    "                                ",
    "         ██                     ",
    "         ██                     ",
    "                                ",
    "                ██              ",
    "               ███              ",
    "              ██                ",
    "             ██                 ",
    "            ██                  ",
    "           ███                  ",
    "           ██                   ",
    "           ██                   ",
    "           ███                  ",
    "                                ",
    "                                ",
}

a.c["9"] = {
    "                                ",
    "                                ",
    "               ███              ",
    "               ██               ",
    "                                ",
    "               ██               ",
    "               ██               ",
    "                                ",
    "                █               ",
    "             ████               ",
    "                ██              ",
    "                 ██             ",
    "                  ███           ",
    "                   ██           ",
    "                                ",
    "                                ",
}

--[[ nicht benutzt
a.c["Buchstabe_hier"] = {
    "                                ",
    "                                ",
    "        ██                      ",
    "      ████                      ",
    "        ███                     ",
    "         ███                    ",
    "          ████                  ",
    "            ████                ",
    "             ████               ",
    "               █████            ",
    "                 ██████         ",
    "                    █████████   ",
    "                       ██████   ",
    "                          ██    ",
    "                                ",
    "                                ",
}
]]

a.c["ende"] = {
    "                                ",
    "              ███               ",
    "            ███████             ",
    "            ██   ██             ",
    "            ██   ██             ",
    "             █████              ",
    "               █                ",
    "              ███               ",
    "             █████              ",
    "            ███████             ",
    "           ███   ███            ",
    "          ███     ███           ",
    "         ███       ███          ",
    "        ███         ███         ",
    "       ███           ███        ",
    "      ████           ████       ",
}

a.c["beenden"] = {
    "▀▄                            ▄▀",
    "  ▀▄                        ▄▀  ",
    "    ▀▄                    ▄▀    ",
    "      ▀▄                ▄▀      ",
    "        ▀▄            ▄▀        ",
    "          ▀▄        ▄▀          ",
    "            ▀▄    ▄▀            ",
    "              ▀▄▄▀              ",
    "              ▄▀▀▄              ",
    "            ▄▀    ▀▄            ",
    "          ▄▀        ▀▄          ",
    "        ▄▀            ▀▄        ",
    "      ▄▀                ▀▄      ",
    "    ▄▀                    ▀▄    ",
    "  ▄▀                        ▀▄  ",
    "▄▀                            ▀▄",
}

a[1] = function(aktiv)
    gpu.setBackground(a.aussen)
    gpu.set(25, 3, "▄")
    gpu.set(25, 4, "█▙")
    gpu.setBackground(a.innen)
    gpu.set(24, 4, "▀")
end

a[2] = function(aktiv)
    gpu.setBackground(a.aussen)
    gpu.set(29, 7, "█▌")
    gpu.setBackground(a.innen)
    gpu.set(28, 7, "▐")
    gpu.setBackground(a.stargatefarbe)
    gpu.set(29, 8, "▀▀")
end

a[3] = function()
    gpu.setBackground(a.aussen)
    gpu.set(27, 12, "█▛")
    gpu.setBackground(a.innen)
    gpu.set(27, 11, "▗")
    gpu.setBackground(a.stargatefarbe)
    gpu.set(28, 11, "▄")
end

a[4] = function()
    gpu.setBackground(a.aussen)
    gpu.set(5, 12, "▜█")
    gpu.setBackground(a.innen)
    gpu.set(6, 11, "▖")
    gpu.setBackground(a.stargatefarbe)
    gpu.set(5, 11, "▄")
end

a[5] = function(aktiv)
    gpu.setBackground(a.aussen)
    gpu.set(3, 7, "▐█")
    gpu.setBackground(a.innen)
    gpu.set(5, 7, "▌")
    gpu.setBackground(a.stargatefarbe)
    gpu.set(3, 8, "▀▀")
end

a[6] = function()
    gpu.setBackground(a.aussen)
    gpu.set(8, 3, "▄")
    gpu.set(7, 4, "▟█")
    gpu.setBackground(a.innen)
    gpu.set(9, 4, "▀")
end

a[7] = function()
    gpu.set(16, 2, "██")
end

a[8] = function(aktiv)
    gpu.setBackground(a.innen)
    gpu.set(21, 14, "▄▟")
    gpu.setBackground(a.aussen)
    gpu.set(21, 15, "▀▀▔")
    if aktiv then
        gpu.setForeground(a.chevron_an)
    else
        gpu.setForeground(a.chevron_aus)
    end
    gpu.setBackground(a.stargatefarbe)
    gpu.set(23, 14, "▄")
end

a[9] = function(aktiv)
    gpu.setBackground(a.innen)
    gpu.set(11, 14, "▙▄")
    gpu.setBackground(a.aussen)
    gpu.set(10, 15, "▔▀▀")
    if aktiv then
        gpu.setForeground(a.chevron_an)
    else
        gpu.setForeground(a.chevron_aus)
    end
    gpu.setBackground(a.stargatefarbe)
    gpu.set(10, 14, "▄")
end

function a.stargate(ausgeschaltet, aktiv)
    if ausgeschaltet then
        for i = 1, 9 do
            a.aktiv[i] = false
        end
        if a.innen ~= a.irisfarbe then
            a.innen = a.aussen
        end
    end
    if aktiv and a.innen ~= a.irisfarbe then
        a.innen = a.wurmloch
    end
    for _, screenid in pairs(a.screens.stargate) do
        gpu.bind(screenid, false)
        gpu.setForeground(a.stargatefarbe)
        gpu.setBackground(a.aussen)
        for _, v in pairs(a.s.a) do
            gpu.set(v[1], v[2], v[3])
        end
        gpu.setBackground(a.innen)
        for _, v in pairs(a.s.i) do
            gpu.set(v[1], v[2], v[3])
        end
        for chevron in pairs(a.aktiv) do
            local aktiv = a.aktiv[chevron]
            if aktiv then
                gpu.setForeground(a.chevron_an)
            else
                gpu.setForeground(a.chevron_aus)
            end
            a[chevron](aktiv)
        end
    end
end

function a.chevron(zeichen)
    for _, screenid in pairs(a.screens.chevron) do
        gpu.bind(screenid, false)
        gpu.setForeground(0xFFFFFF)
        gpu.setBackground(0x000000)
        for y = 1, 16 do
            gpu.set(1, y, a.c[zeichen][y])
        end
    end
end

local function init(gpu, screens)
    a.innen = a.aussen
    a.screens = {}
    a.screens.chevron = {}
    a.screens.stargate = {}
    for _, screenid in pairs(screens) do
        gpu.bind(screenid)
        gpu.setResolution(32, 16)
        gpu.fill(1, 1, 32, 16, " ")
        if gpu.maxDepth() > 4 then
            table.insert(a.screens.stargate, screenid)
        else
            table.insert(a.screens.chevron, screenid)
        end
    end
    a.zeig(false, "ende")
end

function a.iris(geschlossen)
    event.cancel(a.timer.iris)
    a.timer.iris = event.timer(0.05, function()
        if geschlossen then
            a.innen = a.irisfarbe
        elseif not a.aktiv[1] then
            a.innen = a.aussen
            a.stargate(true)
            return
        elseif a.aktiv[7] then
            a.innen = a.wurmloch
        else
            a.innen = a.aussen
        end
        a.stargate(false)
        gpu1.bind(screen1, false)
    end, 1)
end

function a.zeig(aktiv, adresse, symbolName)
    event.cancel(a.timer.zeig)
    a.timer.zeig = event.timer(0.05, function()
        if adresse == "ende" then
            if a.innen ~= a.irisfarbe then
                a.innen = a.aussen
            end
            for i = 1, 9 do
                a.aktiv[i] = false
            end
        else
            adresse = string.gsub(adresse, "-" , "")
            local lang = string.len(adresse)
            for i = 1, lang do
                a.aktiv[i] = true
            end
            if not aktiv and lang >= 7 then
                a.aktiv[lang + 1] = true
            end
            a.aktiv[7] = aktiv
            adresse = string.sub(adresse, -1)
        end
        a.stargate(false, aktiv)
        a.chevron(adresse)
        gpu1.bind(screen1, false)
    end, 1)
end

function a.beenden()
    a.innen = 0x990000
    a.aussen = 0x990000
    a.stargate(false, false)
    a.chevron("beenden")
    gpu1.bind(screen1, false)
end

init(gpu, screens)

return a
