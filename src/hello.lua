-- helloworld
print('hello')

-- variable declaration
local x = " world"
print(x)

-- function & function call
local function say_something(y)
    print(y)
end

say_something(x)

-- array
local list = { "a", "b", "c" }
print(list)                      -- return address of the list
print(list[1], list[2], list[3]) -- array idx from 1, not 0 as other languages
print(#list)                     -- #table returns number of elements?

-- looping
while true do
    print(x)
    break
end

for i = 1, #list do
    print(list[i])
end

for _ = 1, 10, 6 do
    print("Some bs")
end

-- branch
local function test_branch()
    local a = 1
    if a < 0 then
        print("negative")
    else
        print("positive")
    end
end

test_branch()

-- types
print(type("1"))

if not A then A = 1 end
print(A)
print(type(A))

-- string type and its quirks
A = "one string"
B = string.gsub(A, "one", "another")
print(B)
print(A)

-- table, dict/map/hashmap
local a = {}
a["a"] = 1
print(a["a"])

a["a"] = 2
print(a["a"])

local b = { a = 1, b = 2 }
print(b.b)

-- lua also has some good stdlib, here is os
print(os.getenv("EDITOR"))

-- OOP
-- in Lua, OOP is done via tables
Account = {
    balance = 0,
    withdraw = function(self, v)
        self.balance = self.balance - v
    end,
    deposit = function(self, v)
        self.balance = self.balance + v
    end
}

Account:withdraw(100.00) -- note: this operation is illegal. It isn't supposed to be operating directly on the class definition
print(Account.balance)
Account:deposit(100.00)  -- note: this is only to return the Account class balance back to 0.00. As stated above, don't do operation directly on class definition

-- inheritance is done via metatable
-- Defining Base Class (Enemy)
Enemy = {
    health = 100,
    damage = 10,
    attack = function(self)
        return self.damage
    end
}

-- Defining Derived Class (Boss)
Boss = {
    health = 1000,
    damage = 50,
    attack = function(self)
        return self.damage * 2
    end
}

setmetatable(Boss, { __index = Enemy })
local enemies = { Enemy, Boss }
-- for _, enemy in ipairs(enemies) do
--     print(enemy:attack())
-- end

-- Constructor/create objects of similar behavior as base class: usually use new()
function Account:new(o) -- o for object
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

local a1 = Account:new()
print(a1.balance)

-- luals annotations: think of python's type hint, or function docs
---@class Car
local Car = {
    new = function(self, o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end
}
