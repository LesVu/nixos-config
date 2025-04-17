{
  programs.wofi = {
    enable = true;
    settings = {
      prompt = "";
      hide_scroll = true;
    };
    style = ''
      #input {
          border-radius: 0px;
      }
      #inner-box {
          padding: 5px;
          border-radius: 10px;
      }   
      #box{
          margin: 5px;
      }
      *{
        font-family: DaddyTimeMono Nerd Font;
      }
    '';
  };
}
