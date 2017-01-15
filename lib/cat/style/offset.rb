module Cat
  module Style
    class Offset
      def initialize(amount, direction)
        @direction = direction
        @direction = :top unless [:top, :left, :right, :bottom].include?(@direction)

        @amount = amount.to_i
        @amount = "#{amount}px" if @amount.is_a?(Integer)
        @amount = "0px" unless (@amount =~ /px|%|em|rem$/) > 0
      end

      def to_s
        "margin-#{@direction}: #{@amount};"
      end
    end
  end
end
