require 'cat/skeleton'
require 'cat/skin'

module Cat
  class Engine
    def initialize
      @skin = Skin.new
      @skeleton = Skeleton.new(@skin)
    end

    def skeleton(skeleton = nil, &block)
      @skeleton = skeleton unless  skeleton.nil?
      @skeleton.update(&block) if block_given?
    end

    def skin(&block)
      @skin.instance_eval(&block)
    end

    def to_html
      @skeleton.generate
    end

    def to_css
      @skin.generate(from: @skeleton)
    end
  end
end
