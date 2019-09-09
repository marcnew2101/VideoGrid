sub Init()
    m.usernameLabel = m.top.findNode("UsernameLabel")
    m.usernameKeyboard = m.top.findNode("UsernameKeyboard")
    m.usernameButtons = m.top.findNode("UsernameButtonGroup")
    m.usernameGroup = m.top.findNode("UsernameGroup")

    'find and define next scene
    m.passwordScene = m.top.findNode("PasswordScene")

    keyboardArea = m.usernameKeyboard.boundingRect()

    centerx = (1920 - keyboardArea.width) / 2
    centery = (1080 - keyboardArea.height) / 2

    m.usernameKeyboard.translation = [ centerx, centery ]
    m.usernameLabel.translation = [ centerx + 20, centery - 50 ]
    m.usernameButtons.translation = [ centerx + 10, centery + 450 ]
    
    m.usernameLabel.text = "Enter E-mail Address"        
    m.usernameLabel.width = "0"
    m.usernameLabel.font = "font:LargeBoldSystemFont"    
     
    m.usernameButtons.buttons = ["Next", "Back"]
    m.usernameButtons.iconUri = ""
    m.usernameButtons.focusedIconUri = ""
    
    m.usernameButtons.ObserveField("buttonSelected", "OnUsernameButtonSelected")

End sub

sub OnUsernameButtonSelected()
    if m.usernameButtons.buttonSelected = 0 then
        m.usernameGroup.visible = "false"
        m.passwordScene.visible = "true"
        m.passwordScene.setFocus(true)
    else if m.usernameButtons.buttonSelected = 1 then
        print "Back button selected"
        m.top.visible = "false"
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if key = "back" then
            m.top.visible = false
        end if
        if key = "down" and not m.usernameButtons.isInFocusChain() then
            m.usernameButtons.setFocus(true)
            handled = true
        else
            m.usernameKeyboard.setFocus(true)
            handled = true
        end if

        if key = "up" and not m.usernameKeyboard.hasFocus() then
            m.usernameKeyboard.setFocus(true)
            handled = true
        else
            m.usernameButtons.setFocus(true)
            handled = true
        end if
    end if
    return handled
end function