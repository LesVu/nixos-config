{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        spacing = 0;

        modules-left = [
          "custom/appmenu"
          "wlr/workspaces"
        ];

        modules-center = [
          "wlr/taskbar"
        ];

        modules-right = [
          "pulseaudio"
          "backlight"
          "bluetooth"
          "network"
          "battery"
          "power-profiles-daemon"
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
        tooltip-format = "{title}";
        on-click = "activate";
        on-click-middle = "close";
        ignore-list = [
          "Alacritty"
          "Kitty"
        ];
        app_ids-mapping = {
          firefoxdeveloperedition = "firefox-developer-edition";
        };
        rewrite = {
          "Firefox Web Browser" = "Firefox";
        };
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

      clock = {
        format = "  {:%H:%M}";
        on-click = "chromium calendar.google.com";
        timezone = "Asia/Singapore";
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
        interval = 5;
        format = "{icon}";
        tooltip-format = "Battery Capacity: {capacity}%\n{timeTo}";
        format-charging = "{icon}  +";
        format-plugged = "";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
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
          default = [
            ""
            ""
            ""
          ];
        };
        on-click = "pavucontrol";
      };

      bluetooth = {
        format = "";
        format-disabled = "";
        format-off = "";
        format-no-controller = "";
        tooltip-format = "Bluetooth: {status}";
        interval = 30;
        on-click = "kitty bluetoothctl";
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
      @define-color rosewater #f4dbd6;
      @define-color flamingo #f0c6c6;
      @define-color pink #f5bde6;
      @define-color mauve #c6a0f6;
      @define-color red #ed8796;
      @define-color maroon #ee99a0;
      @define-color peach #f5a97f;
      @define-color yellow #eed49f;
      @define-color green #a6da95;
      @define-color teal #8bd5ca;
      @define-color sky #91d7e3;
      @define-color sapphire #7dc4e4;
      @define-color blue #8aadf4;
      @define-color lavender #b7bdf8;
      @define-color text #cad3f5;
      @define-color subtext1 #b8c0e0;
      @define-color subtext0 #a5adcb;
      @define-color overlay2 #939ab7;
      @define-color overlay1 #8087a2;
      @define-color overlay0 #6e738d;
      @define-color surface2 #5b6078;
      @define-color surface1 #494d64;
      @define-color surface0 #363a4f;
      @define-color base #24273a;
      @define-color mantle #1e2030;
      @define-color crust #181926;

      * {
        font-family: Roboto, "Roboto Mono Nerd Font";
        font-size: 1.15rem;
      }

      window#waybar {
        margin: 0.15rem 0.25rem;
        background: transparent;
      }

      tooltip {
        padding: 1rem;
        background: @surface0;
        border-radius: 1rem;
      }

      tooltip label {
        color: @text;
      }

      /* Global Same Option */
      .module {
        margin: 0.15rem;
        border-radius: 0.375rem;
        background: @surface0;
      }

      #custom-appmenu,
      #custom-exit,
      #power-profiles-daemon,
      #backlight,
      #pulseaudio {
        padding: 0px 14px 0px 10px;
      }

      #bluetooth,
      #bluetooth.on,
      #bluetooth.connected,
      #clock,
      #network {
        padding: 0px 10px;
      }

      #bluetooth.no-controller,
      #bluetooth.off,
      #taskbar.empty {
        background: transparent;
        border: none;
      }

      #workspaces {
        margin: 2px 18px 3px 2px;
        padding: 0px 2px;
        color: #ffffff;
        font-weight: bold;
      }

      #workspaces button {
        margin: 3px 2px;
        padding: 0px 6px;
        color: @lavender;
        background: #06111f;
        border-radius: 3px;
        transition: all 0.1s linear;
      }

      #workspaces button.active {
        color: @sky;
        background: #06111f;
        border-radius: 3px;
        min-width: 30px;
        transition: all 0.1s linear;
      }

      #workspaces button:hover {
        color: @sapphire;
        background: #06111f;
      }

      #taskbar {
        margin: 3px 15px 3px 0px;
        border: 3px solid #ffffff;
      }

      #taskbar button {
        padding: 0px 5px;
      }

      #custom-appmenu {
        color: @flamingo;
      }

      #custom-notification {
        color: @lavender;
      }

      #custom-exit {
        color: @peach;
      }

      #power-profiles-daemon {
        color: @teal;
      }

      #clock {
        color: @green;
      }

      #backlight {
        color: @mantel;
      }

      #pulseaudio {
        color: @rosewater;
      }

      #pulseaudio.muted {
        color: @red;
      }

      #network {
        color: @mauve;
      }

      #bluetooth,
      #bluetooth.on,
      #bluetooth.connected {
        color: @pink;
      }

      #battery {
        padding: 0px 17px 0px 10px;
        color: @yellow;
      }

      #battery.charging,
      #battery.plugged {
        padding: 0px 8px 0px 10px;
        color: @green;
      }

      @keyframes blink {
        to {
          color: @yellow;
        }
      }

      #battery.critical:not(.charging) {
        color: @red;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };
}
