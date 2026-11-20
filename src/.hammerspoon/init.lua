-- Work around https://github.com/ghostty-org/ghostty/issues/12265
--
-- https://share.gemini.google/0HXOxhQguKhK
local GHOSTTY_BUNDLE_ID = "com.mitchellh.ghostty"

local isPostingSynthetic = false

local ghosttyCtrlAltTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
  if isPostingSynthetic then
    return false
  end

  local frontApp = hs.application.frontmostApplication()
  if not frontApp or frontApp:bundleID() ~= GHOSTTY_BUNDLE_ID then
    return false
  end

  local flags = event:getFlags()
  -- Match ctrl + alt only (ignore cmd or shift so other combos aren't affected)
  if not (flags.ctrl and flags.alt and not flags.cmd and not flags.shift) then
    return false
  end

  local keyChar = event:getCharacters(true) -- clean character without modifiers
  if not keyChar or not keyChar:match("^[a-z]$") then
    return false
  end

  isPostingSynthetic = true
  -- Send an Alt key-up event directly to Ghostty before allowing the event to pass through
  local altUp = hs.eventtap.event.newKeyEvent({}, hs.keycodes.map.alt, false)
  altUp:post(frontApp)
  isPostingSynthetic = false

  -- Return false so the original ctrl+alt+<letter> event continues to Quicksilver
  return false
end)

ghosttyCtrlAltTap:start()
