<p align="center">
  <img src="https://i.imgur.com/5tUaU3N.png">
</p>

DofusPetsBot is a simple bot written in AutoHotkey for Dofus Retro. It can handle up to 36 pets per instance (1 instance per type of pet), it can also double feed pets when they get another characteristic point so it takes a third of the time less to raise.

Pros of using AHK :
- No need to change anything when a new update comes out. 
- Undetectable since it is using the official client without any modification (of course one thing that could get you banned is a very low delay between each feeding).
- Extremely stable and lightweight.

Cons :
- The image detection library is a little bit sensitive, you must use the lowest graphics quality since ImageSearchList doesn't have any tolerance settings. 
- Must be set up on a VM/computer not frequently used cause it operates in foreground (unless you want to be disturbed while playing/binge watching).
- Slower than a socket bot.
- You can only feed 36 pets by instance (because the inventory only shows 36 items at the same time and I can't manage to scroll down after the first 36 pets are fed because the client automatically goes up when changing tab, you could modify the core so it shows more items at the same time but you'll have to deobfuscate and modify it again after each update, you would also be playing with fire since a moderator could check the integrity of your core.swf and ban you).

How to use?

- You can customize each "Sleep" line since it depends on your computer's specifications.
- Since the bot is using X and Y coordinates to act, you must customize it depending on your screen resolution (mine is 1920x1080 100% DPI so if it is the same for you, you shouldn't have to modify any XY positions except the characteristics position). You can use AHK's Window Spy or MousePosition.ahk in the repo to get your current mouse position.
- DofusPetsBot is using screenshots to compare before and after the feeding so it knows if it has to double feed or not. Some types of pets doesn't have the characteristic value at the same coordinates, so you must adapt it depending on which type of pet you're feeding. (Line 161 and 179)
- You must adapt the countdown before next feeding since some types of pets doesn't have the default interval (5 hours for many pets while some others have 24 hours). (Line 201 and 202)
- You also have to take a screenshot (from your inventory) of the pet you want to feed (not the entire sprite but a piece of it like 5x5 px) and place it in a new folder named "Data".

This was my first project in AHK, so the code is quite messy !

