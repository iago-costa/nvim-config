import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Layout.ToggleLayouts
import XMonad.Util.EZConfig (additionalKeys, additionalKeysP)

import qualified XMonad.StackSet as W
import qualified Data.Map as M

-- The main function.
main = xmonad myConfig 

myConfig = xfceConfig
    { terminal = "alacritty"
    , modMask = mod4Mask -- Use Win as MOD key
    , startupHook = ewmhDesktopsStartup >> setWMName "LG3D"
    , workspaces = myWorkspaces
    , logHook = myLogHook
    } `additionalKeys` myKeys `additionalKeysP` myKeysP

-- Key bindings
myKeys = [
    -- ((mod4Mask, xK_f), toggleFull)
    -- key to toggle full view layout for active window
    -- , ((mod4Mask, xK_d), spawn "Thunar")
    -- key to toggle full view layout for active window
    ]

myKeysP = [    
    ("M-x w", spawn "xmessage 'woohoo!'")
    -- key to toggle full view layout for active window
    -- , ("M-x f", sendMessage Toggle "Full")
    ]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
 
-- get the current workspace
myLogWorkpace = do
    ws <- gets windowset
    let tag = W.currentTag ws
    io $ writeFile "/tmp/.xmonad-workspace"
        ("Work=" ++ tag)
    return ()

-- get number of active windows and send to logHook
myLogActiveWindows = do
    n <- gets $ Just . length . W.index . windowset
    io $ writeFile "/tmp/.xmonad-active-windows" -- with legend "Active Windows: " ++ show n
        (case n of
            Just n' -> "WNum=" ++ show n'
            Nothing -> "0")
    return ()

-- get the name of the active window
myActiveWindowName = do
    n <- gets $ Just . W.peek . windowset
    io $ writeFile "/tmp/.xmonad-active-window-name"
        (case n of
            Just n' -> "Win=" ++ show n'
            Nothing -> "0")
    return ()

myLogHook = myLogWorkpace >> myLogActiveWindows >> myActiveWindowName

-- Looks to see if focused window is floating and if it is the places it in the stack
-- else it makes it floating but as full screen
toggleFull = withFocused (\windowId -> do
     { floats <- gets (W.floating . windowset);
         if windowId `M.member` floats
         then withFocused $ windows . W.sink
         else withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1) })  
