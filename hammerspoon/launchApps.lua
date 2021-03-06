function launchApp(mod, key, appName)
  hs.hotkey.bind(mod, key, function()
      hs.application.launchOrFocus(appName)
  end)
end

launchApp("alt", "s", "Safari.app")
launchApp("alt", "n", "Notes.app")
launchApp("alt", "a", "App Store.app")
launchApp({"alt", "shift"}, "t", "Iterm Rosetta.app")
launchApp("alt", "t", "Iterm.app")
launchApp("alt", "d", "Drafts.app")
launchApp("alt", "v", "Visual Studio Code.app")
launchApp("alt", "p", "System Preferences.app")
launchApp({"alt", "shift"}, "p", "Plover.app")
launchApp("alt", "m", "Music.app")
launchApp("alt", "x", "Xcode.app")
launchApp("alt", "o", "Obsidian.app")
launchApp({"alt", "shift"}, "d", "Discord.app")