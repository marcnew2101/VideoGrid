sub Init()
    m.passwordLabel = m.top.findNode("PasswordLabel")
    m.passwordKeyboard = m.top.findNode("PasswordKeyboard")
    m.passwordButtons = m.top.findNode("PasswordButtonGroup")
    m.passwordGroup = m.top.findNode("PasswordGroup")

    'find and define next scene
    m.usernameScene = m.top.findNode("UsernameScene")

    keyboardArea = m.passwordKeyboard.boundingRect()

    centerx = (1920 - keyboardArea.width) / 2
    centery = (1080 - keyboardArea.height) / 2

    m.passwordKeyboard.translation = [ centerx, centery ]
    m.passwordLabel.translation = [ centerx + 20, centery - 50 ]
    m.passwordButtons.translation = [ centerx + 10, centery + 450 ]
    
    m.passwordLabel.text = "Password"        
    m.passwordLabel.width = "0"
    m.passwordLabel.font = "font:LargeBoldSystemFont"    
     
    m.passwordButtons.buttons = ["Finish", "Back"]
    m.passwordButtons.iconUri = ""
    m.passwordButtons.focusedIconUri = ""
    
    m.passwordButtons.ObserveField("buttonSelected", "OnPasswordButtonSelected")

    print m.top

End sub

sub OnPasswordButtonSelected()
    if m.passwordButtons.buttonSelected = 0 then
        print "Finish button selected"
    else if m.passwordButtons.buttonSelected = 1 then
        m.passwordGroup.visible = "false"
        m.usernameScene.visible = "true"
        m.usernameScene.setFocus(true)
        
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if key = "back" then
            m.top.visible = false
        end if
        if key = "down" and not m.passwordButtons.isInFocusChain() then
            m.passwordButtons.setFocus(true)
            handled = true
        else
            m.passwordKeyboard.setFocus(true)
            handled = true
        end if

        if key = "up" and not m.passwordKeyboard.hasFocus() then
            m.passwordKeyboard.setFocus(true)
            handled = true
        else
            m.passwordButtons.setFocus(true)
            handled = true
        end if
    end if
    return handled
end function