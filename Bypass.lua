if game.PlaceId == 2788229376 then
wait(20)
game.Players.LocalPlayer.PlayerGui.MainScreenGui.Bar.HP.Picture.Life.Visible = true
game.Players.LocalPlayer.CharacterAdded:Connect(function()
game.Players.LocalPlayer.PlayerGui:WaitForChild("MainScreenGui"):WaitForChild("Bar"):WaitForChild("HP"):WaitForChild("Picture"):WaitForChild("Life").Visible = true
end)
local BreathingHAMON = Instance.new("StringValue", game.Players.LocalPlayer.DataFolder.Information)
BreathingHAMON.Name = "JJARC"

function Tool()
    local Tool = Instance.new('Tool')
    Tool.Name = 'OverDrive';
    Tool.RequiresHandle = false;
    Tool.Parent = game:GetService('Players').LocalPlayer:FindFirstChildWhichIsA('Backpack');
end;
game:GetService('Players').LocalPlayer.Character:WaitForChild('FULLY_LOADED_CHAR');
Tool();
game:GetService('Players').LocalPlayer.CharacterAdded:Connect(function(v)
    v:WaitForChild('FULLY_LOADED_CHAR');
    Tool();
end);

assert(getrawmetatable)
gmt = getrawmetatable(game)
setreadonly(gmt, false)
old = gmt.__namecall
gmt.__namecall =
    newcclosure(
        function(self, ...)
        local args = {...}
        if tostring(args[1]) == "BreathingHAMON" then
            return
        elseif tostring(args[1]) == "TeleportDetect" then
            return
        elseif tostring(args[1]) == "CHECKER_1" then
            return
        elseif tostring(args[1]) == "CHECKER" then
            return
        elseif tostring(args[1]) == "GUI_CHECK" then
            return
        elseif tostring(args[1]) == "OneMoreTime" then
            return
        elseif tostring(args[1]) == "checkingSPEED" then
            return
        elseif tostring(args[1]) == "BANREMOTE" then
            return
        elseif tostring(args[1]) == "PERMAIDBAN" then
            return
        elseif tostring(args[1]) == "KICKREMOTE" then
            return
        elseif tostring(args[1]) == "BR_KICKPC" then
            return end

        return old(self, ...)
    end)
end
