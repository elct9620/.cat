require 'sassc'
require 'cat/skin_node'

module Cat
  class Skin
    def initialize
      @base_style = %{
body {
  background-color: $bgColor;
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
