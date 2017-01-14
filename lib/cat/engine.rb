require 'slim'

module Cat
  class Engine
    def to_html
      Slim::Template.new { "html\n\tbody\n\t\tp Hello Cat" }.render
    end
  end
end
