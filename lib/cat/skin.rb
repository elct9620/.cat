require 'sassc'
require 'cat/skin_node'

module Cat
  class Skin
    def initialize
      @base_style = %{
body {
  background-color: $bgColor;
}

@keyframes rotating {
  from {
    transform: rotate(0deg);
  }

  to {
    transform: rotate(720deg);
  }
}

@keyframes speedup {
  0% {
    transform: rotate(0deg);
  }

  75% {
    transform: rotate(280deg)
  }

  100% {
    transform: rotate(360deg);
  }
}
      }

      @variables  = {
        'bgColor': "rgb(230, 220, 220)"
      }
    end

    def var(name, value)
      @variables[name] = value
    end

    def variables
      @variables.map {|key, value|
        "$#{key}:#{value};"
      }.join("\n")
    end

    def style
      variables + @base_style
    end

    def generate(from: nil)
      _style = style
      _style << from.skins unless from.nil?
      SassC::Engine.new(_style).render
    end
  end
end
