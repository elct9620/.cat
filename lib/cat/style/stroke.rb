module Cat
  module Style
    class Stroke
      def initialize(width, color = nil, only = [:top, :right, :bottom, :left])
        @width = width || '3'
        @color = color || 'black'
        @only = only

        @width = "#{@width}px" if @width.is_a?(Integer)
        @width = '3px' unless (@width =~ /px|%|em|rem$/) > 0
      end

      def to_s
        @only.map { |direction| "border-#{direction}: #{@width} solid #{@color};" }.join("\n")
      end
    end
  end
end
