--  //    stop looking here
--  //    made by bungie#4857


--/ Locals
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()

--/ Services
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local InputService = game:GetService("UserInputService")
local CoreGuiService = game:GetService("CoreGui")
local ContentService = game:GetService("ContentProvider")

-- / Main Library
local bungiesLibrary = {}
getgenv().ui = false
function bungiesLibrary.Load(SelectedLibrary)
    if string.find(string.lower(SelectedLibrary), "ui") then
        ui = true

        -- Tweening
        local TweenAmount = 1
        local TweenTable = {
            Default = {
                TweenInfo.new(0.17, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
            }
        }
        local CreateTween = function(Name, Information)
            TweenAmount = TweenAmount + 1
            Name = Name or "Tween-" .. tostring(TweenAmount)

            Information = {
                Speed = Information.Speed or 0.17,
                Style = Information.Style or Enum.EasingStyle.Sine,
                Direction = Information.Direction or Enum.EasingDirection.InOut,
                LoopAmount = Information.LoopAmount or 0,
                Reverse = Information.Reverse or false,
                Delay = Information.Delay or 0
            }

            TweenTable[Name] =
                TweenInfo.new(
                Information.Speed,
                Information.Style,
                Information.Direction,
                Information.LoopAmount,
                Information.Reverse,
                Information.Delay
            )
        end

        -- Dragging
        local Drag = function(Information)
            Information = {
                Object = Information.Object,
                Latency = Information.Latency or 0.06
            }

            toggled = nil
            input = nil
            start = nil

            function updateInput(input)
                local Delta = input.Position - start
                local Position =
                    UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + Delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + Delta.Y
                )
                game:GetService("TweenService"):Create(
                    Information.Object,
                    TweenInfo.new(Information.Latency),
                    {Position = Position}
                ):Play()
            end

            Information.Object.InputBegan:Connect(
                function(inp)
                    if (inp.UserInputType == Enum.UserInputType.MouseButton1) then
                        toggled = true
                        start = inp.Position
                        startPos = Information.Object.Position
                        inp.Changed:Connect(
                            function()
                                if inp.UserInputState == Enum.UserInputState.End then
                                    toggled = false
                                end
                            end
                        )
                    end
                end
            )

            Information.Object.InputChanged:Connect(
                function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseMovement then
                        input = inp
                    end
                end
            )

            game:GetService("UserInputService").InputChanged:Connect(
                function(inp)
                    if inp == input and toggled then
                        updateInput(inp)
                    end
                end
            )
        end

        -- String Generator
        local function genKey()
            local real = ""
            local chars = {}
            local function setChar(a, z)
                for i = string.byte(a), string.byte(z) do
                    table.insert(chars, string.char(i))
                end
            end
            local function getKey()
                local keys = {
                    key1 = {},
                    key2 = {},
                    key3 = {},
                    key4 = {}
                }
                for real1 = 1, 5 do
                    keys.key1[real1] = tostring(chars[math.random(1, #chars)])
                end
                for real2 = 1, 5 do
                    keys.key2[real2] = tostring(chars[math.random(1, #chars)])
                end
                for real3 = 1, 5 do
                    keys.key3[real3] = tostring(chars[math.random(1, #chars)])
                end
                for real4 = 1, 5 do
                    keys.key4[real4] = tostring(chars[math.random(1, #chars)])
                end
                return "ui_[" ..
                    table.concat(keys.key1) ..
                        "-" ..
                            table.concat(keys.key2) ..
                                "-" .. table.concat(keys.key3) .. "-" .. table.concat(keys.key4) .. "]"
            end
            setChar("A", "Z")
            setChar("0", "9")
            return getKey()
        end

        -- Window function
        local Interface = {}
        function Interface:Start(Configuration)
            ui = true
            Configuration = {
                Header = Configuration.Header or "undefined header",
                Footer = Configuration.Footer or
                    "undefined footer  |   " ..
                        game.Players.LocalPlayer.Name ..
                            " | " .. os.date("%d") .. "/" .. os.date("%m") .. "/" .. os.date("%Y"),
                VisibleKeybind = Configuration.VisibleKeybind or Enum.KeyCode.RightAlt
            }

            local private = Instance.new("ScreenGui")
            local design = Instance.new("Frame")
            local design_1 = Instance.new("Frame")
            local layout_design_1 = Instance.new("UIListLayout")
            local background = Instance.new("Frame")
            local container_tabs = Instance.new("Frame")
            local header_label = Instance.new("TextLabel")
            local padding_header_label = Instance.new("UIPadding")
            local footer_label = Instance.new("TextLabel")
            local padding_footer_label = Instance.new("UIPadding")
            local cut_tab_buttons = Instance.new("Frame")
            local cut_header = Instance.new("Frame")
            local cut_footer = Instance.new("Frame")
            local container_tab_buttons = Instance.new("Frame")
            local layout_tab_buttons = Instance.new("UIListLayout")
            local padding_tab_buttons = Instance.new("UIPadding")
            local layout_design = Instance.new("UIListLayout")

            private.Name = genKey()
            private.Parent = CoreGuiService

            design.Name = "design"
            design.Parent = private
            design.AnchorPoint = Vector2.new(0.5, 0.5)
            design.BackgroundColor3 = Color3.fromRGB(111, 83, 177)
            design.BorderColor3 = Color3.fromRGB(23, 23, 23)
            design.Position = UDim2.new(0.5, 0, 0.5, 0)
            design.Size = UDim2.new(0, 513, 0, 585)
            designLatency = 0.075
            Drag(
                {
                    Object = design,
                    Latency = designLatency
                }
            )
            local visKey = Configuration.VisibleKeybind
            UserInputService.InputBegan:Connect(
                function(i)
                    if i.KeyCode == visKey then
                        design.Visible = not design.Visible
                    end
                end
            )

            design_1.Name = "design_1"
            design_1.Parent = design
            design_1.AnchorPoint = Vector2.new(0.5, 0.5)
            design_1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
            design_1.BorderColor3 = Color3.fromRGB(23, 23, 23)
            design_1.Position = UDim2.new(0.5, 0, 0.5, 0)
            design_1.Size = UDim2.new(0, 509, 0, 581)

            layout_design_1.Name = "layout_design_1"
            layout_design_1.Parent = design_1
            layout_design_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
            layout_design_1.SortOrder = Enum.SortOrder.LayoutOrder
            layout_design_1.VerticalAlignment = Enum.VerticalAlignment.Center

            background.Name = "background"
            background.Parent = design_1
            background.AnchorPoint = Vector2.new(0.5, 0.5)
            background.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            background.BorderColor3 = Color3.fromRGB(23, 23, 23)
            background.Position = UDim2.new(0.5, 0, 0.5, 0)
            background.Size = UDim2.new(0, 505, 0, 577)

            container_tabs.Name = "container_tabs"
            container_tabs.Parent = background
            container_tabs.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
            container_tabs.BorderSizePixel = 0
            container_tabs.Position = UDim2.new(0.00100000005, 0, 0.0869999975, 0)
            container_tabs.Size = UDim2.new(0, 504, 0, 507)

            header_label.Name = "header_label"
            header_label.Parent = background
            header_label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            header_label.BorderSizePixel = 0
            header_label.Size = UDim2.new(0, 505, 0, 19)
            header_label.Font = Enum.Font.Jura
            header_label.LineHeight = 1.150
            header_label.Text = Configuration.Header
            header_label.TextColor3 = Color3.fromRGB(232, 232, 232)
            header_label.TextSize = 16.000
            header_label.TextStrokeColor3 = Color3.fromRGB(16, 16, 16)
            header_label.TextStrokeTransparency = 0.300
            header_label.TextXAlignment = Enum.TextXAlignment.Left
            header_label.TextTruncate = "AtEnd"

            padding_header_label.Name = "padding_header_label"
            padding_header_label.Parent = header_label
            padding_header_label.PaddingLeft = UDim.new(0, 5)

            footer_label.Name = "footer_label"
            footer_label.Parent = background
            footer_label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            footer_label.BackgroundTransparency = 0.300
            footer_label.BorderSizePixel = 0
            footer_label.Position = UDim2.new(0, 0, 0.967071056, 0)
            footer_label.Size = UDim2.new(0, 505, 0, 19)
            footer_label.Font = Enum.Font.Jura
            footer_label.LineHeight = 1.150
            footer_label.Text = Configuration.Footer
            footer_label.TextColor3 = Color3.fromRGB(200, 200, 200)
            footer_label.TextSize = 15.000
            footer_label.TextStrokeColor3 = Color3.fromRGB(16, 16, 16)
            footer_label.TextStrokeTransparency = 0.500
            footer_label.TextXAlignment = Enum.TextXAlignment.Left
            footer_label.TextTruncate = "AtEnd"

            padding_footer_label.Name = "padding_footer_label"
            padding_footer_label.Parent = footer_label
            padding_footer_label.PaddingLeft = UDim.new(0, 5)

            cut_tab_buttons.Name = "cut_tab_buttons"
            cut_tab_buttons.Parent = background
            cut_tab_buttons.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            cut_tab_buttons.BorderSizePixel = 0
            cut_tab_buttons.Position = UDim2.new(0, 0, 0.0849220082, 0)
            cut_tab_buttons.Size = UDim2.new(0, 505, 0, 1)

            cut_header.Name = "cut_header"
            cut_header.Parent = background
            cut_header.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            cut_header.BackgroundTransparency = 0.300
            cut_header.BorderSizePixel = 0
            cut_header.Position = UDim2.new(0, 0, 0.031195838, 0)
            cut_header.Size = UDim2.new(0, 505, 0, 1)

            cut_footer.Name = "cut_footer"
            cut_footer.Parent = background
            cut_footer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            cut_footer.BackgroundTransparency = 0.600
            cut_footer.BorderSizePixel = 0
            cut_footer.Position = UDim2.new(0, 0, 0.965337932, 0)
            cut_footer.Size = UDim2.new(0, 505, 0, 1)

            container_tab_buttons.Name = "container_tab_buttons"
            container_tab_buttons.Parent = background
            container_tab_buttons.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            container_tab_buttons.BorderSizePixel = 0
            container_tab_buttons.Position = UDim2.new(0, 0, 0.0329289436, 0)
            container_tab_buttons.Size = UDim2.new(0, 505, 0, 30)

            layout_tab_buttons.Name = "layout_tab_buttons"
            layout_tab_buttons.Parent = container_tab_buttons
            layout_tab_buttons.FillDirection = Enum.FillDirection.Horizontal
            layout_tab_buttons.SortOrder = Enum.SortOrder.LayoutOrder
            layout_tab_buttons.VerticalAlignment = Enum.VerticalAlignment.Bottom
            layout_tab_buttons.Padding = UDim.new(0, 4)

            padding_tab_buttons.Name = "padding_tab_buttons"
            padding_tab_buttons.Parent = container_tab_buttons
            padding_tab_buttons.PaddingBottom = UDim.new(0, -1)
            padding_tab_buttons.PaddingLeft = UDim.new(0, 6)
            padding_tab_buttons.PaddingRight = UDim.new(0, 6)

            layout_design.Name = "layout_design"
            layout_design.Parent = design
            layout_design.HorizontalAlignment = Enum.HorizontalAlignment.Center
            layout_design.SortOrder = Enum.SortOrder.LayoutOrder
            layout_design.VerticalAlignment = Enum.VerticalAlignment.Center

            local InterfaceTools = {}
            local isFirstPageAdded = true
            function InterfaceTools:CreatePage(Configuration_Page)
                Configuration_Page = {
                    Subject = Configuration_Page.Subject or "undefined subject",
                    Footer = Configuration_Page.Footer or "undefined footer"
                }

                local button_tab = Instance.new("TextButton")
                local cut_button_tab = Instance.new("Frame")
                local layout_button_tab = Instance.new("UIListLayout")
                local tab = Instance.new("Frame")
                local container_component_right = Instance.new("ScrollingFrame")
                local layout_components_right = Instance.new("UIListLayout")
                local padding_components_right = Instance.new("UIPadding")
                local container_component_left = Instance.new("ScrollingFrame")
                local layout_components_left = Instance.new("UIListLayout")
                local padding_components_left = Instance.new("UIPadding")
                local layout_tab = Instance.new("UIListLayout")

                button_tab.Name = "button_tab"
                button_tab.Parent = container_tab_buttons
                button_tab.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                button_tab.BackgroundTransparency = 0.4
                button_tab.BorderColor3 = Color3.fromRGB(50, 50, 50)
                button_tab.Position = UDim2.new(0.0118811885, 0, 0.233333334, 0)
                button_tab.Size = UDim2.new(0, math.max(15, button_tab.TextBounds.X), 0, 22)
                button_tab.AutoButtonColor = false
                button_tab.Font = Enum.Font.Jura
                button_tab.LineHeight = 1.150
                button_tab.Text = Configuration_Page.Subject
                button_tab.TextColor3 = Color3.fromRGB(180, 180, 180)
                button_tab.TextSize = 14.000
                button_tab.TextStrokeColor3 = Color3.fromRGB(16, 16, 16)
                button_tab.TextStrokeTransparency = 0.300
                button_tab.BorderMode = "Inset"
                button_tab.TextTransparency = 0.4

                local newTabButtonSize =
                    TextService:GetTextSize(
                    button_tab.Text,
                    button_tab.TextSize,
                    button_tab.Font,
                    Vector2.new(math.huge, math.huge)
                )
                button_tab.Size = UDim2.new(0, 12 + newTabButtonSize.X, 0, 22)

                cut_button_tab.Name = "cut_button_tab"
                cut_button_tab.Parent = button_tab
                cut_button_tab.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                cut_button_tab.BorderColor3 = Color3.fromRGB(27, 27, 27)
                cut_button_tab.Position = UDim2.new(0, 0, 1, 0)
                cut_button_tab.Size = UDim2.new(0, button_tab.Size.X.Offset - 4, 0, 1)
                cut_button_tab.ZIndex = 2
                cut_button_tab.Visible = false

                layout_button_tab.Name = "layout_button_tab"
                layout_button_tab.Parent = button_tab
                layout_button_tab.HorizontalAlignment = Enum.HorizontalAlignment.Center
                layout_button_tab.SortOrder = Enum.SortOrder.LayoutOrder
                layout_button_tab.VerticalAlignment = Enum.VerticalAlignment.Bottom

                tab.Name = "tab"
                tab.Parent = container_tabs
                tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                tab.BackgroundTransparency = 1.000
                tab.Size = UDim2.new(0, 504, 0, 507)
                tab.Visible = false

                container_component_right.Name = "container_component_right"
                container_component_right.Parent = tab
                container_component_right.Active = true
                container_component_right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                container_component_right.BackgroundTransparency = 1.000
                container_component_right.BorderSizePixel = 0
                container_component_right.Size = UDim2.new(0, 252, 0, 507)
                container_component_right.ScrollBarThickness = 0

                layout_components_right.Name = "layout_components_right"
                layout_components_right.Parent = container_component_right
                layout_components_right.HorizontalAlignment = Enum.HorizontalAlignment.Center
                layout_components_right.SortOrder = Enum.SortOrder.LayoutOrder
                layout_components_right.Padding = UDim.new(0, 5)

                padding_components_right.Name = "padding_components_right"
                padding_components_right.Parent = container_component_right
                padding_components_right.PaddingTop = UDim.new(0, 10)

                container_component_left.Name = "container_component_left"
                container_component_left.Parent = tab
                container_component_left.Active = true
                container_component_left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                container_component_left.BackgroundTransparency = 1.000
                container_component_left.BorderSizePixel = 0
                container_component_left.Size = UDim2.new(0, 252, 0, 507)
                container_component_left.CanvasSize = UDim2.new(0, 0, 0, 0)
                container_component_left.ScrollBarThickness = 0

                layout_components_left.Name = "layout_components_left"
                layout_components_left.Parent = container_component_left
                layout_components_left.HorizontalAlignment = Enum.HorizontalAlignment.Center
                layout_components_left.SortOrder = Enum.SortOrder.LayoutOrder
                layout_components_left.Padding = UDim.new(0, 5)

                padding_components_left.Name = "padding_components_left"
                padding_components_left.Parent = container_component_left
                padding_components_left.PaddingTop = UDim.new(0, 10)

                layout_tab.Name = "layout_tab"
                layout_tab.Parent = tab
                layout_tab.FillDirection = Enum.FillDirection.Horizontal
                layout_tab.SortOrder = Enum.SortOrder.LayoutOrder
                layout_tab.VerticalAlignment = Enum.VerticalAlignment.Center

                local function updateSize()
                    local csL, csR =
                        layout_components_left.AbsoluteContentSize.Y,
                        layout_components_right.AbsoluteContentSize.Y
                    container_component_left.CanvasSize = UDim2.new(0, 0, 0, csL + 9)
                    container_component_right.CanvasSize = UDim2.new(0, 0, 0, csR + 9)
                end

                local PageIsVisible = false

                if isFirstPageAdded then
                    PageIsVisible = true
                    tab.Visible = true
                    button_tab.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                    button_tab.BackgroundTransparency = 0
                    button_tab.TextColor3 = Color3.fromRGB(222, 222, 222)
                    button_tab.TextTransparency = 0
                    button_tab.TextStrokeTransparency = 0.3
                    button_tab.Size = UDim2.new(0, button_tab.Size.X.Offset, 0, 24)
                    cut_button_tab.Visible = true
                    footer_label.Text = Configuration_Page.Footer
                    updateSize()
                end

                button_tab.MouseButton1Click:Connect(
                    function()
                        for i, v in next, container_tabs:GetChildren() do
                            if v:IsA("Frame") then
                                v.Visible = false
                            end
                        end
                        for i, v in next, container_tab_buttons:GetChildren() do
                            if v:isA("TextButton") then
                                v.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                                v.BackgroundTransparency = 0.4
                                v.TextColor3 = Color3.fromRGB(180, 180, 180)
                                v.TextTransparency = 0.4
                                v.TextStrokeTransparency = 0.4
                                v.Size = UDim2.new(0, v.Size.X.Offset, 0, 22)
                                for z, x in next, v:GetChildren() do
                                    if x:IsA("Frame") then
                                        x.Visible = false
                                    end
                                end
                            end
                        end
                        tab.Visible = true
                        button_tab.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                        button_tab.BackgroundTransparency = 0
                        button_tab.TextColor3 = Color3.fromRGB(222, 222, 222)
                        button_tab.TextTransparency = 0
                        button_tab.TextStrokeTransparency = 0.3
                        button_tab.Size = UDim2.new(0, button_tab.Size.X.Offset, 0, 24)
                        cut_button_tab.Visible = true
                        footer_label.Text = Configuration_Page.Footer
                        updateSize()
                    end
                )

                isFirstPageAdded = false

                local PageTools = {}
                function PageTools:CreateSection(Configuration_Section)
                    Configuration_Section = {
                        Header = Configuration_Section.Header or "Section"
                    }

                    local alignedContainer
                    if layout_components_left.AbsoluteContentSize.Y > layout_components_right.AbsoluteContentSize.Y then
                        alignedContainer = container_component_right
                    else
                        alignedContainer = container_component_left
                    end

                    local section = Instance.new("Frame")
                    local layout_section = Instance.new("UIListLayout")
                    local section_design = Instance.new("Frame")
                    local section_header = Instance.new("TextLabel")
                    local padding_section_header = Instance.new("UIPadding")
                    local constraint_section = Instance.new("UISizeConstraint")

                    section.Name = "section"
                    section.Parent = alignedContainer
                    section.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    section.BorderColor3 = Color3.fromRGB(30, 30, 30)
                    section.Position = UDim2.new(0.0317460336, 0, 0.0197238661, 0)
                    section.Size = UDim2.new(0, 236, 0, 1)

                    layout_section.Name = "layout_section"
                    layout_section.Parent = section
                    layout_section.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    layout_section.SortOrder = Enum.SortOrder.LayoutOrder
                    layout_section.Padding = UDim.new(0, 3)

                    section_design.Name = "section_design"
                    section_design.Parent = section
                    section_design.BackgroundColor3 = Color3.fromRGB(111, 83, 177)
                    section_design.BorderSizePixel = 0
                    section_design.Size = UDim2.new(0, 236, 0, 1)

                    section_header.Name = "section_header"
                    section_header.Parent = section
                    section_header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    section_header.BackgroundTransparency = 1.000
                    section_header.BorderSizePixel = 0
                    section_header.Position = UDim2.new(0, 0, 0.0399999991, 0)
                    section_header.Size = UDim2.new(0, 236, 0, 18)
                    section_header.Font = Enum.Font.Jura
                    section_header.LineHeight = 1.150
                    section_header.Text = Configuration_Section.Header
                    section_header.TextColor3 = Color3.fromRGB(225, 225, 225)
                    section_header.TextSize = 14.000
                    section_header.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
                    section_header.TextStrokeTransparency = 0.300
                    section_header.TextXAlignment = Enum.TextXAlignment.Left
                    section_header.TextTruncate = "AtEnd"

                    padding_section_header.Name = "padding_section_header"
                    padding_section_header.Parent = section_header
                    padding_section_header.PaddingLeft = UDim.new(0, 7)

                    constraint_section.Name = "constraint_section"
                    constraint_section.Parent = section
                    constraint_section.MinSize = Vector2.new(236, 26)

                    if Configuration_Section.Header == "" then
                        section_header:Destroy()
                    end

                    updateSize()

                    local function updateSection()
                        local sc = layout_section.AbsoluteContentSize.Y
                        section.Size = UDim2.new(0, 236, 0, sc + 4)
                    end

                    local SectionTools = {}
                    function SectionTools:CreateButton(Configuration_Button)
                        Configuration_Button = {
                            Text = Configuration_Button.Text or "button",
                            Script = Configuration_Button.Script or function()
                                end
                        }

                        local design_button = Instance.new("Frame")
                        local layout_design_button = Instance.new("UIListLayout")
                        local button = Instance.new("TextButton")
                        local gradient_design_button = Instance.new("UIGradient")
                        local layout_button = Instance.new("UIListLayout")
                        local button_text = Instance.new("TextLabel")
                        local gradient_design_button_2 = Instance.new("UIGradient")

                        design_button.Name = "design_button"
                        design_button.Parent = section
                        design_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_button.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_button.Size = UDim2.new(0, 221, 0, 16)

                        layout_design_button.Name = "layout_design_button"
                        layout_design_button.Parent = design_button
                        layout_design_button.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_button.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_button.VerticalAlignment = Enum.VerticalAlignment.Center

                        button.Name = "button"
                        button.Parent = design_button
                        button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button.BorderSizePixel = 0
                        button.Size = UDim2.new(0, 219, 0, 14)
                        button.AutoButtonColor = false
                        button.Font = Enum.Font.Jura
                        button.Text = ""
                        button.TextColor3 = Color3.fromRGB(225, 225, 225)
                        button.TextSize = 14.000

                        gradient_design_button.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                        }
                        gradient_design_button.Rotation = 90
                        gradient_design_button.Name = "gradient_design_button"
                        gradient_design_button.Parent = button

                        layout_button.Name = "layout_button"
                        layout_button.Parent = button
                        layout_button.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_button.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_button.VerticalAlignment = Enum.VerticalAlignment.Center

                        button_text.Name = "button_text"
                        button_text.Parent = button
                        button_text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button_text.BackgroundTransparency = 1.000
                        button_text.Size = UDim2.new(0, 219, 0, 14)
                        button_text.Font = Enum.Font.Jura
                        button_text.LineHeight = 1
                        button_text.Text = Configuration_Button.Text
                        button_text.TextColor3 = Color3.fromRGB(220, 220, 220)
                        button_text.TextSize = 13.000
                        button_text.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
                        button_text.TextStrokeTransparency = 0.300

                        gradient_design_button_2.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(33, 33, 33)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
                        }
                        gradient_design_button_2.Rotation = 90
                        gradient_design_button_2.Name = "gradient_design_button"
                        gradient_design_button_2.Parent = design_button

                        updateSection()
                        updateSize()

                        button.MouseEnter:Connect(
                            function()
                                gradient_design_button_2.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(132, 100, 213)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(93, 71, 152))
                                }
                            end
                        )
                        button.MouseLeave:Connect(
                            function()
                                gradient_design_button_2.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                                }
                            end
                        )

                        button.MouseButton1Down:Connect(
                            function()
                                gradient_design_button.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 24, 24)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                                }
                            end
                        )
                        button.MouseButton1Up:Connect(
                            function()
                                gradient_design_button.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(47, 47, 47)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(42, 42, 42))
                                }
                                wait(.2)
                                gradient_design_button.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 31, 31)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
                                }
                            end
                        )

                        button.MouseButton1Click:Connect(
                            function()
                                Configuration_Button.Script()
                            end
                        )

                        local ButtonTools = {}
                        function ButtonTools.SetText(new)
                            button_text.Text = new
                        end
                        function SetLocalButtonText(new)
                            button_text.Text = new
                        end
                        return ButtonTools
                    end
                    function SectionTools:CreateToggle(Configuration_Toggle)
                        Configuration_Toggle = {
                            Text = Configuration_Toggle.Text or "toggle",
                            Latency = Configuration_Toggle.Latency or 0,
                            Script = Configuration_Toggle.Script or function()
                                    print("toggled")
                                end
                        }

                        local button_toggle = Instance.new("TextButton")
                        local layout_button_toggle = Instance.new("UIListLayout")
                        local design_button_toggle = Instance.new("Frame")
                        local layout_design_button_toggle = Instance.new("UIListLayout")
                        local gradient_design_button_toggle = Instance.new("UIGradient")
                        local design_button_toggle_2 = Instance.new("Frame")
                        local layout_design_button_toggle_2 = Instance.new("UIListLayout")
                        local gradient_design_button_toggle_2 = Instance.new("UIGradient")
                        local padding_button_toggle = Instance.new("UIPadding")

                        button_toggle.Name = "button_toggle"
                        button_toggle.Parent = section
                        button_toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button_toggle.BackgroundTransparency = 1.000
                        button_toggle.Position = UDim2.new(0, 0, 0.109170303, 0)
                        button_toggle.Size = UDim2.new(0, 236, 0, 20)
                        button_toggle.Font = Enum.Font.Jura
                        button_toggle.LineHeight = 1.250
                        button_toggle.Text = "        " .. Configuration_Toggle.Text
                        button_toggle.TextColor3 = Color3.fromRGB(220, 220, 220)
                        button_toggle.TextSize = 14.000
                        button_toggle.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
                        button_toggle.TextStrokeTransparency = 0.300
                        button_toggle.TextXAlignment = Enum.TextXAlignment.Left

                        layout_button_toggle.Name = "layout_button_toggle"
                        layout_button_toggle.Parent = button_toggle
                        layout_button_toggle.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_button_toggle.VerticalAlignment = Enum.VerticalAlignment.Center

                        design_button_toggle.Name = "design_button_toggle"
                        design_button_toggle.Parent = button_toggle
                        design_button_toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_button_toggle.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_button_toggle.Position = UDim2.new(0, 0, 0.192307696, 0)
                        design_button_toggle.Size = UDim2.new(0, 14, 0, 14)

                        layout_design_button_toggle.Name = "layout_design_button_toggle"
                        layout_design_button_toggle.Parent = design_button_toggle
                        layout_design_button_toggle.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_button_toggle.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_button_toggle.VerticalAlignment = Enum.VerticalAlignment.Center

                        gradient_design_button_toggle.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                        }
                        gradient_design_button_toggle.Rotation = 90
                        gradient_design_button_toggle.Name = "gradient_design_button_toggle"
                        gradient_design_button_toggle.Parent = design_button_toggle

                        design_button_toggle_2.Name = "design_button_toggle_2"
                        design_button_toggle_2.Parent = design_button_toggle
                        design_button_toggle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_button_toggle_2.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_button_toggle_2.BorderSizePixel = 0
                        design_button_toggle_2.Position = UDim2.new(0, 0, 0.192307696, 0)
                        design_button_toggle_2.Size = UDim2.new(0, 12, 0, 12)

                        layout_design_button_toggle_2.Name = "layout_design_button_toggle_2"
                        layout_design_button_toggle_2.Parent = design_button_toggle_2
                        layout_design_button_toggle_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_button_toggle_2.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_button_toggle_2.VerticalAlignment = Enum.VerticalAlignment.Center

                        gradient_design_button_toggle_2.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                        }
                        gradient_design_button_toggle_2.Rotation = 90
                        gradient_design_button_toggle_2.Name = "gradient_design_button_toggle_2"
                        gradient_design_button_toggle_2.Parent = design_button_toggle_2

                        padding_button_toggle.Name = "padding_button_toggle"
                        padding_button_toggle.Parent = button_toggle
                        padding_button_toggle.PaddingLeft = UDim.new(0, 8)

                        updateSection()
                        updateSize()

                        local ToggleEnabled = false
                        button_toggle.MouseButton1Click:Connect(
                            function()
                                ToggleEnabled = not ToggleEnabled
                                local ToggleGradient =
                                    ToggleEnabled and
                                    ColorSequence.new {
                                        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 78, 167)),
                                        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(70, 53, 115))
                                    } or
                                    ColorSequence.new {
                                        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                                        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                                    }
                                gradient_design_button_toggle_2.Color = ToggleGradient

                                while ToggleEnabled and wait(Configuration_Toggle.Latency) do
                                    Configuration_Toggle.Script()
                                end
                            end
                        )

                        button_toggle.MouseEnter:Connect(
                            function()
                                gradient_design_button_toggle.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(132, 100, 213)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(93, 71, 152))
                                }
                            end
                        )
                        button_toggle.MouseLeave:Connect(
                            function()
                                gradient_design_button_toggle.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                                }
                            end
                        )

                        local ToggleTools = {}
                        function SetLocalToggleText(new)
                            button_toggle.Text = new
                        end
                        function ToggleTools.SetText(new)
                            button_toggle.Text = new
                        end
                        return ToggleTools
                    end
                    function SectionTools:CreateDropdown(Configuration_Dropdown)
                        Configuration_Dropdown = {
                            Text = Configuration_Dropdown.Text or "dropdown",
                            Default = Configuration_Dropdown.Default or ". . .",
                            Options = Configuration_Dropdown.Options or {},
                            Script = Configuration_Dropdown.Script or function()
                                    print("dropdown")
                                end
                        }

                        local holder_dropdown = Instance.new("Frame")
                        local layout_holder_dropdown = Instance.new("UIListLayout")
                        local label_dropdown = Instance.new("TextLabel")
                        local design_dropdown = Instance.new("Frame")
                        local layout_design_dropdown = Instance.new("UIListLayout")
                        local button_dropdown = Instance.new("TextButton")
                        local layout_button_dropdown = Instance.new("UIListLayout")
                        local button_dropdown_text = Instance.new("TextLabel")
                        local gradient_button_dropdown = Instance.new("UIGradient")
                        local button_dropdown_arrow = Instance.new("ImageLabel")
                        local gradient_button_dropdown_arrow = Instance.new("UIGradient")
                        local gradient_design_dropdown = Instance.new("UIGradient")
                        local padding_design_dropdown = Instance.new("UIPadding")
                        local dropdown_container = Instance.new("Frame")
                        local layout_dropdown_container = Instance.new("UIListLayout")

                        holder_dropdown.Name = "holder_dropdown"
                        holder_dropdown.Parent = section
                        holder_dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        holder_dropdown.BackgroundTransparency = 1.000
                        holder_dropdown.Position = UDim2.new(0.0317796618, 0, 0.0733137801, 0)
                        holder_dropdown.Size = UDim2.new(0, 221, 0, 34)
                        holder_dropdown.ZIndex = 3

                        layout_holder_dropdown.Name = "layout_holder_dropdown"
                        layout_holder_dropdown.Parent = holder_dropdown
                        layout_holder_dropdown.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_holder_dropdown.Padding = UDim.new(0, 2)

                        label_dropdown.Name = "label_dropdown"
                        label_dropdown.Parent = holder_dropdown
                        label_dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        label_dropdown.BackgroundTransparency = 1.000
                        label_dropdown.Position = UDim2.new(0, 0, 0.615384638, 0)
                        label_dropdown.Size = UDim2.new(0, 223, 0, 14)
                        label_dropdown.Font = Enum.Font.Jura
                        label_dropdown.Text = Configuration_Dropdown.Text
                        label_dropdown.TextColor3 = Color3.fromRGB(225, 225, 225)
                        label_dropdown.TextSize = 13.000
                        label_dropdown.TextStrokeColor3 = Color3.fromRGB(15, 15, 15)
                        label_dropdown.TextStrokeTransparency = 0.300
                        label_dropdown.TextXAlignment = Enum.TextXAlignment.Left

                        design_dropdown.Name = "design_dropdown"
                        design_dropdown.Parent = holder_dropdown
                        design_dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_dropdown.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_dropdown.ClipsDescendants = true
                        design_dropdown.Position = UDim2.new(0.0317796618, 0, 0.0733137801, 0)
                        design_dropdown.Size = UDim2.new(0, 221, 0, 16)

                        layout_design_dropdown.Name = "layout_design_dropdown"
                        layout_design_dropdown.Parent = design_dropdown
                        layout_design_dropdown.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_dropdown.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_dropdown.Padding = UDim.new(0, 1)

                        button_dropdown.Name = "button_dropdown"
                        button_dropdown.Parent = design_dropdown
                        button_dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button_dropdown.BorderSizePixel = 0
                        button_dropdown.Size = UDim2.new(0, 219, 0, 14)
                        button_dropdown.AutoButtonColor = false
                        button_dropdown.Font = Enum.Font.Jura
                        button_dropdown.LineHeight = 1.100
                        button_dropdown.Text = ""
                        button_dropdown.TextColor3 = Color3.fromRGB(225, 225, 225)
                        button_dropdown.TextSize = 14.000

                        layout_button_dropdown.Name = "layout_button_dropdown"
                        layout_button_dropdown.Parent = button_dropdown
                        layout_button_dropdown.FillDirection = Enum.FillDirection.Horizontal
                        layout_button_dropdown.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_button_dropdown.VerticalAlignment = Enum.VerticalAlignment.Center

                        button_dropdown_text.Name = "button_dropdown_text"
                        button_dropdown_text.Parent = button_dropdown
                        button_dropdown_text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button_dropdown_text.BackgroundTransparency = 1.000
                        button_dropdown_text.Size = UDim2.new(0, 202, 0, 14)
                        button_dropdown_text.Font = Enum.Font.Jura
                        button_dropdown_text.LineHeight = 1.200
                        button_dropdown_text.Text = "  " .. Configuration_Dropdown.Default
                        button_dropdown_text.TextColor3 = Color3.fromRGB(220, 220, 220)
                        button_dropdown_text.TextSize = 12.000
                        button_dropdown_text.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
                        button_dropdown_text.TextStrokeTransparency = 0.300
                        button_dropdown_text.TextXAlignment = Enum.TextXAlignment.Left

                        gradient_button_dropdown.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                        }
                        gradient_button_dropdown.Rotation = 90
                        gradient_button_dropdown.Name = "gradient_button_dropdown"
                        gradient_button_dropdown.Parent = button_dropdown

                        button_dropdown_arrow.Name = "button_dropdown_arrow"
                        button_dropdown_arrow.Parent = button_dropdown
                        button_dropdown_arrow.Active = false
                        button_dropdown_arrow.BackgroundTransparency = 1.000
                        button_dropdown_arrow.LayoutOrder = 6
                        button_dropdown_arrow.Position = UDim2.new(0.844748855, 0, -0.392857134, 0)
                        button_dropdown_arrow.Size = UDim2.new(0, 14, 0, 14)
                        button_dropdown_arrow.ZIndex = 1
                        button_dropdown_arrow.Image = "rbxassetid://3926307971"
                        button_dropdown_arrow.ImageRectOffset = Vector2.new(324, 524)
                        button_dropdown_arrow.ImageRectSize = Vector2.new(36, 36)
                        button_dropdown_arrow.ScaleType = Enum.ScaleType.Fit

                        gradient_button_dropdown_arrow.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(167, 167, 167)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(127, 127, 127))
                        }
                        gradient_button_dropdown_arrow.Rotation = 90
                        gradient_button_dropdown_arrow.Name = "gradient_button_dropdown_arrow"
                        gradient_button_dropdown_arrow.Parent = button_dropdown_arrow

                        gradient_design_dropdown.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(33, 33, 33)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
                        }
                        gradient_design_dropdown.Rotation = 90
                        gradient_design_dropdown.Name = "gradient_design_dropdown"
                        gradient_design_dropdown.Parent = design_dropdown

                        padding_design_dropdown.Name = "padding_design_dropdown"
                        padding_design_dropdown.Parent = design_dropdown
                        padding_design_dropdown.PaddingTop = UDim.new(0, 1)

                        dropdown_container.Name = "dropdown_container"
                        dropdown_container.Parent = design_dropdown
                        dropdown_container.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                        dropdown_container.BackgroundTransparency = 0
                        dropdown_container.BorderSizePixel = 0
                        dropdown_container.Position = UDim2.new(0.00452488707, 0, 1, 0)
                        dropdown_container.Size = UDim2.new(0, 219, 0, 0)
                        dropdown_container.ZIndex = 4

                        layout_dropdown_container.Name = "layout_dropdown_container"
                        layout_dropdown_container.Parent = dropdown_container
                        layout_dropdown_container.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_dropdown_container.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_dropdown_container.Padding = UDim.new(0, 2)

                        local function updateDropdown()
                            local csD = layout_dropdown_container.AbsoluteContentSize.Y
                            dropdown_container.Size = UDim2.new(0, 129, 0, csD + 1)
                        end

                        local dropdownIsOpen = false
                        button_dropdown.MouseButton1Click:Connect(
                            function()
                                dropdownIsOpen = not dropdownIsOpen
                                local designSize =
                                    dropdownIsOpen and UDim2.new(0, 221, 0, dropdown_container.Size.Y.Offset + 16) or
                                    UDim2.new(0, 221, 0, 16)
                                design_dropdown.Size = designSize
                                updateDropdown()
                            end
                        )

                        button_dropdown.MouseEnter:Connect(
                            function()
                                gradient_button_dropdown.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(132, 100, 213)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(93, 71, 152))
                                }
                            end
                        )
                        button_dropdown.MouseLeave:Connect(
                            function()
                                gradient_button_dropdown.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                                }
                            end
                        )

                        for i, v in next, Configuration_Dropdown.Options do
                            local button_dropdown_option = Instance.new("TextButton")
                            local layout_button_dropdown_option = Instance.new("UIListLayout")
                            local button_dropdown_text_2 = Instance.new("TextLabel")
                            local gradient_button_dropdown_option = Instance.new("UIGradient")

                            button_dropdown_option.Name = "button_dropdown_option"
                            button_dropdown_option.Parent = dropdown_container
                            button_dropdown_option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button_dropdown_option.BorderSizePixel = 0
                            button_dropdown_option.Size = UDim2.new(0, 219, 0, 12)
                            button_dropdown_option.AutoButtonColor = false
                            button_dropdown_option.Font = Enum.Font.Jura
                            button_dropdown_option.LineHeight = 1.100
                            button_dropdown_option.Text = ""
                            button_dropdown_option.TextColor3 = Color3.fromRGB(200, 200, 200)
                            button_dropdown_option.TextSize = 14.000
                            button_dropdown_option.ZIndex = 5

                            layout_button_dropdown_option.Name = "layout_button_dropdown_option"
                            layout_button_dropdown_option.Parent = button_dropdown_option
                            layout_button_dropdown_option.FillDirection = Enum.FillDirection.Horizontal
                            layout_button_dropdown_option.HorizontalAlignment = Enum.HorizontalAlignment.Center
                            layout_button_dropdown_option.SortOrder = Enum.SortOrder.LayoutOrder
                            layout_button_dropdown_option.VerticalAlignment = Enum.VerticalAlignment.Center

                            button_dropdown_text_2.Name = "button_dropdown_text"
                            button_dropdown_text_2.Parent = button_dropdown_option
                            button_dropdown_text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button_dropdown_text_2.BackgroundTransparency = 1.000
                            button_dropdown_text_2.Position = UDim2.new(0.00688073412, 0, -0.0833333358, 0)
                            button_dropdown_text_2.Size = UDim2.new(0, 217, 0, 14)
                            button_dropdown_text_2.Font = Enum.Font.Jura
                            button_dropdown_text_2.LineHeight = 1.170
                            button_dropdown_text_2.Text = v
                            button_dropdown_text_2.TextColor3 = Color3.fromRGB(200, 200, 200)
                            button_dropdown_text_2.TextSize = 13.000
                            button_dropdown_text_2.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
                            button_dropdown_text_2.TextStrokeTransparency = 0.300
                            button_dropdown_text_2.ZIndex = 6

                            gradient_button_dropdown_option.Color =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)),
                                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(21, 21, 21))
                            }
                            gradient_button_dropdown_option.Rotation = 90
                            gradient_button_dropdown_option.Name = "gradient_button_dropdown_option"
                            gradient_button_dropdown_option.Parent = button_dropdown_option

                            button_dropdown_option.MouseButton1Click:Connect(
                                function()
                                    if dropdownIsOpen then
                                        for z, x in next, dropdown_container:GetChildren() do
                                            if x:IsA("TextButton") then
                                                for b, n in next, x:GetChildren() do
                                                    if n:IsA("TextLabel") then
                                                        n.TextColor3 = Color3.fromRGB(200, 200, 200)
                                                    end
                                                end
                                            end
                                        end
                                        button_dropdown_text_2.TextColor3 = Color3.fromRGB(116, 88, 188)
                                        button_dropdown_text.Text = "  " .. button_dropdown_text_2.Text
                                        design_dropdown.Size = UDim2.new(0, 221, 0, 16)
                                        dropdownIsOpen = false
                                        Configuration_Dropdown.Script(button_dropdown_text_2.Text)
                                        updateDropdown()
                                        updateSection()
                                        updateSize()
                                    end
                                end
                            )
                        end

                        updateDropdown()
                        updateSection()
                        updateSize()

                        local DropdownTools = {}
                        function SetLocalDropdownText(new)
                            label_dropdown.Text = new
                        end
                        function DropdownTools.SetText(new)
                            label_dropdown.Text = new
                        end
                        function AddLocalDropdownOption(option)
                            local button_dropdown_option = Instance.new("TextButton")
                            local layout_button_dropdown_option = Instance.new("UIListLayout")
                            local button_dropdown_text_2 = Instance.new("TextLabel")
                            local gradient_button_dropdown_option = Instance.new("UIGradient")

                            button_dropdown_option.Name = "button_dropdown_option"
                            button_dropdown_option.Parent = dropdown_container
                            button_dropdown_option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button_dropdown_option.BorderSizePixel = 0
                            button_dropdown_option.Size = UDim2.new(0, 219, 0, 12)
                            button_dropdown_option.AutoButtonColor = false
                            button_dropdown_option.Font = Enum.Font.Jura
                            button_dropdown_option.LineHeight = 1.100
                            button_dropdown_option.Text = ""
                            button_dropdown_option.TextColor3 = Color3.fromRGB(200, 200, 200)
                            button_dropdown_option.TextSize = 14.000
                            button_dropdown_option.ZIndex = 5

                            layout_button_dropdown_option.Name = "layout_button_dropdown_option"
                            layout_button_dropdown_option.Parent = button_dropdown_option
                            layout_button_dropdown_option.FillDirection = Enum.FillDirection.Horizontal
                            layout_button_dropdown_option.HorizontalAlignment = Enum.HorizontalAlignment.Center
                            layout_button_dropdown_option.SortOrder = Enum.SortOrder.LayoutOrder
                            layout_button_dropdown_option.VerticalAlignment = Enum.VerticalAlignment.Center

                            button_dropdown_text_2.Name = "button_dropdown_text"
                            button_dropdown_text_2.Parent = button_dropdown_option
                            button_dropdown_text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button_dropdown_text_2.BackgroundTransparency = 1.000
                            button_dropdown_text_2.Position = UDim2.new(0.00688073412, 0, -0.0833333358, 0)
                            button_dropdown_text_2.Size = UDim2.new(0, 217, 0, 14)
                            button_dropdown_text_2.Font = Enum.Font.Jura
                            button_dropdown_text_2.LineHeight = 1.170
                            button_dropdown_text_2.Text = option
                            button_dropdown_text_2.TextColor3 = Color3.fromRGB(200, 200, 200)
                            button_dropdown_text_2.TextSize = 13.000
                            button_dropdown_text_2.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
                            button_dropdown_text_2.TextStrokeTransparency = 0.300
                            button_dropdown_text_2.ZIndex = 6

                            gradient_button_dropdown_option.Color =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)),
                                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(21, 21, 21))
                            }
                            gradient_button_dropdown_option.Rotation = 90
                            gradient_button_dropdown_option.Name = "gradient_button_dropdown_option"
                            gradient_button_dropdown_option.Parent = button_dropdown_option

                            button_dropdown_option.MouseButton1Click:Connect(
                                function()
                                    if dropdownIsOpen then
                                        for z, x in next, dropdown_container:GetChildren() do
                                            if x:IsA("TextButton") then
                                                for b, n in next, x:GetChildren() do
                                                    if n:IsA("TextLabel") then
                                                        n.TextColor3 = Color3.fromRGB(200, 200, 200)
                                                    end
                                                end
                                            end
                                        end
                                        button_dropdown_text_2.TextColor3 = Color3.fromRGB(116, 88, 188)
                                        button_dropdown_text.Text = "  " .. button_dropdown_text_2.Text
                                        design_dropdown.Size = UDim2.new(0, 221, 0, 16)
                                        dropdownIsOpen = false
                                        Configuration_Dropdown.Script(button_dropdown_text_2.Text)
                                        updateDropdown()
                                        updateSection()
                                        updateSize()
                                    end
                                end
                            )
                            updateDropdown()
                            updateSection()
                            updateSize()
                            Configuration_Dropdown.Options[option] = option
                        end
                        function DropdownTools.AddOption(option)
                            local button_dropdown_option = Instance.new("TextButton")
                            local layout_button_dropdown_option = Instance.new("UIListLayout")
                            local button_dropdown_text_2 = Instance.new("TextLabel")
                            local gradient_button_dropdown_option = Instance.new("UIGradient")

                            button_dropdown_option.Name = "button_dropdown_option"
                            button_dropdown_option.Parent = dropdown_container
                            button_dropdown_option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button_dropdown_option.BorderSizePixel = 0
                            button_dropdown_option.Size = UDim2.new(0, 219, 0, 12)
                            button_dropdown_option.AutoButtonColor = false
                            button_dropdown_option.Font = Enum.Font.Jura
                            button_dropdown_option.LineHeight = 1.100
                            button_dropdown_option.Text = ""
                            button_dropdown_option.TextColor3 = Color3.fromRGB(200, 200, 200)
                            button_dropdown_option.TextSize = 14.000
                            button_dropdown_option.ZIndex = 5

                            layout_button_dropdown_option.Name = "layout_button_dropdown_option"
                            layout_button_dropdown_option.Parent = button_dropdown_option
                            layout_button_dropdown_option.FillDirection = Enum.FillDirection.Horizontal
                            layout_button_dropdown_option.HorizontalAlignment = Enum.HorizontalAlignment.Center
                            layout_button_dropdown_option.SortOrder = Enum.SortOrder.LayoutOrder
                            layout_button_dropdown_option.VerticalAlignment = Enum.VerticalAlignment.Center

                            button_dropdown_text_2.Name = "button_dropdown_text"
                            button_dropdown_text_2.Parent = button_dropdown_option
                            button_dropdown_text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button_dropdown_text_2.BackgroundTransparency = 1.000
                            button_dropdown_text_2.Position = UDim2.new(0.00688073412, 0, -0.0833333358, 0)
                            button_dropdown_text_2.Size = UDim2.new(0, 217, 0, 14)
                            button_dropdown_text_2.Font = Enum.Font.Jura
                            button_dropdown_text_2.LineHeight = 1.170
                            button_dropdown_text_2.Text = option
                            button_dropdown_text_2.TextColor3 = Color3.fromRGB(200, 200, 200)
                            button_dropdown_text_2.TextSize = 13.000
                            button_dropdown_text_2.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
                            button_dropdown_text_2.TextStrokeTransparency = 0.300
                            button_dropdown_text_2.ZIndex = 6

                            gradient_button_dropdown_option.Color =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)),
                                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(21, 21, 21))
                            }
                            gradient_button_dropdown_option.Rotation = 90
                            gradient_button_dropdown_option.Name = "gradient_button_dropdown_option"
                            gradient_button_dropdown_option.Parent = button_dropdown_option

                            button_dropdown_option.MouseButton1Click:Connect(
                                function()
                                    if dropdownIsOpen then
                                        for z, x in next, dropdown_container:GetChildren() do
                                            if x:IsA("TextButton") then
                                                for b, n in next, x:GetChildren() do
                                                    if n:IsA("TextLabel") then
                                                        n.TextColor3 = Color3.fromRGB(200, 200, 200)
                                                    end
                                                end
                                            end
                                        end
                                        button_dropdown_text_2.TextColor3 = Color3.fromRGB(116, 88, 188)
                                        button_dropdown_text.Text = "  " .. button_dropdown_text_2.Text
                                        design_dropdown.Size = UDim2.new(0, 221, 0, 16)
                                        dropdownIsOpen = false
                                        Configuration_Dropdown.Script(button_dropdown_text_2.Text)
                                        updateDropdown()
                                        updateSection()
                                        updateSize()
                                    end
                                end
                            )
                            updateDropdown()
                            updateSection()
                            updateSize()
                            Configuration_Dropdown.Options[option] = option
                        end
                        function RemoveLocalDropdownOption(option)
                            for i, v in next, dropdown_container:GetChildren() do
                                if v:IsA("TextButton") then
                                    for z, x in next, v:GetChildren() do
                                        if x:IsA("TextLabel") and x.Text == option then
                                            v:Destroy()
                                            Configuration_Dropdown.Options[option] = nil
                                        end
                                    end
                                end
                            end
                            updateDropdown()
                            updateSection()
                            updateSize()
                        end
                        function DropdownTools.RemoveOption(option)
                            for i, v in next, dropdown_container:GetChildren() do
                                if v:IsA("TextButton") then
                                    for z, x in next, v:GetChildren() do
                                        if x:IsA("TextLabel") and x.Text == option then
                                            v:Destroy()
                                            Configuration_Dropdown.Options[option] = nil
                                        end
                                    end
                                end
                            end
                            updateDropdown()
                            updateSection()
                            updateSize()
                        end
                        return DropdownTools
                    end
                    function SectionTools:CreateSlider(Configuration_Slider)
                        Configuration_Slider = {
                            Text = Configuration_Slider.Text or "slider",
                            Suffix = Configuration_Slider.Suffix or "",
                            Values = {
                                Minimum = Configuration_Slider.Values.Minimum or 0,
                                Maximum = Configuration_Slider.Values.Maximum or 100,
                                Default = Configuration_Slider.Values.Default or 0
                            },
                            Script = Configuration_Slider.Script or function()
                                end
                        }

                        local holder_slider = Instance.new("Frame")
                        local layout_holder_slider = Instance.new("UIListLayout")
                        local label_holder_slider = Instance.new("TextLabel")
                        local design_slider = Instance.new("Frame")
                        local layout_design_slider = Instance.new("UIListLayout")
                        local gradient_design_slider = Instance.new("UIGradient")
                        local button_slider = Instance.new("TextButton")
                        local gradient_button_slider = Instance.new("UIGradient")
                        local design_2_slider = Instance.new("Frame")
                        local gradient_design_2_slider = Instance.new("UIGradient")
                        local padding_design_2_slider = Instance.new("UIPadding")
                        local layout_button_slider = Instance.new("UIListLayout")
                        local padding_button_slider = Instance.new("UIPadding")
                        local antiLayoutSliderFolder = Instance.new("Folder")
                        local button_slider_value = Instance.new("TextLabel")
                        local antiLayoutSliderFolder_2 = Instance.new("Folder")
                        local invisible_slider_cut = Instance.new("Frame")
                        local gradient_invisible_slider_cut = Instance.new("UIGradient")
                        local layout_antiLayoutSliderFolder = Instance.new("UIListLayout")
                        local padding_antiLayoutSliderFolder = Instance.new("UIPadding")

                        holder_slider.Name = "holder_slider"
                        holder_slider.Parent = section
                        holder_slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        holder_slider.BackgroundTransparency = 1.000
                        holder_slider.Position = UDim2.new(0.0317796618, 0, 0.208333328, 0)
                        holder_slider.Size = UDim2.new(0, 221, 0, 32)

                        layout_holder_slider.Name = "layout_holder_slider"
                        layout_holder_slider.Parent = holder_slider
                        layout_holder_slider.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_holder_slider.Padding = UDim.new(0, 2)

                        label_holder_slider.Name = "label_holder_slider"
                        label_holder_slider.Parent = holder_slider
                        label_holder_slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        label_holder_slider.BackgroundTransparency = 1.000
                        label_holder_slider.Position = UDim2.new(0, 0, 0.615384638, 0)
                        label_holder_slider.Size = UDim2.new(0, 223, 0, 14)
                        label_holder_slider.Font = Enum.Font.Jura
                        label_holder_slider.Text = Configuration_Slider.Text
                        label_holder_slider.TextColor3 = Color3.fromRGB(225, 225, 225)
                        label_holder_slider.TextSize = 13.000
                        label_holder_slider.TextStrokeColor3 = Color3.fromRGB(15, 15, 15)
                        label_holder_slider.TextStrokeTransparency = 0.300
                        label_holder_slider.TextXAlignment = Enum.TextXAlignment.Left

                        design_slider.Name = "design_slider"
                        design_slider.Parent = holder_slider
                        design_slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_slider.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_slider.ClipsDescendants = true
                        design_slider.Position = UDim2.new(0, 0, 0.533333361, 0)
                        design_slider.Size = UDim2.new(0, 221, 0, 14)

                        layout_design_slider.Name = "layout_design_slider"
                        layout_design_slider.Parent = design_slider
                        layout_design_slider.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_slider.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_slider.VerticalAlignment = Enum.VerticalAlignment.Center
                        layout_design_slider.Padding = UDim.new(0, 1)

                        gradient_design_slider.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(33, 33, 33)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
                        }
                        gradient_design_slider.Rotation = 90
                        gradient_design_slider.Name = "gradient_design_slider"
                        gradient_design_slider.Parent = design_slider

                        button_slider.Name = "button_slider"
                        button_slider.Parent = design_slider
                        button_slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button_slider.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        button_slider.Size = UDim2.new(0, 217, 0, 10)
                        button_slider.AutoButtonColor = false
                        button_slider.Font = Enum.Font.SourceSans
                        button_slider.Text = ""
                        button_slider.TextColor3 = Color3.fromRGB(0, 0, 0)
                        button_slider.TextSize = 14.000
                        button_slider.ClipsDescendants = true

                        gradient_button_slider.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                        }
                        gradient_button_slider.Rotation = 90
                        gradient_button_slider.Name = "gradient_button_slider"
                        gradient_button_slider.Parent = button_slider

                        design_2_slider.Name = "design_2_slider"
                        design_2_slider.Parent = button_slider
                        design_2_slider.AnchorPoint = Vector2.new(0.5, 0.5)
                        design_2_slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_2_slider.BorderSizePixel = 0
                        design_2_slider.Position = UDim2.new(0.0311059915, 0, 0.5, 0)
                        design_2_slider.Size = UDim2.new(0, 0, 0, 8)

                        gradient_design_2_slider.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 78, 167)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55, 42, 91))
                        }
                        gradient_design_2_slider.Rotation = 90
                        gradient_design_2_slider.Name = "gradient_design_2_slider"
                        gradient_design_2_slider.Parent = design_2_slider

                        padding_design_2_slider.Name = "padding_design_2_slider"
                        padding_design_2_slider.Parent = design_2_slider
                        padding_design_2_slider.PaddingRight = UDim.new(0, 1)

                        layout_button_slider.Name = "layout_button_slider"
                        layout_button_slider.Parent = button_slider
                        layout_button_slider.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_button_slider.VerticalAlignment = Enum.VerticalAlignment.Center

                        padding_button_slider.Name = "padding_button_slider"
                        padding_button_slider.Parent = button_slider
                        padding_button_slider.PaddingLeft = UDim.new(0, 1)

                        antiLayoutSliderFolder.Parent = button_slider

                        button_slider_value.Name = "button_slider_value"
                        button_slider_value.Parent = antiLayoutSliderFolder
                        button_slider_value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button_slider_value.BackgroundTransparency = 1.000
                        button_slider_value.Size = UDim2.new(0, 217, 0, 10)
                        button_slider_value.Font = Enum.Font.Jura
                        button_slider_value.LineHeight = 1.400
                        button_slider_value.Text = "0%"
                        button_slider_value.TextColor3 = Color3.fromRGB(225, 225, 225)
                        button_slider_value.TextSize = 12.000

                        antiLayoutSliderFolder_2.Name = "antiLayoutSliderFolder_2"
                        antiLayoutSliderFolder_2.Parent = button_slider

                        invisible_slider_cut.Name = "invisible_slider_cut"
                        invisible_slider_cut.Parent = antiLayoutSliderFolder_2
                        invisible_slider_cut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        invisible_slider_cut.BorderSizePixel = 0
                        invisible_slider_cut.Position = UDim2.new(1, 0, 0.100000001, 0)
                        invisible_slider_cut.Size = UDim2.new(0, 1, 0, 10)
                        invisible_slider_cut.ZIndex = 4

                        gradient_invisible_slider_cut.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                        }
                        gradient_invisible_slider_cut.Rotation = 90
                        gradient_invisible_slider_cut.Name = "gradient_invisible_slider_cut"
                        gradient_invisible_slider_cut.Parent = invisible_slider_cut

                        layout_antiLayoutSliderFolder.Name = "layout_antiLayoutSliderFolder"
                        layout_antiLayoutSliderFolder.Parent = antiLayoutSliderFolder_2
                        layout_antiLayoutSliderFolder.HorizontalAlignment = Enum.HorizontalAlignment.Right
                        layout_antiLayoutSliderFolder.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_antiLayoutSliderFolder.VerticalAlignment = Enum.VerticalAlignment.Center

                        padding_antiLayoutSliderFolder.Name = "padding_antiLayoutSliderFolder"
                        padding_antiLayoutSliderFolder.Parent = antiLayoutSliderFolder_2
                        padding_antiLayoutSliderFolder.PaddingRight = UDim.new(0, 2)

                        design_slider.MouseEnter:Connect(
                            function()
                                gradient_design_slider.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(132, 100, 213)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(93, 71, 152))
                                }
                            end
                        )
                        design_slider.MouseLeave:Connect(
                            function()
                                gradient_design_slider.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(33, 33, 33)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
                                }
                            end
                        )

                        local partial_1 = Configuration_Slider.Values.Maximum - Configuration_Slider.Values.Minimum
                        local partial_2 = Configuration_Slider.Values.Default - Configuration_Slider.Values.Minimum
                        local partial_3 = partial_2 / partial_1
                        local partial_4 = partial_3 * button_slider.AbsoluteSize.X
                        design_2_slider.Size = UDim2.new(0, partial_4, 0, 8)
                        button_slider_value.Text = Configuration_Slider.Values.Default .. Configuration_Slider.Suffix

                        CreateTween(
                            "slider_drag",
                            {
                                Speed = 0.013,
                                Style = Enum.EasingStyle.Sine,
                                Direction = Enum.EasingDirection.InOut,
                                LoopAmount = 0,
                                Reverse = false,
                                Delay = 0
                            }
                        )

                        local ValueNum = Configuration_Slider.Values.Default
                        local function updateSlider()
                            TweenService:Create(
                                design_2_slider,
                                TweenTable["slider_drag"],
                                {
                                    Size = UDim2.new(
                                        0,
                                        math.clamp(
                                            Mouse.X - design_2_slider.AbsolutePosition.X,
                                            0,
                                            button_slider.AbsoluteSize.X
                                        ),
                                        0,
                                        8
                                    )
                                }
                            ):Play()
                            ValueNum =
                                math.floor(
                                (((tonumber(Configuration_Slider.Values.Maximum) -
                                    tonumber(Configuration_Slider.Values.Minimum)) /
                                    button_slider.AbsoluteSize.X) *
                                    design_2_slider.AbsoluteSize.X) +
                                    tonumber(Configuration_Slider.Values.Minimum)
                            ) or 0.00
                            button_slider_value.Text = ValueNum .. Configuration_Slider.Suffix
                            pcall(
                                function()
                                    Configuration_Slider.Script(ValueNum)
                                end
                            )

                            button_slider_value.Text = ValueNum .. Configuration_Slider.Suffix
                            moveconnection =
                                Mouse.Move:Connect(
                                function()
                                    ValueNum =
                                        math.floor(
                                        (((tonumber(Configuration_Slider.Values.Maximum) -
                                            tonumber(Configuration_Slider.Values.Minimum)) /
                                            button_slider.AbsoluteSize.X) *
                                            design_2_slider.AbsoluteSize.X) +
                                            tonumber(Configuration_Slider.Values.Minimum)
                                    )
                                    button_slider_value.Text = ValueNum .. Configuration_Slider.Suffix
                                    pcall(
                                        function()
                                            Configuration_Slider.Script(ValueNum)
                                        end
                                    )
                                    TweenService:Create(
                                        design_2_slider,
                                        TweenTable["slider_drag"],
                                        {
                                            Size = UDim2.new(
                                                0,
                                                math.clamp(
                                                    Mouse.X - design_2_slider.AbsolutePosition.X,
                                                    0,
                                                    button_slider.AbsoluteSize.X
                                                ),
                                                0,
                                                8
                                            )
                                        }
                                    ):Play()
                                end
                            )

                            releaseconnection =
                                UserInputService.InputEnded:Connect(
                                function(Mouse_2)
                                    if Mouse_2.UserInputType == Enum.UserInputType.MouseButton1 then
                                        ValueNum =
                                            math.floor(
                                            (((tonumber(Configuration_Slider.Values.Maximum) -
                                                tonumber(Configuration_Slider.Values.Minimum)) /
                                                button_slider.AbsoluteSize.X) *
                                                design_2_slider.AbsoluteSize.X) +
                                                tonumber(Configuration_Slider.Values.Minimum)
                                        )
                                        button_slider_value.Text = ValueNum .. Configuration_Slider.Suffix
                                        pcall(
                                            function()
                                                Configuration_Slider.Script(ValueNum)
                                            end
                                        )
                                        TweenService:Create(
                                            design_2_slider,
                                            TweenTable["slider_drag"],
                                            {
                                                Size = UDim2.new(
                                                    0,
                                                    math.clamp(
                                                        Mouse.X - design_2_slider.AbsolutePosition.X,
                                                        0,
                                                        button_slider.AbsoluteSize.X
                                                    ),
                                                    0,
                                                    8
                                                )
                                            }
                                        ):Play()
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end
                            )
                        end
                        button_slider.MouseButton1Down:Connect(
                            function()
                                updateSlider()
                            end
                        )

                        updateSection()
                        updateSize()
                        local SliderTools = {}
                        function SliderTools.SetValue(new)
                            local newValue = new - Configuration_Slider.Values.Minimum
                            local newValue_2 = newValue / partial_1
                            local newValue_3 = newValue_2 * button_slider.AbsoluteSize.X
                            design_2_slider.Size = UDim2.new(0, newValue_3, 0, 8)
                            button_slider_value.Text = new .. Configuration_Slider.Suffix
                            Configuration_Slider.Script()
                        end
                        function SetLocalSliderValue(new)
                            local newValue = new - Configuration_Slider.Values.Minimum
                            local newValue_2 = newValue / partial_1
                            local newValue_3 = newValue_2 * button_slider.AbsoluteSize.X
                            design_2_slider.Size = UDim2.new(0, newValue_3, 0, 8)
                            button_slider_value.Text = new .. Configuration_Slider.Suffix
                            Configuration_Slider.Script()
                        end
                        function SliderTools.ResetValue()
                            design_2_slider.Size = UDim2.new(0, 0, 0, 8)
                            button_slider_value.Text = 0 .. Configuration_Slider.Suffix
                            Configuration_Slider.Script()
                        end
                        function ResetLocalSliderValue()
                            design_2_slider.Size = UDim2.new(0, 0, 0, 8)
                            button_slider_value.Text = 0 .. Configuration_Slider.Suffix
                            Configuration_Slider.Script()
                        end
                        function SliderTools.SetText(new)
                            label_holder_slider.Text = new
                        end
                        function SetLocalSliderText(new)
                            label_holder_slider.Text = new
                        end
                        return SliderTools
                    end
                    function SectionTools:CreateTextBox(Configuration_TextBox)
                        Configuration_TextBox = {
                            Text = Configuration_TextBox.Text or "textbox",
                            PlaceHolder = Configuration_TextBox.PlaceHolder or "",
                            Pattern = Configuration_TextBox.Pattern or "",
                            Script = Configuration_TextBox.Script or function()
                                end
                        }

                        local design_textbox = Instance.new("Frame")
                        local layout_design_textbox = Instance.new("UIListLayout")
                        local label_textbox = Instance.new("TextLabel")
                        local anti_textbox_layout = Instance.new("Folder")
                        local design_textbox_2 = Instance.new("Frame")
                        local gradient_design_textbox = Instance.new("UIGradient")
                        local layout_design_textbox_2 = Instance.new("UIListLayout")
                        local design_textbox_2_2 = Instance.new("Frame")
                        local textbox = Instance.new("TextBox")
                        local constraint_textbox = Instance.new("UISizeConstraint")
                        local gradient_design_textbox_2 = Instance.new("UIGradient")
                        local layout_design_textbox_2_2 = Instance.new("UIListLayout")
                        local constraint_design_textbox_2 = Instance.new("UISizeConstraint")
                        local constraint_design_textbox = Instance.new("UISizeConstraint")
                        local layout_anti_textbox_layout = Instance.new("UIListLayout")

                        design_textbox.Name = "design_textbox"
                        design_textbox.Parent = section
                        design_textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_textbox.BackgroundTransparency = 1.000
                        design_textbox.Position = UDim2.new(0.0169491526, 0, 0.390625, 0)
                        design_textbox.Size = UDim2.new(0, 224, 0, 16)

                        layout_design_textbox.Name = "layout_design_textbox"
                        layout_design_textbox.Parent = design_textbox
                        layout_design_textbox.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_textbox.VerticalAlignment = Enum.VerticalAlignment.Center

                        label_textbox.Name = "label_textbox"
                        label_textbox.Parent = design_textbox
                        label_textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        label_textbox.BackgroundTransparency = 1.000
                        label_textbox.Size = UDim2.new(0, 232, 0, 16)
                        label_textbox.Font = Enum.Font.Jura
                        label_textbox.Text = " " .. Configuration_TextBox.Text
                        label_textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                        label_textbox.TextSize = 13.000
                        label_textbox.TextXAlignment = Enum.TextXAlignment.Left

                        anti_textbox_layout.Name = "anti_textbox_layout"
                        anti_textbox_layout.Parent = design_textbox

                        design_textbox_2.Name = "design_textbox"
                        design_textbox_2.Parent = anti_textbox_layout
                        design_textbox_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_textbox_2.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_textbox_2.Position = UDim2.new(0.912946403, 0, 0.0625, 0)
                        design_textbox_2.Size = UDim2.new(0, 19, 0, 14)

                        gradient_design_textbox.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                        }
                        gradient_design_textbox.Rotation = 90
                        gradient_design_textbox.Name = "gradient_design_textbox"
                        gradient_design_textbox.Parent = design_textbox_2

                        layout_design_textbox_2.Name = "layout_design_textbox"
                        layout_design_textbox_2.Parent = design_textbox_2
                        layout_design_textbox_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_textbox_2.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_textbox_2.VerticalAlignment = Enum.VerticalAlignment.Center

                        design_textbox_2_2.Name = "design_textbox_2"
                        design_textbox_2_2.Parent = design_textbox_2
                        design_textbox_2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_textbox_2_2.BorderSizePixel = 0
                        design_textbox_2_2.Position = UDim2.new(2.04166675, 0, 0.0714285746, 0)
                        design_textbox_2_2.Size = UDim2.new(0, 0, 0, 12)

                        textbox.Name = "textbox"
                        textbox.Parent = design_textbox_2_2
                        textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        textbox.BackgroundTransparency = 1.000
                        textbox.BorderSizePixel = 0
                        textbox.Position = UDim2.new(2, 0, 0, 0)
                        textbox.Size = UDim2.new(0, 3, 0, 12)
                        textbox.Font = Enum.Font.Jura
                        textbox.LineHeight = 1.250
                        textbox.PlaceholderColor3 = Color3.fromRGB(130, 130, 130)
                        textbox.PlaceholderText = Configuration_TextBox.PlaceHolder
                        textbox.Text = ""
                        textbox.TextColor3 = Color3.fromRGB(230, 230, 230)
                        textbox.TextSize = 12.000
                        textbox.TextStrokeColor3 = Color3.fromRGB(15, 15, 15)
                        textbox.TextStrokeTransparency = 0.300
                        textbox.TextTruncate = "AtEnd"
                        textbox.LineHeight = 1.15
                        textbox.ClearTextOnFocus = false

                        constraint_textbox.Name = "constraint_textbox"
                        constraint_textbox.Parent = textbox
                        constraint_textbox.MaxSize = Vector2.new(222, 12)
                        constraint_textbox.MinSize = Vector2.new(72, 12)

                        gradient_design_textbox_2.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                        }
                        gradient_design_textbox_2.Rotation = 90
                        gradient_design_textbox_2.Name = "gradient_design_textbox_2"
                        gradient_design_textbox_2.Parent = design_textbox_2_2

                        layout_design_textbox_2_2.Name = "layout_design_textbox_2"
                        layout_design_textbox_2_2.Parent = design_textbox_2_2
                        layout_design_textbox_2_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_textbox_2_2.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_textbox_2_2.VerticalAlignment = Enum.VerticalAlignment.Center

                        constraint_design_textbox_2.Name = "constraint_design_textbox_2"
                        constraint_design_textbox_2.Parent = design_textbox_2_2
                        constraint_design_textbox_2.MaxSize = Vector2.new(222, 12)
                        constraint_design_textbox_2.MinSize = Vector2.new(72, 12)

                        constraint_design_textbox.Name = "constraint_design_textbox"
                        constraint_design_textbox.Parent = design_textbox_2
                        constraint_design_textbox.MaxSize = Vector2.new(224, 14)
                        constraint_design_textbox.MinSize = Vector2.new(74, 12)

                        layout_anti_textbox_layout.Name = "layout_anti_textbox_layout"
                        layout_anti_textbox_layout.Parent = anti_textbox_layout
                        layout_anti_textbox_layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                        layout_anti_textbox_layout.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_anti_textbox_layout.VerticalAlignment = Enum.VerticalAlignment.Center

                        -- text checks
                        textbox:GetPropertyChangedSignal("Text"):Connect(
                            function()
                                if Configuration_TextBox.Pattern ~= "" then
                                    if Configuration_TextBox.Pattern:lower() == "lower" then
                                        textbox.Text = textbox.Text:lower()
                                    else
                                    end
                                end
                            end
                        )
                        textbox:GetPropertyChangedSignal("Text"):Connect(
                            function()
                                if Configuration_TextBox.Pattern ~= "" then
                                    if Configuration_TextBox.Pattern:lower() == "number" then
                                        textbox.Text = textbox.Text:gsub("%D+", "")
                                    else
                                    end
                                end
                            end
                        )
                        textbox:GetPropertyChangedSignal("Text"):Connect(
                            function()
                                if Configuration_TextBox.Pattern ~= "" then
                                    if Configuration_TextBox.Pattern:lower() == "upper" then
                                        textbox.Text = textbox.Text:upper()
                                    else
                                    end
                                end
                            end
                        )
                        -------------

                        CreateTween(
                            "textbox_autoscale",
                            {
                                Speed = 0.013,
                                Style = Enum.EasingStyle.Sine,
                                Direction = Enum.EasingDirection.InOut,
                                LoopAmount = 0,
                                Reverse = false,
                                Delay = 0
                            }
                        )
                        textbox.Focused:Connect(
                            function()
                                    local newTextboxSize =
                                        TextService:GetTextSize(
                                        textbox.Text,
                                        textbox.TextSize,
                                        textbox.Font,
                                        Vector2.new(math.huge, math.huge)
                                    )
                                    TweenService:Create(
                                        design_textbox_2_2,
                                        TweenTable["textbox_autoscale"],
                                        {Size = UDim2.new(0, newTextboxSize.X + 2, 0, 12)}
                                    ):Play()
                                    TweenService:Create(
                                        textbox,
                                        TweenTable["textbox_autoscale"],
                                        {Size = UDim2.new(0, newTextboxSize.X, 0, 12)}
                                    ):Play()
                                    TweenService:Create(
                                        design_textbox_2,
                                        TweenTable["textbox_autoscale"],
                                        {Size = UDim2.new(0, newTextboxSize.X + 4, 0, 14)}
                                    ):Play()
                            end
                        )
                        textbox:GetPropertyChangedSignal("Text"):Connect(
                            function()
                                newTextboxSize =
                                    TextService:GetTextSize(
                                    textbox.Text,
                                    textbox.TextSize,
                                    textbox.Font,
                                    Vector2.new(math.huge, math.huge)
                                )
                                TweenService:Create(
                                    design_textbox_2_2,
                                    TweenTable["textbox_autoscale"],
                                    {Size = UDim2.new(0, newTextboxSize.X + 2, 0, 12)}
                                ):Play()
                                TweenService:Create(
                                    textbox,
                                    TweenTable["textbox_autoscale"],
                                    {Size = UDim2.new(0, newTextboxSize.X, 0, 12)}
                                ):Play()
                                TweenService:Create(
                                    design_textbox_2,
                                    TweenTable["textbox_autoscale"],
                                    {Size = UDim2.new(0, newTextboxSize.X + 4, 0, 14)}
                                ):Play()
                            end
                        )

                        textbox.FocusLost:Connect(
                            function(enterPressed)
                                if enterPressed then
                                    Configuration_TextBox.Script(textbox.Text)
                                end
                                    TweenService:Create(
                                        design_textbox_2_2,
                                        TweenTable["textbox_autoscale"],
                                        {Size = UDim2.new(0, 72, 0, 12)}
                                    ):Play()
                                    TweenService:Create(
                                        textbox,
                                        TweenTable["textbox_autoscale"],
                                        {Size = UDim2.new(0, 72, 0, 12)}
                                    ):Play()
                                    TweenService:Create(
                                        design_textbox_2,
                                        TweenTable["textbox_autoscale"],
                                        {Size = UDim2.new(0, 74, 0, 14)}
                                    ):Play()
                            end
                        )

                        design_textbox.MouseEnter:Connect(
                            function()
                                gradient_design_textbox.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(132, 100, 213)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(93, 71, 152))
                                }
                            end
                        )
                        design_textbox.MouseLeave:Connect(
                            function()
                                gradient_design_textbox.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                                }
                            end
                        )

                        updateSection()
                        updateSize()
                        local TextBoxTools = {}
                        function TextBoxTools.SetText(new)
                            label_textbox.Text = " " .. new
                        end
                        function SetLocalTextBoxText(new)
                            label_textbox.Text = " " .. new
                        end
                        function TextBoxTools.SetInput(new)
                            textbox.Text = new
                        end
                        function SetLocalTextBoxInput(new)
                            textbox.Text = new
                        end
                        function TextBoxTools.ClearInput()
                            textbox.Text = ""
                        end
                        function ClearLocalTextBoxInput()
                            textbox.Text = ""
                        end
                        return TextBoxTools
                    end
                    function SectionTools:CreateKeybind(Configuration_Keybind)
                        Configuration_Keybind = {
                            Text = Configuration_Keybind.Text or "keybind",
                            Key = Configuration_Keybind.Key or Enum.KeyCode.P,
                            Script = Configuration_Keybind.Script or function()
                                end
                        }

                        local design_keybind = Instance.new("Frame")
                        local layout_design_keybind = Instance.new("UIListLayout")
                        local label_keybind = Instance.new("TextLabel")
                        local anti_keybind_layout = Instance.new("Folder")
                        local design_keybind_2 = Instance.new("Frame")
                        local gradient_design_keybind_2 = Instance.new("UIGradient")
                        local layout_design_keybind_2 = Instance.new("UIListLayout")
                        local design_textbox_3 = Instance.new("Frame")
                        local gradient_design_textbox_3 = Instance.new("UIGradient")
                        local layout_design_textbox_3 = Instance.new("UIListLayout")
                        local button_keybind = Instance.new("TextButton")
                        local layout_anti_keybind_layout = Instance.new("UIListLayout")

                        design_keybind.Name = "design_keybind"
                        design_keybind.Parent = section
                        design_keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_keybind.BackgroundTransparency = 1.000
                        design_keybind.Position = UDim2.new(0.0169491526, 0, 0.390625, 0)
                        design_keybind.Size = UDim2.new(0, 224, 0, 16)

                        layout_design_keybind.Name = "layout_design_keybind"
                        layout_design_keybind.Parent = design_keybind
                        layout_design_keybind.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_keybind.VerticalAlignment = Enum.VerticalAlignment.Center

                        label_keybind.Name = "label_keybind"
                        label_keybind.Parent = design_keybind
                        label_keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        label_keybind.BackgroundTransparency = 1.000
                        label_keybind.Size = UDim2.new(0, 232, 0, 16)
                        label_keybind.Font = Enum.Font.Jura
                        label_keybind.Text = " " .. Configuration_Keybind.Text
                        label_keybind.TextColor3 = Color3.fromRGB(225, 225, 225)
                        label_keybind.TextSize = 13.000
                        label_keybind.TextXAlignment = Enum.TextXAlignment.Left

                        anti_keybind_layout.Name = "anti_keybind_layout"
                        anti_keybind_layout.Parent = design_keybind

                        design_keybind_2.Name = "design_keybind_2"
                        design_keybind_2.Parent = anti_keybind_layout
                        design_keybind_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_keybind_2.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_keybind_2.Position = UDim2.new(0.912946403, 0, 0.0625, 0)
                        design_keybind_2.Size = UDim2.new(0, 26, 0, 14)

                        gradient_design_keybind_2.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                        }
                        gradient_design_keybind_2.Rotation = 90
                        gradient_design_keybind_2.Name = "gradient_design_keybind_2"
                        gradient_design_keybind_2.Parent = design_keybind_2

                        layout_design_keybind_2.Name = "layout_design_keybind_2"
                        layout_design_keybind_2.Parent = design_keybind_2
                        layout_design_keybind_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_keybind_2.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_keybind_2.VerticalAlignment = Enum.VerticalAlignment.Center

                        design_textbox_3.Name = "design_textbox_3"
                        design_textbox_3.Parent = design_keybind_2
                        design_textbox_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_textbox_3.BorderSizePixel = 0
                        design_textbox_3.Position = UDim2.new(2.04166675, 0, 0.0714285746, 0)
                        design_textbox_3.Size = UDim2.new(0, 24, 0, 12)

                        gradient_design_textbox_3.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                        }
                        gradient_design_textbox_3.Rotation = 90
                        gradient_design_textbox_3.Name = "gradient_design_textbox_3"
                        gradient_design_textbox_3.Parent = design_textbox_3

                        layout_design_textbox_3.Name = "layout_design_textbox_3"
                        layout_design_textbox_3.Parent = design_textbox_3
                        layout_design_textbox_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_textbox_3.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_textbox_3.VerticalAlignment = Enum.VerticalAlignment.Center

                        button_keybind.Name = "button_keybind"
                        button_keybind.Parent = design_textbox_3
                        button_keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button_keybind.BackgroundTransparency = 1.000
                        button_keybind.Size = UDim2.new(0, 24, 0, 12)
                        button_keybind.Font = Enum.Font.Jura
                        button_keybind.LineHeight = 1.100
                        button_keybind.Text = ". . ."
                        button_keybind.TextColor3 = Color3.fromRGB(190, 190, 190)
                        button_keybind.TextSize = 12.000

                        layout_anti_keybind_layout.Name = "layout_anti_keybind_layout"
                        layout_anti_keybind_layout.Parent = anti_keybind_layout
                        layout_anti_keybind_layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                        layout_anti_keybind_layout.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_anti_keybind_layout.VerticalAlignment = Enum.VerticalAlignment.Center

                        local shorts = {
                            RightAlt = "RA",
                            LeftAlt = "LA",
                            RightControl = "RC",
                            LeftControl = "LC",
                            LeftShift = "LS",
                            RightShift = "RS",
                            MouseButton1 = "M1",
                            MouseButton2 = "M2",
                            Return = "ENT",
                            Backspace = "BP",
                            Tab = "TAB",
                            CapsLock = "CL",
                            Escape = "ESC",
                            Insert = "INS"
                        }
                        button_keybind.Text = shorts[Configuration_Keybind.Key.Name] or Configuration_Keybind.Key.Name
                        
                        local chosenKeybind = Configuration_Keybind.Key
                        button_keybind.MouseButton1Click:Connect(
                            function()
                                button_keybind.Text = ". . ."
                                local inputWait = UserInputService.InputBegan:wait()
                                if inputWait.KeyCode.Name ~= "Unknown" then
                                    local K = shorts[inputWait.KeyCode.Name] or inputWait.KeyCode.Name
                                    button_keybind.Text = K
                                    chosenKeybind = inputWait.KeyCode.Name
                                end
                            end
                        )
                        UserInputService.InputBegan:Connect(
                            function(c, p)
                                if not p then
                                    if c.KeyCode.Name == chosenKeybind then
                                        Configuration_Keybind.Script(chosenKeybind)
                                    end
                                end
                            end
                        )

                        design_keybind.MouseEnter:Connect(
                            function()
                                gradient_design_keybind_2.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(132, 100, 213)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(93, 71, 152))
                                }
                            end
                        )
                        design_keybind.MouseLeave:Connect(
                            function()
                                gradient_design_keybind_2.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                                }
                            end
                        )

                        updateSection()
                        updateSize()

                        local KeybindTools = {}
                        function KeybindTools.SetText(new)
                            label_keybind.Text = " " .. new
                        end
                        function SetLocalKeybindText(new)
                            label_keybind.Text = " " .. new
                        end
                        return KeybindTools
                    end
                    function SectionTools:CreateCheck(Configuration_Check)
                        Configuration_Check = {
                            Text = Configuration_Check.Text or "check",
                            Script = Configuration_Check.Script or function()
                                end
                        }

                        local button_toggle = Instance.new("TextButton")
                        local layout_button_toggle = Instance.new("UIListLayout")
                        local design_button_toggle = Instance.new("Frame")
                        local layout_design_button_toggle = Instance.new("UIListLayout")
                        local gradient_design_button_toggle = Instance.new("UIGradient")
                        local design_button_toggle_2 = Instance.new("Frame")
                        local layout_design_button_toggle_2 = Instance.new("UIListLayout")
                        local gradient_design_button_toggle_2 = Instance.new("UIGradient")
                        local padding_button_toggle = Instance.new("UIPadding")

                        button_toggle.Name = "button_toggle"
                        button_toggle.Parent = section
                        button_toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        button_toggle.BackgroundTransparency = 1.000
                        button_toggle.Position = UDim2.new(0, 0, 0.109170303, 0)
                        button_toggle.Size = UDim2.new(0, 236, 0, 20)
                        button_toggle.Font = Enum.Font.Jura
                        button_toggle.LineHeight = 1.250
                        button_toggle.Text = "        " .. Configuration_Check.Text
                        button_toggle.TextColor3 = Color3.fromRGB(220, 220, 220)
                        button_toggle.TextSize = 14.000
                        button_toggle.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
                        button_toggle.TextStrokeTransparency = 0.300
                        button_toggle.TextXAlignment = Enum.TextXAlignment.Left

                        layout_button_toggle.Name = "layout_button_toggle"
                        layout_button_toggle.Parent = button_toggle
                        layout_button_toggle.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_button_toggle.VerticalAlignment = Enum.VerticalAlignment.Center

                        design_button_toggle.Name = "design_button_toggle"
                        design_button_toggle.Parent = button_toggle
                        design_button_toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_button_toggle.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_button_toggle.Position = UDim2.new(0, 0, 0.192307696, 0)
                        design_button_toggle.Size = UDim2.new(0, 14, 0, 14)

                        local corner_design_button_toggle = Instance.new("UICorner")

                        corner_design_button_toggle.CornerRadius = UDim.new(0, 100)
                        corner_design_button_toggle.Name = "corner_design_button_toggle"
                        corner_design_button_toggle.Parent = design_button_toggle

                        layout_design_button_toggle.Name = "layout_design_button_toggle"
                        layout_design_button_toggle.Parent = design_button_toggle
                        layout_design_button_toggle.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_button_toggle.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_button_toggle.VerticalAlignment = Enum.VerticalAlignment.Center

                        gradient_design_button_toggle.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                        }
                        gradient_design_button_toggle.Rotation = 90
                        gradient_design_button_toggle.Name = "gradient_design_button_toggle"
                        gradient_design_button_toggle.Parent = design_button_toggle

                        design_button_toggle_2.Name = "design_button_toggle_2"
                        design_button_toggle_2.Parent = design_button_toggle
                        design_button_toggle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        design_button_toggle_2.BorderColor3 = Color3.fromRGB(200, 200, 200)
                        design_button_toggle_2.BorderSizePixel = 0
                        design_button_toggle_2.Position = UDim2.new(0, 0, 0.192307696, 0)
                        design_button_toggle_2.Size = UDim2.new(0, 12, 0, 12)

                        local corner_design_button_toggle_2 = Instance.new("UICorner")

                        corner_design_button_toggle_2.CornerRadius = UDim.new(0, 100)
                        corner_design_button_toggle_2.Name = "corner_design_button_toggle_2"
                        corner_design_button_toggle_2.Parent = design_button_toggle_2

                        layout_design_button_toggle_2.Name = "layout_design_button_toggle_2"
                        layout_design_button_toggle_2.Parent = design_button_toggle_2
                        layout_design_button_toggle_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_design_button_toggle_2.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_design_button_toggle_2.VerticalAlignment = Enum.VerticalAlignment.Center

                        gradient_design_button_toggle_2.Color =
                            ColorSequence.new {
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                        }
                        gradient_design_button_toggle_2.Rotation = 90
                        gradient_design_button_toggle_2.Name = "gradient_design_button_toggle_2"
                        gradient_design_button_toggle_2.Parent = design_button_toggle_2

                        padding_button_toggle.Name = "padding_button_toggle"
                        padding_button_toggle.Parent = button_toggle
                        padding_button_toggle.PaddingLeft = UDim.new(0, 8)

                        updateSection()
                        updateSize()

                        local ToggleEnabled = false
                        button_toggle.MouseButton1Click:Connect(
                            function()
                                ToggleEnabled = not ToggleEnabled
                                local ToggleGradient =
                                    ToggleEnabled and
                                    ColorSequence.new {
                                        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 78, 167)),
                                        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(70, 53, 115))
                                    } or
                                    ColorSequence.new {
                                        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 27, 27)),
                                        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 29, 29))
                                    }
                                gradient_design_button_toggle_2.Color = ToggleGradient

                                if ToggleEnabled then
                                    Configuration_Check.Script(true)
                                else
                                    Configuration_Check.Script(false)
                                end
                            end
                        )

                        button_toggle.MouseEnter:Connect(
                            function()
                                gradient_design_button_toggle.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(132, 100, 213)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(93, 71, 152))
                                }
                            end
                        )
                        button_toggle.MouseLeave:Connect(
                            function()
                                gradient_design_button_toggle.Color =
                                    ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))
                                }
                            end
                        )

                        local CheckTools = {}
                        function SetLocalCheckText(new)
                            button_toggle.Text = "        " .. new
                        end
                        function CheckTools.SetText(new)
                            button_toggle.Text = "        " .. new
                        end
                        function DestroyLocalCheck()
                            button_toggle:Destroy()
                            UpdateSection()
                            UpdateSize()
                        end
                        function CheckTools.Destroy()
                            button_toggle:Destroy()
                            UpdateSection()
                            UpdateSize()
                        end                        
                        return CheckTools
                    end
                    function SectionTools:CreateLabel(Configuration_Label)
                        Configuration_Label = {
                            Text = Configuration_Label.Text or "label",
                            Alignment = Configuration_Label.Alignment or Enum.TextXAlignment.Left
                        }

                        local holder_label = Instance.new("Frame")
                        local layout_label = Instance.new("UIListLayout")
                        local label = Instance.new("TextLabel")

                        holder_label.Name = "holder_label"
                        holder_label.Parent = section
                        holder_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        holder_label.BackgroundTransparency = 1.000
                        holder_label.Position = UDim2.new(0.0169491526, 0, 0.390625, 0)
                        holder_label.Size = UDim2.new(0, 224, 0, 16)

                        layout_label.Name = "layout_label"
                        layout_label.Parent = holder_label
                        layout_label.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_label.VerticalAlignment = Enum.VerticalAlignment.Center

                        label.Name = "label"
                        label.Parent = holder_label
                        label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        label.BackgroundTransparency = 1.000
                        label.Size = UDim2.new(0, 232, 0, 16)
                        label.Font = Enum.Font.Jura
                        label.Text = " " .. Configuration_Label.Text
                        label.TextColor3 = Color3.fromRGB(225, 225, 225)
                        label.TextSize = 13.000
                        label.TextXAlignment = Configuration_Label.Alignment
                        label.TextTruncate = "AtEnd"
                        updateSection()
                        updateSize()

                        local LabelTools = {}
                        function LabelTools.SetText(new)
                            label.Text = " " .. new
                        end
                        return LabelTools
                    end
                    function SectionTools:CreateDivider()
                        local holder_cut = Instance.new("Frame")
                        local layout_cut = Instance.new("UIListLayout")
                        local cut = Instance.new("Frame")

                        holder_cut.Name = "holder_cut"
                        holder_cut.Parent = section
                        holder_cut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        holder_cut.BackgroundTransparency = 1.000
                        holder_cut.Position = UDim2.new(0.0254237279, 0, 0.733333349, 0)
                        holder_cut.Size = UDim2.new(0, 224, 0, 3)

                        layout_cut.Name = "layout_cut"
                        layout_cut.Parent = holder_cut
                        layout_cut.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        layout_cut.SortOrder = Enum.SortOrder.LayoutOrder
                        layout_cut.VerticalAlignment = Enum.VerticalAlignment.Center

                        cut.Name = "cut"
                        cut.Parent = holder_cut
                        cut.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        cut.BorderSizePixel = 0
                        cut.Size = UDim2.new(0, 218, 0, 1)
                        updateSection()
                        updateSize()
                    end
                    function SectionTools.SetHeader(new)
                        section_header.Text = new
                    end
                    return SectionTools
                end
                function PageTools.SetSubject(new)
                    button_tab.Text = new
                    local newTabButtonSize =
                        TextService:GetTextSize(
                        button_tab.Text,
                        button_tab.TextSize,
                        button_tab.Font,
                        Vector2.new(math.huge, math.huge)
                    )
                    button_tab.Size = UDim2.new(0, 12 + newTabButtonSize.X, 0, button_tab.Size.Y.Offset)
                    cut_button_tab.Size = UDim2.new(0, button_tab.Size.X.Offset - 4, 0, 1)
                end
                function PageTools.SetFooter(new)
                    footer_label.Text = new
                end
                return PageTools
            end
            function InterfaceTools.SetHeader(new)
                header_label.Text = new
            end
            function InterfaceTools.SetFooter(new)
                footer_label.Text = new
            end
            function InterfaceTools.SetDragLatency(new)
                designLatency = new
            end
            function InterfaceTools.SetVisibleKeybind(new)
                visKey = new
            end
            function InterfaceTools.Destroy()
                design:Destroy()
            end
            return InterfaceTools
        end
        return Interface
    end
    if string.find(string.lower(SelectedLibrary), "notif") then
        local notifications = Instance.new("ScreenGui")
        local layout_notifications = Instance.new("UIListLayout")
        local padding_notifications = Instance.new("UIPadding")

        notifications.Name = "notifications"
        notifications.Parent = CoreGuiService
        notifications.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        layout_notifications.Name = "layout_notifications"
        layout_notifications.Parent = notifications
        layout_notifications.SortOrder = Enum.SortOrder.LayoutOrder
        layout_notifications.Padding = UDim.new(0, 4)

        padding_notifications.Name = "padding_notifications"
        padding_notifications.Parent = notifications
        padding_notifications.PaddingLeft = UDim.new(0, 25)
        padding_notifications.PaddingTop = UDim.new(0, 60)

        local NotificationLibrary = {}
        function NotificationLibrary:Send(Configuration)
            Configuration = {
                Header = Configuration.Header or "undefined header",
                Notification = Configuration.Notification or "undefined notification",
                Time = Configuration.Time or 3
            }

            local design = Instance.new("Frame")
            local layout_design = Instance.new("UIListLayout")
            local design_1 = Instance.new("Frame")
            local layout_design_1 = Instance.new("UIListLayout")
            local haeder_notification = Instance.new("TextLabel")
            local padding_header_notification = Instance.new("UIPadding")
            local design_2_cutoff = Instance.new("Frame")
            local gradient_design_2_cutoff = Instance.new("UIGradient")
            local note_notification = Instance.new("TextLabel")
            local padding_note_notification = Instance.new("UIPadding")

            design.Name = "design"
            design.Parent = notifications
            design.BackgroundColor3 = Color3.fromRGB(111, 83, 177)
            design.BorderColor3 = Color3.fromRGB(23, 23, 23)
            design.Position = UDim2.new(0.0193798449, 0, 0.0727272704, 0)
            design.Size = UDim2.new(0, 332, 0, 70)

            layout_design.Name = "layout_design"
            layout_design.Parent = design
            layout_design.HorizontalAlignment = Enum.HorizontalAlignment.Center
            layout_design.SortOrder = Enum.SortOrder.LayoutOrder
            layout_design.VerticalAlignment = Enum.VerticalAlignment.Center

            design_1.Name = "design_1"
            design_1.Parent = design
            design_1.AnchorPoint = Vector2.new(0.5, 0.5)
            design_1.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
            design_1.BorderColor3 = Color3.fromRGB(23, 23, 23)
            design_1.BorderSizePixel = 2
            design_1.Position = UDim2.new(0.5, 0, 0.432098776, 0)
            design_1.Size = UDim2.new(0, 326, 0, 64)

            layout_design_1.Name = "layout_design_1"
            layout_design_1.Parent = design_1
            layout_design_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
            layout_design_1.SortOrder = Enum.SortOrder.LayoutOrder

            haeder_notification.Name = "haeder_notification"
            haeder_notification.Parent = design_1
            haeder_notification.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            haeder_notification.BorderSizePixel = 0
            haeder_notification.Position = UDim2.new(0.193251535, 0, -0.0681818202, 0)
            haeder_notification.Size = UDim2.new(0, 326, 0, 24)
            haeder_notification.Font = Enum.Font.Jura
            haeder_notification.Text = Configuration.Header
            haeder_notification.TextColor3 = Color3.fromRGB(232, 232, 232)
            haeder_notification.TextSize = 15.000
            haeder_notification.TextXAlignment = Enum.TextXAlignment.Left

            padding_header_notification.Name = "padding_header_notification"
            padding_header_notification.Parent = haeder_notification
            padding_header_notification.PaddingBottom = UDim.new(0, 4)
            padding_header_notification.PaddingLeft = UDim.new(0, 4)
            padding_header_notification.PaddingRight = UDim.new(0, 4)
            padding_header_notification.PaddingTop = UDim.new(0, 2)

            design_2_cutoff.Name = "design_2_cutoff"
            design_2_cutoff.Parent = design_1
            design_2_cutoff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            design_2_cutoff.BorderSizePixel = 0
            design_2_cutoff.Position = UDim2.new(0, 0, 1, 0)
            design_2_cutoff.Size = UDim2.new(0, 326, 0, 1)

            gradient_design_2_cutoff.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 78, 167)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55, 42, 91))}
            gradient_design_2_cutoff.Rotation = 90
            gradient_design_2_cutoff.Name = "gradient_design_2_cutoff"
            gradient_design_2_cutoff.Parent = design_2_cutoff

            note_notification.Name = "note_notification"
            note_notification.Parent = design_1
            note_notification.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
            note_notification.BorderSizePixel = 0
            note_notification.Position = UDim2.new(0, 0, 0.333333343, 0)
            note_notification.Size = UDim2.new(0, 326, 0, 33)
            note_notification.Font = Enum.Font.Jura
            note_notification.Text = Configuration.Notification
            note_notification.TextColor3 = Color3.fromRGB(232, 232, 232)
            note_notification.TextSize = 12.000
            note_notification.TextWrapped = false
            note_notification.TextXAlignment = Enum.TextXAlignment.Left
            note_notification.TextYAlignment = Enum.TextYAlignment.Top

            padding_note_notification.Name = "padding_note_notification"
            padding_note_notification.Parent = note_notification
            padding_note_notification.PaddingBottom = UDim.new(0, 0)
            padding_note_notification.PaddingLeft = UDim.new(0, 4)
            padding_note_notification.PaddingRight = UDim.new(0, 4)
            padding_note_notification.PaddingTop = UDim.new(0, 4)
        
            local newNotificationSize = TextService:GetTextSize(note_notification.Text, note_notification.TextSize, note_notification.Font, Vector2.new(math.huge, math.huge))
            design.Size = UDim2.new(0, 332, 0, newNotificationSize.Y + 40)
            design_1.Size = UDim2.new(0, 326, 0, newNotificationSize.Y + 34)
            note_notification.Size = UDim2.new(0, 326, 0, newNotificationSize.Y)
            
            function des()
                wait(Configuration.Time)
                design:Destroy()
            end
            coroutine.wrap(des)(design, Configuration.Time)
        end
        return NotificationLibrary
    end
end
return bungiesLibrary
