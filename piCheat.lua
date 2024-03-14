local function keyInput(key)
    local command = string.format("xdotool key %s ", key)
    os.execute(command)
end

local function sleep(time)
  os.execute("sleep " .. time)
end

local pi = {}
local piDigits = io.open("digits.txt", "r")
local pos = 0
repeat
    local char = piDigits:read(1)
    if char then
      pos = pos + 1
      table.insert(pi, pos, char)
    end
    if not char then table.remove(pi, pos) end
until not char

piDigits:close()
print("Human Mode? [y/N]")
local human = string.lower(io.read()) or "n"
if human == "y" then
  humanMode = true
elseif human == "n" then
  humanMode = false
end

print("How many digits?")
local maxDigits = tonumber(io.read())
print("Focus on the app you want to pi in")

sleep(3)

for i, v in pairs(pi) do
  if humanMode == true then
    local wait = math.random(2,7)
    wait = wait / 5
    print("waiting "..wait.." seconds")
    sleep(wait)
  end
  print("inputting "..v)
  keyInput(v)
  if i == maxDigits then
    break
  end
end

print("done")
