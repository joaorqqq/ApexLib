## 🌑 Apex Elite Library v1.0
Apex Elite is a premium UI library developed to be lightweight, modern, and extremely functional. Specifically designed for the Roblox ecosystem, it offers full support for Mobilianos (Mobile) and Robloxians (PC).
## 📜 The Origin Story (Our Roots)
In Salvador, Bahia (Brazil), a 12-year-old developer who enjoyed using Roblox exploits had the idea to create a library similar to Fluent and Rayfield because those two were too limiting. And so ApexLib was born—a library that supports Delta, Arceus X, Fluxus, and more. If you want to make an executor, this is the one; the input is customizable, everything is customizable, and it's COOL.
## 🎨 Poetic Color Motor (Supported Colors)
Apex supports over 40 hand-picked colors. You can use these names directly in your code:
 * Warm: Red, Scarlet, Crimson, Orange, Amber, Yellow, Gold, Bronze, Wine, Brown, Chocolate, Terracotta, Sepia, Ochre.
 * Cold: Green, Emerald, Olive, Cyan, Turquoise, Blue, Navy, Celeste, Indigo, Teal.
 * Mystic: Violet, Purple, Lavender, Magenta, Fuchsia, Pink, Salmon, Coral.
 * Neutral: White, Black, Gray, Silver, Beige, Ivory, Graphite, Pearl, Khaki.
## ✨ Apex Key Features
 * 🔍 Real-Time Search: Filter commands instantly through the integrated search bar.
 * 🎨 Poetic Color Motor: Use poetic color names like Emerald, Crimson, Wine, Gold, and Turquoise.
 * 📐 Adaptive Interface: Dynamic resizing (Resize) and dragging (Draggable) system.
 * 💻 Executor Hub: Optimized Input component for creating in-game script executors.
 * ⚡ Optimization: Built with TweenService for smooth animations without lag.
## 🆙 The Road to v2.0 (The Apex Team Era)
While v1.0 is our current public release, v2.0 is a Private Beta.
Why is it private?
The v2.0 development and public release are restricted until we have a good team of moderators and developers so we can update Apex at least twice a year. We prioritize quality and a solid Apex Team over rushed releases.
 * Status: Private / Invite-Only.
 * Early Access: Granted to giveaway winners to record showcases and update their scripts before launch.
## 🚀 How to Use
To use the library in your script, simply use the official Loader:
```lua
local Apex = loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/Loader.lua"))()

local Window = Apex:CreateWindow({
    Title = "Apex Elite Hub"
})

local MainTab = Window:AddTab("Main")

-- 🔘 Buttons with Custom Colors
MainTab:AddButton({
    Title = "Kill All",
    Color = "Crimson",
    Callback = function()
        print("Command executed!")
    end
})

-- 🔘 Toggles
MainTab:AddToggle({
    Title = "Auto Farm",
    Default = false,
    Callback = function(state)
        print("Farm status:", state)
    end
})

-- 🔘 Sliders
MainTab:AddSlider({
    Title = "WalkSpeed",
    Min = 16,
    Max = 300,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

-- 🔘 Script Input (Executor Hub)
MainTab:AddInput({
    Placeholder = "-- Paste your script here...",
    Height = 180,
    Callback = function(text)
        loadstring(text)()
    end
})
```
## ❓ FAQ - Frequently Asked Questions (30 Questions)
### 🚀 General & Access
 * How do I open/close the menu? Press LeftControl (PC) or use the toggle button (Mobile v2).
 * Why is v2.0 private? We are waiting to form the Apex Team for consistent updates.
 * How do I join the Team? Recruitment happens in the #apply-for-team channel.
 * Is there a Key System? Only for the private v2.0 pre-releases.
 * Can I use this for my script hub? Yes, it was built for that!
 * What does "Apex" mean? It represents the peak of performance.
### 🛠️ Technical & Scripting
 * Which executors are supported? Delta, Arceus X, Fluxus, Vega X, and Hydrogen.
 * How do I set colors? Use the names from the Poetic Color Motor table.
 * Is it open source? v1.0 is public; v2.0 is currently restricted.
 * Does it support JSON saving? Yes, it has built-in auto-save for configs.
 * Can I use RGB? Yes, both Color3 and Poetic strings work.
 * Is it laggy? No, it uses hardware-accelerated TweenService.
 * How many tabs can I add? As many as you need!
 * Is there a search bar? Yes, it filters components in real-time.
 * Does it have a dropdown? Yes, the dropdown is fully functional.
 * How do I send notifications? Use the Apex:Notify function.
 * Can I change the UI size? Yes, it features a dynamic resizing system.
 * Is the input multi-line? Yes, perfect for executors.
### 📱 Mobile (Mobilianos) Specifics
 * Is it optimized for mobile? Yes, designed specifically for mobilianos.
 * Are buttons easy to click? Yes, we use large hitboxes for touch.
 * Does it work on tablets? Yes, it scales to any screen ratio.
 * Can I move the UI? Yes, the entire window is draggable.
### 🛡️ Security & Privacy
 * Is it safe? 100%. Pure Lua UI library.
 * Will it ban me? No. UIs are safe; your script functions are what matter.
 * Is it obfuscated? v1.0 is clean; v2.0 pre-releases are protected.
 * What is the Kill Switch? A security feature to lock leaked versions of v2.0.
### 🌟 Future & Team
 * What is a "Major Update"? New UI components and engine overhauls.
 * Can I suggest features? Yes, in the #suggestions channel.
 * How many devs will the team have? We are looking for 2-3 dedicated devs.
 * What is the update goal? At least 2 massive updates every year.
> Developed by joaorqqq.
> Focused on bringing the best experience to the community of mobilianos and robloxians.
> Discord: https://discord.gg/H6pWukrA7
