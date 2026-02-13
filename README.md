# 🌑 Apex Elite Library v1.0

<div align="center">

![Apex Elite Banner](https://img.shields.io/badge/APEX-ELITE-blueviolet?style=for-the-badge)
![Version](https://img.shields.io/badge/version-1.0-blue?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Roblox-red?style=flat-square)
![Mobile Support](https://img.shields.io/badge/mobile-supported-orange?style=flat-square)

**A premium UI library for Roblox exploits - lightweight, modern, and extremely functional.**

Specifically designed for **Mobilianos** (Mobile) and **Robloxianos** (PC).

[Discord](https://discord.gg/H6pWukrA7) • [Examples](#-quick-start) • [FAQ](#-faq)

</div>

---

## 📜 The Origin Story

In **Salvador, Bahia (Brazil)**, a 12-year-old developer who enjoyed using Roblox exploits had the idea to create a library similar to Fluent and Rayfield because those two were too limiting. 

And so **ApexLib** was born—a library that supports **Delta, Arceus X, Fluxus**, and more. 

> *"If you want to make an executor, this is the one; the input is customizable, everything is customizable, and it's **COOL**."*

---

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| 🔍 **Real-Time Search** | Filter components instantly through the integrated search bar |
| 🎨 **Poetic Color Motor** | 40+ hand-picked colors with beautiful names |
| 📱 **Mobile Optimized** | Full touch support for Mobilianos |
| 💾 **Auto-Save Configs** | JSON-based persistence system |
| 🎯 **Executor Ready** | Multi-line script input component |
| ⚡ **Smooth Animations** | Hardware-accelerated TweenService |
| 🖱️ **Draggable UI** | Move windows anywhere on screen |
| 🔐 **Secure** | 100% pure Lua, no obfuscation in v1.0 |

---

## 🎨 Poetic Color Motor

Apex supports **41 hand-picked colors**. Use these poetic names directly in your code:

### 🔥 Warm Colors
```
Red, Scarlet, Crimson, Orange, Amber, Yellow, Gold, Bronze
Wine, Brown, Chocolate, Terracotta, Sepia, Ochre
```

### ❄️ Cold Colors
```
Green, Emerald, Olive, Cyan, Turquoise, Blue, Navy
Celeste, Indigo, Teal
```

### 🌌 Mystic Colors
```
Violet, Purple, Lavender, Magenta, Fuchsia, Pink
Salmon, Coral
```

### ⚪ Neutral Colors
```
White, Black, Gray, Silver, Beige, Ivory, Graphite
Pearl, Khaki
```

---

## 🚀 Quick Start

### Installation
```lua
local Apex = loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/ApexLib.lua"))()
```

### Basic Example
```lua
-- Create Window
local Window = Apex:CreateWindow({
    Title = "Apex Elite Hub",
    Name = "MyScript",
    Keybind = Enum.KeyCode.RightControl
})

-- Create Tab
local MainTab = Window:AddTab("Main")

-- Add Button with Custom Color
MainTab:AddButton({
    Title = "Kill All",
    Color = "Crimson",
    Callback = function()
        print("Command executed!")
    end
})

-- Add Toggle
MainTab:AddToggle({
    Title = "Auto Farm",
    Flag = "AutoFarm",
    Default = false,
    Callback = function(state)
        print("Farm status:", state)
    end
})

-- Add Slider
MainTab:AddSlider({
    Title = "WalkSpeed",
    Flag = "Speed",
    Min = 16,
    Max = 300,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

-- Add Script Executor Input
MainTab:AddInput({
    Title = "Script Executor",
    Placeholder = "-- Paste your script here...",
    Height = 180,
    Callback = function(text)
        loadstring(text)()
    end
})
```

---

## 📚 Component Documentation

### Window
```lua
Apex:CreateWindow({
    Title = "Window Title",      -- String
    Name = "ConfigName",          -- String (for auto-save)
    Keybind = Enum.KeyCode.RightControl -- Toggle keybind
})
```

### Button
```lua
Tab:AddButton({
    Title = "Button Text",        -- String
    Color = "blue",               -- See Poetic Color Motor
    Callback = function()
        -- Your code here
    end
})
```

### Toggle
```lua
Tab:AddToggle({
    Title = "Feature Name",       -- String
    Flag = "UniqueID",            -- String (for saving)
    Default = false,              -- Boolean
    Callback = function(state)
        print("State:", state)
    end
})
```

### Slider
```lua
Tab:AddSlider({
    Title = "Speed",              -- String
    Flag = "WalkSpeed",           -- String (for saving)
    Min = 16,                     -- Number
    Max = 500,                    -- Number
    Default = 16,                 -- Number
    Callback = function(value)
        print("Value:", value)
    end
})
```

### TextBox Input
```lua
Tab:AddInput({
    Title = "Script Editor",      -- String (optional)
    Placeholder = "Enter text...",-- String
    Height = 100,                 -- Number (multi-line if > 60)
    Callback = function(text)
        loadstring(text)()
    end
})
```

---

## 🔧 Supported Executors

| Executor | Status | Platform |
|----------|--------|----------|
| Delta X | ✅ Supported | Mobile |
| Arceus X | ✅ Supported | Mobile |
| Fluxus | ✅ Supported | PC |
| Vega X | ✅ Supported | Mobile |
| Hydrogen | ✅ Supported | PC |
| Solara | ✅ Supported | PC |
| Wave | ✅ Supported | PC |

---

## 💾 Config System

Apex automatically saves your settings!

- **Location:** `workspace/Apex_Configs/[ConfigName].json`
- **Auto-Save:** Toggles and sliders save on change
- **Cross-Session:** Configs persist between script executions

### Requirements

Your executor must support:
- `writefile`
- `readfile`
- `isfolder`
- `makefolder`

---

## 🆙 The Road to v2.0

> **v2.0 is currently in Private Beta** 🔒

### Why Private?

We're building the **Apex Team** before public release to ensure:
- **2+ major updates per year**
- Professional support
- Quality over rushed releases

### What's New in v2.0?

- 🎭 **New Components:** Dropdown, ColorPicker, Keybind selector
- 🌈 **Theme System:** Light/Dark mode with custom themes
- 📊 **Advanced Notifications:** Toast notifications with icons
- 🎵 **Sound Effects:** Optional UI feedback sounds
- 🔐 **Key System:** Optional whitelist protection
- 📱 **Enhanced Mobile:** Dedicated mobile-first UI mode

### How to Get Early Access?

1. Win giveaways in our [Discord](https://discord.gg/H6pWukrA7)
2. Apply for the Apex Team in `#apply-for-team`
3. Be an active community contributor

---

## ❓ FAQ - Frequently Asked Questions

<details>
<summary><b>🚀 General & Access</b></summary>

**Q: How do I open/close the menu?**  
A: Press `RightControl` (PC) or tap the toggle button (Mobile).

**Q: Why is v2.0 private?**  
A: We're waiting to form the Apex Team for consistent updates.

**Q: How do I join the Team?**  
A: Apply in the `#apply-for-team` channel on Discord.

**Q: Is there a Key System?**  
A: Only for v2.0 pre-releases.

**Q: Can I use this for my script hub?**  
A: Yes! It was built for that purpose.

**Q: What does "Apex" mean?**  
A: It represents the peak of performance.

</details>

<details>
<summary><b>🛠️ Technical & Scripting</b></summary>

**Q: Which executors are supported?**  
A: Delta, Arceus X, Fluxus, Vega X, Hydrogen, Solara, Wave.

**Q: How do I set colors?**  
A: Use names from the Poetic Color Motor (e.g., `"Crimson"`, `"Emerald"`).

**Q: Is it open source?**  
A: v1.0 is public and free to use; v2.0 is currently restricted.

**Q: Does it support JSON saving?**  
A: Yes, built-in auto-save for configs.

**Q: Can I use RGB colors?**  
A: Yes, both `Color3.fromRGB()` and poetic strings work.

**Q: Is it laggy?**  
A: No, it uses hardware-accelerated `TweenService`.

**Q: How many tabs can I add?**  
A: Unlimited!

**Q: Is there a search bar?**  
A: Yes, filters components in real-time.

**Q: How do I send notifications?**  
A: Coming in v2.0 with the notification system.

**Q: Can I change the UI size?**  
A: The window is draggable and has a fixed optimal size.

**Q: Is the input multi-line?**  
A: Yes, perfect for script executors (set `Height > 60`).

</details>

<details>
<summary><b>📱 Mobile (Mobilianos) Specifics</b></summary>

**Q: Is it optimized for mobile?**  
A: Yes, designed specifically for Mobilianos.

**Q: Are buttons easy to tap?**  
A: Yes, we use large hitboxes for touch input.

**Q: Does it work on tablets?**  
A: Yes, scales to any screen ratio.

**Q: Can I move the UI?**  
A: Yes, the window is fully draggable.

</details>

<details>
<summary><b>🛡️ Security & Privacy</b></summary>

**Q: Is it safe?**  
A: 100%. Pure Lua UI library, no malicious code.

**Q: Will it ban me?**  
A: No. UIs are safe; your script's functions determine risk.

**Q: Is it obfuscated?**  
A: v1.0 is clean code; v2.0 pre-releases are protected.

**Q: What is the Kill Switch?**  
A: A security feature to lock leaked v2.0 versions.

</details>

<details>
<summary><b>🌟 Future & Team</b></summary>

**Q: What is a "Major Update"?**  
A: New UI components, features, and engine improvements.

**Q: Can I suggest features?**  
A: Yes, in the `#suggestions` Discord channel.

**Q: How many devs will the team have?**  
A: We're looking for 2-3 dedicated developers.

**Q: What is the update goal?**  
A: At least 2 massive updates every year.

</details>

---

## 🤝 Contributing

We welcome contributions! Here's how:

1. **Fork** the repository
2. **Create** your feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Code Standards

- Use meaningful variable names
- Comment complex logic
- Follow existing code style
- Test on both PC and mobile

---

## 📜 License & Usage

**Apex Elite Library v1.0** is free to use for personal and commercial script projects.

### Terms of Use

- ✅ Use in your script hubs
- ✅ Modify for your needs
- ✅ Share with proper credit
- ❌ Do not claim as your own work
- ❌ Do not sell the library itself

**Please give credit to joaorqqq when using this library.**

---

## 💬 Community

<div align="center">

[![Discord](https://img.shields.io/badge/Discord-Join%20Server-7289DA?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/H6pWukrA7)

**Join our community for:**
- 🎁 Giv
- 💡 Feature suggestions
- 🐛 Bug reports
- 🤝 Team applications
- 📚 Tutorials & examples

</div>

---

## 🙏 Credits

**Developer:** joaorqqq  
**Age:** 12 years old  
**Location:** Salvador, Bahia, Brazil 🇧🇷

> *Focused on bringing the best experience to the community of Mobilianos and Robloxianos.*

---

<div align="center">

### ⭐ Star this repository if you find it useful!

Made with ❤️ by the Apex Team

</div>
