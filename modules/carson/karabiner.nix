{
  flake.modules.darwin.carson = {
    homebrew.casks = ["karabiner-elements"];

    hjem.users.carson.xdg.config.files."karabiner/karabiner.json" = {
      clobber = true;
      text = builtins.toJSON {
        profiles = [
          {
            name = "Default profile";
            selected = true;
            complex_modifications.rules = [
              {
                description = "Caps Lock: Escape when tapped, Control when held";
                manipulators = [
                  {
                    type = "basic";
                    from = {
                      key_code = "caps_lock";
                      modifiers.optional = ["any"];
                    };
                    to = [
                      {
                        key_code = "left_control";
                        lazy = true;
                      }
                    ];
                    to_if_alone = [{key_code = "escape";}];
                    parameters.basic.to_if_alone_timeout_milliseconds = 200;
                  }
                ];
              }
            ];
          }
        ];
      };
    };
  };
}
