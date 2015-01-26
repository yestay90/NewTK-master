local composer = require( "composer" )

local scene = composer.newScene()

local menuBackground
local started = false

local function startGame(event)
    
    if not started then
        started = true
	   composer.gotoScene("logo_samruk")
    end
end

function scene:create( event )

    local sceneGroup = self.view
    local ratio

    menuBackground = display.newImage("images/logo_ulttyqsport.png")
    menuBackground.x = display.contentCenterX
    menuBackground.y = display.contentCenterY+150
    menuBackground.xScale = 1.3
    menuBackground.yScale = 1.3
    sceneGroup:insert(menuBackground)
    menuBackground:addEventListener("tap",startGame)
    if not started then
        timer.performWithDelay(2000,startGame)
    end
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene