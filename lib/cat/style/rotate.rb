module Cat
  module Style
    class Rotate
      def initialize(deg)
        @deg = "#{deg.to_i}deg"
      end

      def to_s
        "transform: rotate(#{@deg});"
      end
    end
  end
end
