---@type string[]
local boxes = {}
do
    for _ = 1, 9 do
        table.insert(boxes, " ")
    end
end

---@return number
local function get_move()
    io.write("Your move: row (1-3): ")
    local row = io.read()

    io.write("Your move: col (1-3): ")
    local col = io.read()

    local pos_idx = col + 3 * (row - 1)
    return pos_idx
end

---@param b string[] Boxes containing state of the game
---@return string
local function get_pretty_board(b)
    local pretty_board = ""
    local col_seperator = " - + - + - "
    for r = 1, 3 do
        local col = (" " .. b[3 * (r - 1) + 1] .. " | " .. b[3 * (r - 1) + 2] .. " | " .. b[3 * (r - 1) + 3])
        pretty_board = pretty_board .. col
        if r ~= 3 then
            pretty_board = pretty_board .. "\n" .. col_seperator .. "\n"
        end
    end
    return pretty_board
end

---@return nil
local function main()
    local pos = get_move()
    print(pos .. " " .. boxes[pos])
    print(get_pretty_board(boxes))
end

main()
