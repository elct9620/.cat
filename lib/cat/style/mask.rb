module Cat
  module Style
    class Mask
      def initialize(size)
        @size = size
        @size = "#{@size}%" if @size.is_a?(Integer)
      end

      def to_s
        %{
position: absolute;
width: #{@size};
height: #{@size};
border-radius: 100% 0 0 0;
transform-origin: right bottom;
background-color: $bgColor;
        }
      end
    end
  end
end

