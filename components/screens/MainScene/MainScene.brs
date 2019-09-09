Function Init()
    'set intial focus to MainScene
    m.top.setFocus(true)

    'find and define next scene
    m.usernameScene = m.top.findNode("UsernameScene")

    'find and define Login and Exit buttons
    m.loginButtons = m.top.findNode("LoginButtonGroup")

    'set Login and Exit button details
    m.loginButtons.buttons = ["Login", "Exit"]
    m.loginButtons.iconUri = ""
    m.loginButtons.focusedIconUri = ""
    m.loginButtons.translation = "[70, 450]"
    m.loginButtons.itemSpacings = "[20, 0]"
    m.loginButtons.minWidth = "328"
    m.loginButtons.textFont = "font:LargeSystemFont"
    m.loginButtons.focusedTextFont = "font:LargeBoldSystemFont"

    'observe change in focus
    m.top.observeField("focusedChild", "OnLoginFocusedChildChange")

    'observe selection of buttons
    m.loginButtons.ObserveField("buttonSelected", "OnLoginButtonSelected")

End Function

'if MainScene is part of focus chain but buttons are not, give buttons focus
Sub OnLoginFocusedChildChange()
    if m.top.isInFocusChain() and not m.loginButtons.hasFocus() then
        m.loginButtons.setFocus(true)
    end if
End Sub

'if Login button selected, make buttongroup invisible, make next scene visible, set focus to next scene
'else if Exit button selected, close app
sub OnLoginButtonSelected()
    if m.loginButtons.buttonSelected = 0 then
        m.loginButtons.visible = "false"
        m.usernameScene.visible = "true"
        m.usernameScene.setFocus(true)
    else if m.loginButtons.buttonSelected = 1 then
        print "exit selected"
    end if
end sub