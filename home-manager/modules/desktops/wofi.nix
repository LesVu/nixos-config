{
  programs.wofi = {
    enable = true;
    settings = {
      prompt = "";
      hide_scroll = true;
    };
    style = ''
      @define-color surface0 #363a4f;
      @define-color text #cad3f5;
      @define-color peach #f5a97f;
      @define-color mauve #c6a0f6;

      *{
        border: none;
        box-shadow: none;
        outline: none;
      }

      window {
        font-size: 14px;
        font-family: "Roboto";
        background-color: @surface0;
        border-radius: 8px;
        opacity: 0.90;
      }

      #outer-box {
        margin: 10px 10px 20px 10px;
        background-color: @surface0;
        opacity: 0.90;
      }

      #inner-box {
        margin: 10px;
        background-color: @surface0;
        opacity: 0.90;
      }

      #entry {
        padding: 5px 10px;
        border-radius: 20px;
      }

      #entry #text {
        padding: 0px 0px 0px 10px;
        font-weight: normal;
        color: @text;
      }

      #entry:selected {
        background-color: @peach;
      }

      #entry:selected #text {
        padding: 0px 0px 0px 10px;
        font-weight: normal;
        color: @mauve;
      }

      #input {
        background: transparent;
        margin: 0px 5px 0px 20px;
        color: @text;
        padding: 5px;
      }

      #image {
        margin-left: 20px;
        margin-right: 20px;
      }

      #scroll {
        margin: 0px;
      }
    '';
  };
}
