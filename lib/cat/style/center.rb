module Cat
  module Style
    class Center
      def to_s
        %{
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
        }
      end
    end
  end
end
