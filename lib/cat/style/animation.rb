module Cat
  module Style
    class Animation
      def initialize(name)
        @name = name
      end

      def to_s
        %{
animation-name: #{@name};
animation-duration: 2.79s;
animation-direction: reverse;
animation-iteration-count: infinite;
animation-timing-function: linear;
        }
      end
    end
  end
end
