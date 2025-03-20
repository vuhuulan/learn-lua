---@type string[]
local board = {}
do
    for _ = 1, 9 do
        table.insert(board, " ")
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


---@param b string[] board containing state of the game
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


---@param p string player: "x" or "o"
---@return nil
local function update_board(p)
    local is_legal_move = false
    local pos = 0
    while not is_legal_move do
        pos = get_move()
        if board[pos] == " " then
            is_legal_move = true
            break
        end
        print("That's an illegal move! Choose again!")
    end
    board[pos] = p
end


---@return nil
local function main()
    update_board("x")
    print(get_pretty_board(board))
    update_board("o")
    print(get_pretty_board(board))
end

main()
