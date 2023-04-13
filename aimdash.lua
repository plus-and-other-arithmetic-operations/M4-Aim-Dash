local screenElementColor = rgbm(0,0,0,1) --change to liking
local onBackgroundLight = rgbm(10/255,255/255,255/255,1)  --change to liking
local offBackgroundLight = rgbm(60/255,60/255,60/255,1)  --change to liking
local backgroundColor


function getBackgroundColor()
    if car.headlightsActive then
        backgroundColor = onBackgroundLight
    else
        backgroundColor = offBackgroundLight
    end
end

function setupScreenElements()  --hardcoding this seems counter intuitive but its the most accurate way to recreate the screen
    display.rect{pos = vec2(0, 0), size = vec2(963, 474), color= backgroundColor} --background drawn here

    display.rect{pos = vec2(51, 0), size = vec2(10,90), color= screenElementColor} --big rev bars, 0
    display.rect{pos = vec2(155, 0), size = vec2(10,90), color= screenElementColor} -- 1
    display.rect{pos = vec2(260, 0), size = vec2(10,90), color= screenElementColor} --2
    display.rect{pos = vec2(364, 0), size = vec2(10,90), color= screenElementColor} --3
    display.rect{pos = vec2(468, 0), size = vec2(10,90), color= screenElementColor} --4
    display.rect{pos = vec2(572, 0), size = vec2(10,100), color= screenElementColor} --5
    display.rect{pos = vec2(676, 0), size = vec2(10,105), color= screenElementColor} --6
    display.rect{pos = vec2(780, 0), size = vec2(10,135), color= screenElementColor} --7
    display.rect{pos = vec2(884, 0), size = vec2(10,160), color= screenElementColor} --8

    display.rect{pos = vec2(106, 0), size = vec2(5,75), color= screenElementColor} --small rev bars, 0.5
    display.rect{pos = vec2(210, 0), size = vec2(5,75), color= screenElementColor} --1.5
    display.rect{pos = vec2(314, 0), size = vec2(5,75), color= screenElementColor} --2.5
    display.rect{pos = vec2(419, 0), size = vec2(5,75), color= screenElementColor} --3.5
    display.rect{pos = vec2(523, 0), size = vec2(5,75), color= screenElementColor} --4.5
    display.rect{pos = vec2(627, 0), size = vec2(5,90), color= screenElementColor} --5.5
    display.rect{pos = vec2(730, 0), size = vec2(5,105), color= screenElementColor} --6.5
    display.rect{pos = vec2(835, 0), size = vec2(5,135), color= screenElementColor} --7.5

    display.text{pos = vec2(282, 154), letter = vec2(65, 55), text = "W", font = "handel_gotdbold", color= screenElementColor} --all text
    display.text{pos = vec2(328, 154), letter = vec2(55, 55), text = "A", font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(359, 154), letter = vec2(55, 55), text = "T", font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(281, 210), letter = vec2(49, 54), text = "C", font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(282, 298), letter = vec2(50, 56), text = "O", font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(307, 298), letter = vec2(50, 56), text = "I", font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(328, 298), letter = vec2(50, 56), text = "L", font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(354, 298), letter = vec2(50, 56), text = "T", font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(281, 355), letter = vec2(49, 54), text = "C", font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(818, 184), letter = vec2(50, 56), text = "best",spacing=-25, font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(817, 329), letter = vec2(52, 56), text = "LapT",spacing=-25, font = "handel_gotdbold", color= screenElementColor}
    display.text{pos = vec2(41, 100), letter = vec2(27, 39), text = "0",spacing=-25, font = "e39", color= screenElementColor}
    display.text{pos = vec2(250, 100), letter = vec2(27, 39), text = "2",spacing=-25, font = "e39", color= screenElementColor}
    display.text{pos = vec2(458, 100), letter = vec2(27, 39), text = "4",spacing=-25, font = "e39", color= screenElementColor}
    display.text{pos = vec2(668, 115), letter = vec2(27, 39), text = "6",spacing=-25, font = "e39", color= screenElementColor}
    display.text{pos = vec2(914.5, 8), letter = vec2(26, 39), text = "R",spacing=-25, font = "e39", color= screenElementColor}
    display.text{pos = vec2(914.5, 53), letter = vec2(26, 39), text = "P",spacing=-25, font = "e39", color= screenElementColor}
    display.text{pos = vec2(914.5, 95), letter = vec2(26, 39), text = "M",spacing=-25, font = "e39", color= screenElementColor}
end

function drawLapT()
    if car.lapTimeMs >= 3600000 then car.lapTimeMs = 1 end
    lapTime = ac.lapTimeToString(car.lapTimeMs)
    display.text{pos = vec2(450,305), letter = vec2(40, 100), text = lapTime,spacing=0, font = "e92_big", color= screenElementColor}
end

function drawBestLapT()
    if car.bestLapTimeMs >= 3600000 then car.bestLapTimeMs = 0 end
    bestLapTime = ac.lapTimeToString(car.bestLapTimeMs)
    display.text{pos = vec2(450,160), letter = vec2(40, 100), text = bestLapTime,spacing=0, font = "e92_big", color= screenElementColor}
end

function drawTemps() 
    display.text{pos = vec2(80,135), letter = vec2(70, 175), text = math.floor(car.waterTemperature),spacing=-5, font = "e92_big", color= screenElementColor}
    display.text{pos = vec2(80,280), letter = vec2(70, 175), text = math.floor(car.oilTemperature),spacing=-5, font = "e92_big", color= screenElementColor}
end


function drawData()
    drawLapT()
    drawBestLapT()
    drawTemps() 
end

function drawRevBars()
    rpm = math.floor(81*math.saturate(car.rpm/8000)) - 1
    offset = 0
    verticalScale = 60
    for i = 0, rpm do
        if i >= 30 and i < 90 then 
            verticalScale = verticalScale + 0.23*math.exp(-1+4*math.saturate(i / 80)) 
            verticalScale = math.floor(10*verticalScale)/10
        end
        if i >= 10 and i < 21 then 
            offset= 2 
        end
        if i >= 21 and i < 30 then 
            offset= 5 
        end
        if i >= 31 and i < 40 then 
            offset= 7 
        end
        if i >= 41 and i < 50 then 
            offset= 9 
        end  
        if i >= 51 and i < 60 then 
            offset= 11 
        end
        if i >= 61 and i < 70 then 
            offset= 13 
        end
        if i >= 71 and i < 80 then 
            offset= 15 
        end
        if i >= 91 and i < 90 then 
            offset= 17 
        end

        if i % 5 == 0 then goto draw_nothing end

    display.rect{pos = vec2(54 + (offset) + (i*10.2), 0), size = vec2(6,verticalScale), color= screenElementColor} 
   
    ::draw_nothing::
    end
end

function update(dt)
    getBackgroundColor()
    setupScreenElements()
    drawData()
    drawRevBars()
end