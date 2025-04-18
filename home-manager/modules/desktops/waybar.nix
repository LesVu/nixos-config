{
  programs.waybar = {
    enable = true;
    settings =
      {
        mainBar = {
          layer = "top";
          margin = "2px 4px";
          spacing = 0;

          modules-left = [
            "custom/appmenu"
            "wlr/workspaces"
            "custom/empty"
          ];

          modules-center = [
            "wlr/taskbar"
            "custom/empty"
          ];

          modules-right = [
            "pulseaudio"
            "backlight"
            "bluetooth"
            "network"
            "battery"
            "power-profiles-daemon"
            "tray"
            "custom/notification"
            "clock"
            "custom/exit"
          ];
        };

        "wlr/workspaces" = {
          on-click = "activate";
          active-only = false;
          all-outputs = true;
          format = "{}";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
        };

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 18;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [ "Alacritty" "kitty" ];
          app_ids-mapping = {
            firefoxdeveloperedition = "firefox-developer-edition";
          };
          rewrite = {
            "Firefox Web Browser" = "Firefox";
            "Foot Server" = "Terminal";
          };
        };

        "custom/empty" = {
          format = "";
        };

        "custom/appmenu" = {
          format = "󰔷";
          on-click = "sleep 0.2;pkill wofi || wofi -show drun -replace";
          tooltip-format = "Left: Open the application launcher";
        };

        "custom/exit" = {
          format = "";
          on-click = "wlogout";
          on-click-right = "swaylock";
          tooltip-format = "Left: Power menu\nRight: Lock screen";
        };

        "custom/notification" = {
          tooltip-format = "Left: Notifications\nRight: Do not disturb";
          format = "{icon}";
          format-icons = {
            notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            none = "";
            dnd-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            dnd-none = "";
            inhibited-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        clock = {
          format = "{:%H:%M %a}";
          on-click = "chromium calendar.google.com";
          timezone = "";
          tooltip = false;
        };

        network = {
          format = "{ifname}";
          format-wifi = "   {essid}";
          format-ethernet = "󰈀  {ifname}";
          format-disconnected = "Disconnected ⚠";
          tooltip-format = "{ifname}\nIP: {ipaddr}\n : {bandwidthUpBits}  : {bandwidthDownBits}";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
          on-click = "kitty nmtui";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          tooltip-format = "Battery Capacity: {capacity}%\n{timeTo}";
          format-charging = "{icon} +";
          format-plugged = "";
          format-icons = [ " " " " " " " " " " ];
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "󰜥";
            power-saver = "";
          };
        };

        pulseaudio = {
          format = "{icon}";
          tooltip-format = "Volume: {volume}%\nName: {desc}";
          format-bluetooth = "";
          format-bluetooth-muted = "󰗿";
          format-muted = "󰖁";
          format-icons = {
            headphone = "";
            headset = "󱡏";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        bluetooth = {
          format = "";
          format-disabled = "";
          format-off = "";
          tooltip-format = "Bluetooth On";
          interval = 30;
          on-click = "kitty bluetoothctl";
          format-no-controller = "";
        };

        backlight = {
          format = "{icon}";
          tooltip-format = "{icon}  Brightness: {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          scroll-step = 1;
        };
      };
    style = ''
      * {
        font-family: "Roboto Mono Nerd Font", Roboto, Arial, sans-serif;
        border: none;
        border-radius: 0px;
      }

      window#waybar {
        background: transparent;
        transition-property: background-color;
        transition-duration: .5s;
      }

      /* -----------------------------------------------------
       * Workspaces
       * ----------------------------------------------------- */

      #workspaces {
        background: #06111f;
        margin: 2px 18px 3px 2px;
        padding: 0px 2px;
        border-radius: 5px 5px 5px 5px;
        font-weight: bold;
        font-style: normal;
        opacity: 0.8;
        color: #ffffff;
      }

      #workspaces button {
        padding: 0px 6px;
        margin: 3px 2px;
        border-radius: 3px 3px 3px 3px;
        color: #ffffff;
        background-color: #06111f;
        transition: all 0.1s linear;
        opacity: 0.4;
      }

      #workspaces button.active {
        color: #ffffff;
        background: #06111f;
        border-radius: 3px 3px 3px 3px;
        min-width: 30px;
        transition: all 0.1s linear;
        opacity: 1.0;
      }

      #workspaces button:hover {
        color: #ffffff;
        background: #06111f;
        border-radius: 5px 5px 5px 5px;
        opacity: 0.7;
      }

      /* -----------------------------------------------------
       * Tooltips
       * ----------------------------------------------------- */

      tooltip {
        border-radius: 16px;
        background-color: #000000;
        opacity: 0.9;
        padding: 20px;
        margin: 0px;
      }

      tooltip label {
        color: #ffffff;
      }

      /* -----------------------------------------------------
       * Taskbar
       * ----------------------------------------------------- */

      #taskbar {
        background: #ffffff;
        margin: 3px 15px 3px 0px;
        padding: 0px;
        border-radius: 5px 5px 5px 5px;
        font-weight: normal;
        font-style: normal;
        opacity: 0.8;
        border: 3px solid #ffffff;
      }

      #taskbar button {
        margin: 0;
        border-radius: 5px 5px 5px 5px;
        padding: 0px 5px 0px 5px;
      }

      #taskbar.empty {
        background: transparent;
        border: 0;
        padding: 0;
        margin: 0;
      }

      /* -----------------------------------------------------
       * Modules
       * ----------------------------------------------------- */

      .modules-left>widget:first-child>#workspaces {
        margin-left: 0;
      }

      .modules-right>widget:last-child>#workspaces {
        margin-right: 0;
      }

      /* -----------------------------------------------------
       * Custom Modules
       * ----------------------------------------------------- */

      #custom-appmenu {
        background-color: #06111f;
        font-size: 16px;
        color: #ffffff;
        border-radius: 5px;
        padding: 0px 14px 0px 10px;
        margin: 2px;
        opacity: 0.8;
        /* border: 3px solid #06111f; */
      }

      /* -----------------------------------------------------
       * Custom Notification
       * ----------------------------------------------------- */

      #custom-notification {
        margin: 0px 13px 0px 0px;
        /* padding: 0px 0px 0px 6px; */
        font-size: 20px;
        color: #06111f;
        opacity: 0.8;
      }

      /* -----------------------------------------------------
       * Custom Exit
       * ----------------------------------------------------- */

      #custom-exit {
        padding: 0px 14px 0px 10px;
        margin: 2px;
        background: #06111f;
        border-radius: 5px;
        font-size: 16px;
        color: #ffffff;
        opacity: 0.8;
      }

      /* -----------------------------------------------------
       * Power Profiles Daemon
       * ----------------------------------------------------- */

      #power-profiles-daemon {
        margin: 2px;
        padding: 0px 11px 0px 4px;
        font-size: 16px;
        color: #ffffff;
      }

      /* -----------------------------------------------------
       * Clock
       * ----------------------------------------------------- */

      #clock {
        background-color: #06111f;
        font-size: 16px;
        color: #ffffff;
        border-radius: 5px;
        padding: 0px 10px;
        margin: 2px;
        opacity: 0.8;
        /* border: 3px solid #06111f; */
      }

      /* -----------------------------------------------------
       * Backlight
       * ----------------------------------------------------- */

      #backlight {
        background-color: #06111f;
        font-size: 16px;
        color: #ffffff;
        border-radius: 5px;
        padding: 0px 11px 0px 10px;
        margin: 2px;
        opacity: 0.8;
      }

      /* -----------------------------------------------------
       * Pulseaudio
       * ----------------------------------------------------- */

      #pulseaudio {
        background-color: #06111f;
        font-size: 16px;
        color: #ffffff;
        border-radius: 5px;
        padding: 0px 14px 0px 10px;
        margin: 2px;
        opacity: 0.8;
      }

      #pulseaudio.muted {
        background-color: #06111f;
        color: #ffffff;
      }

      /* -----------------------------------------------------
       * Network
       * ----------------------------------------------------- */

      #network {
        background-color: #06111f;
        font-size: 16px;
        color: #ffffff;
        border-radius: 5px;
        padding: 0px 10px;
        margin: 2px;
        opacity: 0.8;
      }

      /* -----------------------------------------------------
       * Bluetooth
       * ----------------------------------------------------- */

      #bluetooth,
      #bluetooth.on,
      #bluetooth.connected {
        background-color: #06111f;
        font-size: 16px;
        color: #ffffff;
        border-radius: 5px;
        padding: 0px 10px;
        margin: 2px;
        opacity: 0.8;
      }

      #bluetooth.off {
        background-color: transparent;
        padding: 0px;
        margin: 0px;
      }

      /* -----------------------------------------------------
       * Battery
       * ----------------------------------------------------- */

      #battery {
        background-color: #06111f;
        font-size: 16px;
        color: #ffffff;
        border-radius: 5px;
        padding: 0px 7px 0px 10px;
        margin: 2px;
        opacity: 0.8;
      }

      #battery.charging,
      #battery.plugged {
        color: #ffffff;
        background-color: #06111f;
      }

      @keyframes blink {
        to {
          background-color: #06111f;
          color: #ffffff;
        }
      }

      #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      /* -----------------------------------------------------
       * Tray
       * ----------------------------------------------------- */

      #tray {
        padding: 0px 15px 0px 0px;
      }

      #tray>.passive {
        -gtk-icon-effect: dim;
      }

      #tray>.needs-attention {
        -gtk-icon-effect: highlight;
      }    
    '';
  };
}
