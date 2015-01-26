local composer = require( "composer" )

local scene = composer.newScene()

local menuBackground
local button1, button2

local function startGame(event)
	composer.hideOverlay("slideUp",400)

end

local function returnToMenu(event)
    
    local options = 
    {
        effect = "fade",
        time = 600
    }
    composer.gotoScene("menu",options)
    composer.hideOverlay()
end

function scene:create( event )

    local sceneGroup = self.view
    local ratio

    menuBackground = display.newImage("images/pause_menu.png")
    menuBackground.x = display.contentCenterX
    menuBackground.y = display.contentCenterY
    
    sceneGroup:insert(menuBackground)

    button1 = display.newImage("images/menu_button.png")
    button1.x = display.contentCenterX -150
    button1.y = display.contentCenterY + 150
    sceneGroup:insert(button1)
    button1:addEventListener("tap",returnToMenu)

    button2 = display.newImage("images/resume_button.png")
    button2.x = display.contentCenterX + 150
    button2.y = display.contentCenterY + 152
    sceneGroup:insert(button2)
    button2:addEventListener("tap",startGame)

    --menuBackground:addEventListener("tap",startGame)
    --timer.performWithDelay(2000,startGame)
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
            event.parent:resumeGame()
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