module Cat
  module Style
    class Rounded < Position
      def to_s
        "border-radius: #{@top || 0} #{@right || 0} #{@bottom || 0} #{@left || 0};"
      end
    end
  end
end
