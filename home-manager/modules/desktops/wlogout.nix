{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "swaylock";
        "keybind" = "l";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "keybind" = "r";
      }
      {
        "label" = "logout";
        "action" = "loginctl terminate-user $USER";
        "keybind" = "e";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "keybind" = "s";
      }
    ];
    style = ''
      * {
          background-image: none;
          transition: 20ms;
          box-shadow: none;
      }

      window {
          backdrop-filter: blur(6px);
      }

      button {
          color: #cad3f5;
          background-color: #1e2030;
          background-position: center;
          background-repeat: no-repeat;
          background-size: 20%;
          border: none;
      	  border-radius: 10px;
      	  outline-style: none;
      }

      /* options */ 
      #lock {
          background-color: #1e2030;
          background-image: image(url("~/nix/assets/wlogout/lock.png"));
          border-radius: 5px 0px 0px 0px;
          margin : 100px 0px 0px 550px;
      }

      #reboot {
          background-color:#2b2e49;
      	  background-image: image(url("~/nix/assets/wlogout/reboot.png"));
      	  border-radius: 0px 0px 0px 5px;
          margin : 0px 0px 100px 550px;
      }

      #logout {
          background-color:#323764;
      	  background-image: image(url("~/nix/assets/wlogout/logout.png"));
      	  border-radius: 0px 5px 0px 0px;
          margin : 100px 550px 0px 0px;
      }

      #shutdown {
          background-color:rgb(43, 52, 134);
      	  background-image: image(url("~/nix/assets/wlogout/shutdown.png"));
      	  border-radius: 0px 0px 5px 0px;
          margin : 0px 550px 100px 0px;
      }

      /* options on hover */ 
      button:hover {
          background-size: 25%;
      }

      button:hover#lock {
          border-radius: 10px 10px 0px 10px;
          margin : 80px 0px 0px 530px;
      }

      button:hover#reboot {
          border-radius: 10px 0px 10px 10px;
          margin : 0px 0px 80px 530px;
      }

      button:hover#logout {
          border-radius: 10px 10px 10px 0px;
          margin : 80px 530px 0px 0px;
      }

      button:hover#shutdown {
          border-radius: 0px 10px 10px 10px;
          margin: 0px 530px 80px 0px;
      }

    '';
  };
}
