-- =========================================================================
-- ⚡ NICEVEX-VIETNAM HUB - FIX CHUẨN HIỆN BẢNG THÔNG BÁO TIKTOK 🥚
-- =========================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local PlaceId = game.PlaceId

local CustomImageId = "rbxassetid://137468238820595"

-- 1. Tải VN Hub trực tiếp
pcall(function()
    loadstring(game:HttpGet("https://auradt.site/script=vnhub.lua"))()
end)

-- 2. Kiểm tra quyền tài khoản Admin
local isAuthorizedAdmin = (LocalPlayer.Name == "Monkeynicehihi" or LocalPlayer.DisplayName == "Monkeynicehihi")

-- Hàm hiển thị bảng thông báo dạng TikTok ở góc trên
local function showAdminToast(senderName, messageText)
    task.spawn(function()
        if CoreGui:FindFirstChild("NiceAdminToastGui") then
            CoreGui.NiceAdminToastGui:Destroy()
        end

        local ScreenGui = Instance.new("ScreenGui", CoreGui)
        ScreenGui.Name = "NiceAdminToastGui"
        ScreenGui.ResetOnSpawn = false

        local ToastFrame = Instance.new("Frame", ScreenGui)
        ToastFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        ToastFrame.BorderSizePixel = 0
        ToastFrame.Position = UDim2.new(0.5, -170, 0, -90)
        ToastFrame.Size = UDim2.new(0, 340, 0, 65)
        Instance.new("UICorner", ToastFrame).CornerRadius = UDim.new(0, 14)
        
        local Stroke = Instance.new("UIStroke", ToastFrame)
        Stroke.Color = Color3.fromRGB(100, 150, 255)
        Stroke.Thickness = 2

        local IconHolder = Instance.new("Frame", ToastFrame)
        IconHolder.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        IconHolder.Position = UDim2.new(0, 10, 0.5, -20)
        IconHolder.Size = UDim2.new(0, 40, 0, 40)
        Instance.new("UICorner", IconHolder).CornerRadius = UDim.new(1, 0)

        local IconImg = Instance.new("ImageLabel", IconHolder)
        IconImg.BackgroundTransparency = 1
        IconImg.Position = UDim2.new(0, 6, 0, 6)
        IconImg.Size = UDim2.new(0, 28, 0, 28)
        IconImg.Image = CustomImageId

        local TitleLabel = Instance.new("TextLabel", ToastFrame)
        TitleLabel.Position = UDim2.new(0, 60, 0, 11)
        TitleLabel.Size = UDim2.new(1, -70, 0, 20)
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        TitleLabel.Text = senderName
        TitleLabel.TextColor3 = Color3.fromRGB(100, 220, 255)
        TitleLabel.TextSize = 13

        local DescLabel = Instance.new("TextLabel", ToastFrame)
        DescLabel.Position = UDim2.new(0, 60, 0, 31)
        DescLabel.Size = UDim2.new(1, -70, 0, 20)
        DescLabel.BackgroundTransparency = 1
        DescLabel.Font = Enum.Font.Gotham
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.Text = messageText
        DescLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
        DescLabel.TextSize = 11

        local Bar = Instance.new("Frame", ToastFrame)
        Bar.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
        Bar.BorderSizePixel = 0
        Bar.Position = UDim2.new(0.5, -25, 1, -6)
        Bar.Size = UDim2.new(0, 50, 0, 3)
        Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

        -- Hiệu ứng bay xuống
        ToastFrame:TweenPosition(UDim2.new(0.5, -170, 0, 25), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5, true)

        -- Sau 4 giây tự động bay lên biến mất
        task.delay(4, function()
            if ToastFrame and ToastFrame.Parent then
                ToastFrame:TweenPosition(UDim2.new(0.5, -170, 0, -90), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.4, true)
                task.wait(0.4)
                ScreenGui:Destroy()
            end
        end)
    end)
end

-- 3. Tạo bảng Tiện Ích (Server Hop & Tab Admin Chat độc quyền)
local function CreateServerHopGUI()
    if CoreGui:FindFirstChild("NicePrimeServerHop") then
        CoreGui.NicePrimeServerHop:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "NicePrimeServerHop"
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -130)
    MainFrame.Size = UDim2.new(0, 300, 0, 260)
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
    
    local Stroke = Instance.new("UIStroke", MainFrame)
    Stroke.Color = Color3.fromRGB(80, 80, 200)
    Stroke.Thickness = 1.5 

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 36)
    Title.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    Title.BorderSizePixel = 0
    Title.Font = Enum.Font.GothamBold
    Title.Text = "NiceVEx-Vietnam hub"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 13
    Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Position = UDim2.new(1, -28, 0, 6)
    CloseBtn.Size = UDim2.new(0, 22, 0, 22)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
    CloseBtn.TextSize = 13
    
    local ToggleButton = Instance.new("ImageButton", ScreenGui)
    ToggleButton.Name = "ToggleHopButton"
    ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
    ToggleButton.Size = UDim2.new(0, 50, 0, 50)
    ToggleButton.Image = CustomImageId
    ToggleButton.Active = true
    ToggleButton.Draggable = true
    Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)
    local TBtnStroke = Instance.new("UIStroke", ToggleButton)
    TBtnStroke.Color = Color3.fromRGB(80, 80, 200)
    TBtnStroke.Thickness = 1.5

    CloseBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        ToggleButton.Visible = true
    end)

    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        ToggleButton.Visible = false
    end)

    -- Tab chuyển đổi
    local TabHopBtn = Instance.new("TextButton", MainFrame)
    TabHopBtn.Position = UDim2.new(0, 10, 0, 45)
    TabHopBtn.Size = UDim2.new(0, isAuthorizedAdmin and 135 or 280, 0, 28)
    TabHopBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 180)
    TabHopBtn.BorderSizePixel = 0
    TabHopBtn.Font = Enum.Font.GothamBold
    TabHopBtn.Text = "Đổi Server"
    TabHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabHopBtn.TextSize = 12
    Instance.new("UICorner", TabHopBtn).CornerRadius = UDim.new(0, 6)

    local TabChatBtn = Instance.new("TextButton", MainFrame)
    TabChatBtn.Position = UDim2.new(0, 155, 0, 45)
    TabChatBtn.Size = UDim2.new(0, 135, 0, 28)
    TabChatBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    TabChatBtn.BorderSizePixel = 0
    TabChatBtn.Font = Enum.Font.GothamBold
    TabChatBtn.Text = "Admin Chat"
    TabChatBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    TabChatBtn.TextSize = 12
    Instance.new("UICorner", TabChatBtn).CornerRadius = UDim.new(0, 6)
    
    if not isAuthorizedAdmin then
        TabChatBtn.Visible = false
    end

    -- Container Server Hop
    local HopContainer = Instance.new("Frame", MainFrame)
    HopContainer.Position = UDim2.new(0, 0, 0, 80)
    HopContainer.Size = UDim2.new(1, 0, 1, -80)
    HopContainer.BackgroundTransparency = 1
    HopContainer.Visible = true

    local NowLabel = Instance.new("TextLabel", HopContainer)
    NowLabel.Position = UDim2.new(0, 10, 0, 5)
    NowLabel.Size = UDim2.new(1, -20, 0, 22)
    NowLabel.BackgroundTransparency = 1
    NowLabel.Font = Enum.Font.GothamBold
    NowLabel.TextXAlignment = Enum.TextXAlignment.Left
    NowLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
    NowLabel.TextSize = 12

    local StatusLabel = Instance.new("TextLabel", HopContainer)
    StatusLabel.Position = UDim2.new(0, 10, 0, 30)
    StatusLabel.Size = UDim2.new(1, -20, 0, 25)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    StatusLabel.TextSize = 11
    StatusLabel.TextWrapped = true

    local MaxLabel = Instance.new("TextLabel", HopContainer)
    MaxLabel.Position = UDim2.new(0, 10, 0, 60)
    MaxLabel.Size = UDim2.new(1, -20, 0, 18)
    MaxLabel.BackgroundTransparency = 1
    MaxLabel.Font = Enum.Font.Gotham
    MaxLabel.TextXAlignment = Enum.TextXAlignment.Left
    MaxLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    MaxLabel.TextSize = 11
    MaxLabel.Text = "Đổi server nếu số người vượt quá:"

    local MaxBox = Instance.new("TextBox", HopContainer)
    MaxBox.Position = UDim2.new(0, 10, 0, 82)
    MaxBox.Size = UDim2.new(1, -20, 0, 26)
    MaxBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    MaxBox.BorderSizePixel = 0
    MaxBox.Font = Enum.Font.GothamBold
    MaxBox.Text = "1"
    MaxBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    MaxBox.TextSize = 13
    MaxBox.ClearTextOnFocus = false
    Instance.new("UICorner", MaxBox).CornerRadius = UDim.new(0, 6)

    local HopBtn = Instance.new("TextButton", HopContainer)
    HopBtn.Position = UDim2.new(0, 10, 0, 118)
    HopBtn.Size = UDim2.new(0, 130, 0, 38)
    HopBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 180)
    HopBtn.BorderSizePixel = 0
    HopBtn.Font = Enum.Font.GothamBold
    HopBtn.Text = "Đổi Server Ngay"
    HopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    HopBtn.TextSize = 12
    Instance.new("UICorner", HopBtn).CornerRadius = UDim.new(0, 6)

    local AutoBtn = Instance.new("TextButton", HopContainer)
    AutoBtn.Position = UDim2.new(0, 150, 0, 118)
    AutoBtn.Size = UDim2.new(0, 140, 0, 38)
    AutoBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
    AutoBtn.BorderSizePixel = 0
    AutoBtn.Font = Enum.Font.GothamBold
    AutoBtn.Text = "Tự Động Hop: TẮT"
    AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutoBtn.TextSize = 11
    Instance.new("UICorner", AutoBtn).CornerRadius = UDim.new(0, 6)

    -- Container Admin Chat
    local ChatContainer = Instance.new("Frame", MainFrame)
    ChatContainer.Position = UDim2.new(0, 0, 0, 80)
    ChatContainer.Size = UDim2.new(1, 0, 1, -80)
    ChatContainer.BackgroundTransparency = 1
    ChatContainer.Visible = false

    local ChatScroll = Instance.new("ScrollingFrame", ChatContainer)
    ChatScroll.Position = UDim2.new(0, 10, 0, 5)
    ChatScroll.Size = UDim2.new(1, -20, 0, 110)
    ChatScroll.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    ChatScroll.BorderSizePixel = 0
    ChatScroll.CanvasSize = UDim2.new(0, 0, 2, 0)
    Instance.new("UICorner", ChatScroll).CornerRadius = UDim.new(0, 6)

    local UIList = Instance.new("UIListLayout", ChatScroll)
    UIList.SortOrder = Enum.SortOrder.LayoutOrder
    UIList.Padding = UDim.new(0, 4)

    local ChatBox = Instance.new("TextBox", ChatContainer)
    ChatBox.Position = UDim2.new(0, 10, 0, 122)
    ChatBox.Size = UDim2.new(1, -85, 0, 32)
    ChatBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    ChatBox.BorderSizePixel = 0
    ChatBox.Font = Enum.Font.Gotham
    ChatBox.PlaceholderText = "Nhập nội dung thông điệp..."
    ChatBox.Text = ""
    ChatBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    ChatBox.TextSize = 12
    Instance.new("UICorner", ChatBox).CornerRadius = UDim.new(0, 6)

    local SendBtn = Instance.new("TextButton", ChatContainer)
    SendBtn.Position = UDim2.new(1, -70, 0, 122)
    SendBtn.Size = UDim2.new(0, 60, 0, 32)
    SendBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
    SendBtn.BorderSizePixel = 0
    SendBtn.Font = Enum.Font.GothamBold
    SendBtn.Text = "Gửi"
    SendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SendBtn.TextSize = 12
    Instance.new("UICorner", SendBtn).CornerRadius = UDim.new(0, 6)

    if isAuthorizedAdmin then
        TabHopBtn.MouseButton1Click:Connect(function()
            HopContainer.Visible = true
            ChatContainer.Visible = false
            TabHopBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 180)
            TabHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabChatBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            TabChatBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end)

        TabChatBtn.MouseButton1Click:Connect(function()
            HopContainer.Visible = false
            ChatContainer.Visible = true
            TabChatBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 180)
            TabChatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabHopBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            TabHopBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end)

        local function addLogMessage(sender, msg)
            local msgLabel = Instance.new("TextLabel")
            msgLabel.Parent = ChatScroll
            msgLabel.Size = UDim2.new(1, -5, 0, 20)
            msgLabel.BackgroundTransparency = 1
            msgLabel.Font = Enum.Font.GothamBold
            msgLabel.TextXAlignment = Enum.TextXAlignment.Left
            msgLabel.Text = "[" .. sender .. "]: " .. msg
            msgLabel.TextColor3 = Color3.fromRGB(100, 220, 255)
            msgLabel.TextSize = 11
            ChatScroll.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 10)
        end

        addLogMessage("Hệ Thống", "Admin Chat đã sẵn sàng.")

        SendBtn.MouseButton1Click:Connect(function()
            if ChatBox.Text ~= "" then
                local content = ChatBox.Text
                local senderName = LocalPlayer.Name
                
                addLogMessage(senderName, content)
                
                -- HIỆN BẢNG THÔNG BÁO TIKTOK LÊN NGAY LẬP TỨC KHI BẤM GỬI
                showAdminToast(senderName, content)
                
                -- Bắn vào khung chat chung trong game
                pcall(function()
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(content, "All")
                end)
                
                ChatBox.Text = ""
            end
        end)
    end

    -- Logic Server Hop
    task.spawn(function()
        while ScreenGui.Parent do
            local count = #Players:GetPlayers()
            NowLabel.Text = "Số người ở server hiện tại: " .. count
            task.wait(1)
        end
    end)

    local function getRandomServer()
        local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local ok, raw = pcall(function() return game:HttpGet(url) end)
        if not ok or not raw or raw == "" then return nil end
        local ok2, data = pcall(HttpService.JSONDecode, HttpService, raw)
        if not ok2 or not data or not data.data or #data.data == 0 then return nil end
        local currentId = tostring(game.JobId)
        local candidates = {}
        for _, s in ipairs(data.data) do
            if s.id and tostring(s.id) ~= currentId then
                table.insert(candidates, tostring(s.id))
            end
        end
        if #candidates == 0 then return nil end
        return candidates[math.random(1, #candidates)]
    end

    local function hopOnce()
        local threshold = math.max(1, math.floor(tonumber(MaxBox.Text) or 1))
        local currentCount = #Players:GetPlayers()
        if currentCount <= threshold then
            StatusLabel.Text = "✓ Server có " .. currentCount .. " người. Không cần hop."
            StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
            return false
        end
        StatusLabel.Text = "Đang tìm server khác..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
        task.wait(0.5)
        local serverId = getRandomServer()
        if not serverId then
            StatusLabel.Text = "Lỗi lấy danh sách server!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            return false
        end
        StatusLabel.Text = "Đang chuyển server..."
        StatusLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
        task.wait(0.5)
        pcall(function()
            TeleportService:TeleportToPlaceInstance(PlaceId, serverId, LocalPlayer)
        end)
        return true
    end

    HopBtn.MouseButton1Click:Connect(function()
        HopBtn.Active = false
        hopOnce()
        task.wait(2)
        HopBtn.Active = true
    end)

    local autoEnabled = false
    local autoThread = nil

    AutoBtn.MouseButton1Click:Connect(function()
        autoEnabled = not autoEnabled
        if autoEnabled then
            AutoBtn.Text = "Tự Động Hop: BẬT"
            AutoBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
            autoThread = task.spawn(function()
                while autoEnabled and ScreenGui.Parent do
                    local threshold = math.max(1, math.floor(tonumber(MaxBox.Text) or 1))
                    local count = #Players:GetPlayers()
                    if count <= threshold then
                        StatusLabel.Text = "✓ Đang ở mức phù hợp (" .. count .. " người). Chờ..."
                        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
                        task.wait(3)
                    else
                        hopOnce()
                        task.wait(5)
                    end
                end
            end)
        else
            AutoBtn.Text = "Tự Động Hop: TẮT"
            AutoBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
            if autoThread then
                task.cancel(autoThread)
                autoThread = nil
            end
            StatusLabel.Text = "Đã tắt Tự Động Hop."
            StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
    end)
end

-- Tự động bật bảng điều khiển ngay khi vào game
task.spawn(function()
    task.wait(0.5)
    CreateServerHopGUI()
end)

