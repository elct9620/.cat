module Cat
  module Style
    class Position
      def initialize(top: nil, right: nil, bottom: nil, left: nil)
        @top = validate(top)
        @right = validate(right)
        @bottom = validate(bottom)
        @left = validate(left)
      end

      def validate(value)
        return nil if value.nil?
        return "#{value}px" if value.is_a?(Integer)
        return "0px" unless (value =~ /px|%|em|rem$/) > 0
        value
      end

      def to_s
        %{
position: absolute;
#{@top ? "top: #{@top};" : ""}
#{@right ? "right: #{@right};" : ""}
#{@bottom ? "bottom: #{@bottom};" : ""}
#{@left ? "left: #{@left};" : ""}
        }
      end
    end
  end
end
