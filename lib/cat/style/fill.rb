module Cat
  module Style
    class Fill
      def initialize(color)
        @color = color
        @color = "black" unless (color =~ /^\$|#|rgb/) >= 0
      end

      def to_s
        "background: #{@color};"
      end
    end
  end
end
