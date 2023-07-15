# color-changing-eww-bar


![woman with leashed dog](https://github.com/AlwaysAndrew8/color-changing-eww-bar/blob/main/20230715_12h47m03s_grim.png)

I use the Hyprland Desktop environment. This is an eww bar that changes color to match your wallpaper!

:) Hopefully what I type makes sense!

<details>
  <summary>⚠️ Important note if reloading eww bar colors in actual (not tiled) full-screen ⚠️</summary>

  Full screen usage makes it so that the eww bar will surface on top due to it reloading the colors for the wallpaper, I'm unsure if this is possible to change, but switching workspaces will put it back down beneath. I rarely use full-screen (like actual full-screen, not tiled) and when it does pop up, it doesn't usually block anything important in the games I play. But be warned.
  
  This isn't an issue if you change wallpapers only when the computer starts up, and never when in full-screen, as then the eww-bar never reloads while on. Actually, after writing this, I may just adjust my personal wallpapers to only change on computer startup... that would be smart. This would negate the need for my systemd/Timer :D EDIT: Ended up just changing wallpaper on startup. Works nicely.
</details>

<details>
  <summary>If you already have your own eww bar and just want the colors</summary>
  
  NOTE: If you already have your own eww bar and pywal, and your pywal is setup to grab the wallpaper colors, simply add "@import '/home/$USER/.cache/wal/colors.scss';" to the top of your eww.scss file, and replace the colors with "$color0-$color16" (I think the colors end at 16, likely wrong). Then, if you want, just wget or copy the "ewwatch" and "change_wallpaper.sh" code so that the eww bar changes color everytime your wallpaper changes.
</details>

Example:
```
@import '/home/$USER/.cache/wal/colors.scss';
.example-bar 
{
    color: $color4;
}
```

# Pre-requisites:
- [pywal](https://github.com/dylanaraps/pywal)
- [eww](https://github.com/elkowar/eww)
- [ALSA](https://github.com/alsa-project)^1
- [systemd](https://github.com/systemd/systemd)^2
- [swaylock](https://github.com/swaywm/swaylock)^3
- [Hyprland](https://github.com/hyprwm/Hyprland)^4
- [playerctl](https://github.com/altdesktop/playerctl)^5
  (That should be it, will add if I recall any)

<details>
  <summary>Note on what may need to change if you don't use certain pre-requisites</summary>

  ^1: There are several different downloads from ALSA, I have alsa-oss, alsa-utils, alsa-lib, alsa-plugs, and alsa-ucm-conf. You may only neeed alsa-lib or something. If you don't want to use ALSA, the volume may not work. If you use another type of audio, consider adjusting that to whatever audio you use. It's under pollers.yuck.

If you don't use...

^2: systemd, the power options may not work. The systemd code that I used (search for systemctl) is in widgets.yuck. So, adjust that to what you use. Note that "sleep" (the cloud icon) uses systemctl suspend, but for some reason doesn't work. It turns back on after like 30 seconds. Work in progress.

^3: swaylock, the lock option may not work. To have the eww bar do something else when the lock icon is clicked, adjust the code in widgets.yuck to whatever you want the lock icon to do.

^4: Hyprland, the workspaces may not work. This can be adjusted by changing hyprctl for workspaces to whatever you use.

^5: playerctl, pause, play, loop, and play next/play last may not work.
</details>

# Installation
You can git clone this by typing
```
git clone "https://github.com/AlwaysAndrew8/color-changing-eww-bar.git"
```

Please make sure to move files to proper locations for everything to work, or change the directories.

I place my change_wallpaper.service and my change_wallpaper.timer in /home/$USER/.config/systemd/user/. If you do this, make sure to start it by typing:
```
sudo systemctl enable change_wallpaper.timer
```
and
```
sudo systemctl start change_wallpaper.timer
```
You may have to do this with change_wallpaper.service as well, I no longer use this timer so it has been a while. I simply start my change_wallpaper.sh script on startup.
Make sure to restart the daemon if you alter the files. It defaults to changing the wallpaper every hour.

# Guide


<details>
  <summary>1. Download Pywal</summary>
  
We will need Pywal. Make sure you download that. I use yay to download packages, so for me it's
```
yay -S python-pywal
```
Use your package manager
</details>
<details>
  <summary>2. Get wallpapers if you have none</summary>
  I like using this website called wallhaven.cc
</details>
<details>
  <summary>3. Adjust any directories in the code to follow wherever you put the files (VERY IMPORTANT)</summary>
  
  So, for instance, you may need to adjust /home/$USER/place-where-I-put-my-scripts in a file to /home/$USER/place-where-you-put-your-scripts. Or, adjust my user to yours (I haven't changed my user to $USER yet, but plan to hopefully when the files are uploaded). This may take some time. For this, if you use nvim, I would type :%s:text-to-replace:new-text:g. That way, you can change all the directory usernames, at once.

</details>

<details>
  
  <summary>4. Use hyprland.conf, crontab, or something to have it so that change_wallpaper.sh runs on startup.</summary>
  
  I use hyprland.conf. Basically, I just slapped exec = /home/$USER/change_wallpaper.sh in my file.
</details>

<details>
<summary>Note on what certain scripts do:</summary>

  ewwatch just watches for changes and updates the eww bar. It only runs for 5 seconds when the wallpaper changes, and then the eww bar should change color to the same as the background. It is ran whenever change_wallpaper.sh is ran.

change_wallpaper.sh just changes the wallpaper to any wallpapers located in the /home/my-user/Downloads/Wallpapers directory. You should adjust this location to where you keep your wallpapers, or it won't work.

systemd/timers - I use Arch Linux, and so, instead of crontab, I opted to use systemd/timers. They are called change_wallpaper.timer and change_wallpaper.service. I have it set to change the wallpaper every 60 minutes, but if you want it changed in a shorter time, go to the file change_wallpaper.timer, and change "OnUnitActivateSec=60min" to "OnUnitActivateSec=time-you-want."
</details>

# Reserve Space (Hyprland)

Hyprland users, do not forget to reserve space in the hyprland.conf file. Below are my values, but this is based off of my gaps_out, my border, and my likes. You likely will need to adjust this.
```
#monitor=name,addreserved,TOP,BOTTOM,LEFT,RIGHT
monitor=,addreserved,0,0,91,0
```

# Images
![woman with hat near butterfly](https://github.com/AlwaysAndrew8/color-changing-eww-bar/blob/main/20230715_12h47m53s_grim.png)
![woman laying](https://github.com/AlwaysAndrew8/color-changing-eww-bar/blob/main/20230715_12h48m53s_grim.png)
![woman with pink hair](https://github.com/AlwaysAndrew8/color-changing-eww-bar/blob/main/20230715_12h49m12s_grim.png)
![woman_with_pink_umbrella](https://github.com/AlwaysAndrew8/color-changing-eww-bar/blob/main/girl_umbrella_pink.png)
![power icons](https://github.com/AlwaysAndrew8/color-changing-eww-bar/blob/main/power_icons.png)

# Credit
Thank you to [elkowar](https://github.com/elkowar) for making eww, [okklol](https://github.com/okklol/eww-bar) for what I started with as my eww bar,  [the Hypr Development Team](https://github.com/hyprwm): [Vaxry](https://github.com/vaxerski), [Fufexan](https://github.com/fufexan), [ThatOneCalculator](https://github.com/ThatOneCalculator) - and [all contributors](https://github.com/hyprwm/Hyprland/graphs/contributors) for making/contributing to the really awesome and cool desktop environment hyprland. Thank you to [dylanaraps](https://github.com/dylanaraps) for pywal and neofetch.
