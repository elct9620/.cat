module Cat
  class SkeletonNode
    INDENT_SYMBOL = "\t"

    def initialize(name = "cat", &block)
      @nodes = []
      @class = name
      @body = nil
      @skin = SkinNode.new(name)
      instance_eval(&block) if block_given?
    end

    def body
      return if @body.nil?
      " #{@body}"
    end

    def to_s
      ".#{@class}#{body}"
    end

    def node(name, &block)
      @nodes << SkeletonNode.new(name, &block)
    end

    def skin(&block)
      if block_given?
        @skin.instance_eval(&block)
      else
        @skin.expand(with: @nodes)
      end
    end

    def expand(indent = 2)
      [
        INDENT_SYMBOL * indent + to_s,
        @nodes.map { |node| node.expand(indent + 1) }.join("\n")
      ].join("\n")
    end

    def method_missing(name, *args, &block)
      return @skin.send(name, *args, &block) if @skin.methods.include?(name)
      super
    end
  end
end
