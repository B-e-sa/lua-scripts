local args = { ... }
local circleQuantity = args[1] or 4

print(args[1])

turtle.select(1)
turtle.refuel()

local seedPosition = 2
turtle.select(seedPosition)

local function backAndPlant()
    if (turtle.getFuelLevel() <= 50) then
        turtle.select(1)
        turtle.refuel()
    end

    local seedCount = turtle.getItemCount(seedPosition)

    if (seedCount == 0) then
        if (seedPosition == 16 or turtle.getItemCount(seedPosition + 1)) == 0 then
            return false
        end

        seedPosition = seedPosition + 1
        turtle.select(seedPosition)
    end

    turtle.back()
    turtle.dig()
    turtle.place()

    return true
end

backAndPlant()
turtle.turnLeft()

backAndPlant()
turtle.turnLeft()

backAndPlant()
backAndPlant()

turtle.back()
turtle.turnLeft()

local firstSide = 3
local otherSides = 5
local additionalSpaces = 2

local hasSeeds = true

for i = 1, circleQuantity do
    for _ = 1, firstSide do
        if not backAndPlant() then return end
    end
    turtle.turnLeft()
    firstSide = firstSide + 3

    for _ = 1, 3 do
        for _ = 1, otherSides do
            if not backAndPlant() then return end
        end
        turtle.turnLeft()
    end
    otherSides = otherSides + 4

    for _ = 0, additionalSpaces do
        if not backAndPlant() then return end
    end
    additionalSpaces = additionalSpaces + 1

    turtle.turnRight()
    if not backAndPlant() then return end
    turtle.back()
    turtle.turnLeft()
end
