module Cat
  module Style
    class Size
      def initialize(width, height = nil)
        @width = width
        @height = height || width
        @width = "#{@width}px" if @width.is_a?(Integer)
        @height = "#{@height}px" if @height.is_a?(Integer)
        @width = '100px' unless (@width =~ /px|%|em|rem$/) > 0
        @height = '100px' unless (@height =~ /px|%|em|rem$/) > 0
      end

      def to_s
        %{
width: #{@width};
height: #{@height};
        }
      end
    end
  end
end

