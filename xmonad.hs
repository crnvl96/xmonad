import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig

main :: IO ()
main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig

myConfig =
  def
    { modMask = mod4Mask,
      terminal = "wezterm",
      borderWidth = 2,
      normalBorderColor = "#333333",
      focusedBorderColor = "#5294e2",
      layoutHook = avoidStruts $ layoutHook def
    }
    `additionalKeysP` [ ("M-f", spawn "google-chrome"),
                        ("M-p", spawn "dmenu"),
                        ("M-q", spawn "xmonad --recompile && xmonad --restart")
                      ]

myPP =
  def
    { ppCurrent = xmobarColor "#5294e2" "" . wrap "[" "]",
      ppVisible = xmobarColor "#999999" "",
      ppHidden = xmobarColor "#cccccc" ""
    }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
