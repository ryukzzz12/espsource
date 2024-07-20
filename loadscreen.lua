-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageLabel.Parent = ScreenGui
ImageLabel.AnchorPoint = Vector2.new(0, 1)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.404689878, 0, 0.606699765, 0)
ImageLabel.Size = UDim2.new(0, 252, 0, 161)
ImageLabel.Image = "rbxassetid://18566065103"
ImageLabel.ScaleType = Enum.ScaleType.Crop
ImageLabel.Active = true

-- Scripts:

local function TCRM_fake_script() -- ImageLabel.LocalScript 
	local script = Instance.new('LocalScript', ImageLabel)

	-- Variables
	local screenGui = script.Parent
	local imageLabel = script.Parent
	
	-- Crear el BlurEffect
	local blur = Instance.new("BlurEffect")
	blur.Name = "BlurEffect"
	blur.Size = 24 -- Ajusta el tamaño del blur según sea necesario
	blur.Parent = game.Lighting
	blur.Enabled = true
	
	-- Mostrar la imagen centrada
	imageLabel.Visible = true
	imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	
	-- Función de desvanecimiento
	local function fadeOut(instance, property, duration, goalValue)
		local tweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local goal = {}
		goal[property] = goalValue
	
		local tween = tweenService:Create(instance, tweenInfo, goal)
		tween:Play()
		tween.Completed:Wait()
	end
	
	-- Función de movimiento
	local function moveTo(instance, duration, goalPosition)
		local tweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local goal = { Position = goalPosition }
	
		local tween = tweenService:Create(instance, tweenInfo, goal)
		tween:Play()
		tween.Completed:Wait()
	end
	
	-- Mostrar imagen por 5 segundos y luego desvanecer
	wait(5)
	
	-- Desvanecer imagen
	fadeOut(imageLabel, "ImageTransparency", 1, 1)
	
	-- Mover imagen fuera de la pantalla
	moveTo(imageLabel, 1, UDim2.new(2, 0, 2, 0)) -- Mueve la imagen fuera de la pantalla
	
	-- Desvanecer Blur
	fadeOut(blur, "Size", 1, 0) -- Reduce el tamaño del blur a 0 en 1 segundo
	
	-- Opcional: Eliminar el BlurEffect después de la animación
	blur:Destroy()
	
end
coroutine.wrap(TCRM_fake_script)()


wait(7)
