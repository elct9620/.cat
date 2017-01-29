require 'slim'
require 'cat/skeleton_node'

module Cat
  class Skeleton
    def initialize(skin, &block)
      @skin = skin
      @node = SkeletonNode.new("cat", &block)
    end

    def update(&block)
      @node = SkeletonNode.new("cat", &block)
    end

    def skins
      @node.skin
    end

    def cat
      @node.expand
    end

    def generate
      Slim::Template.new {
        %{
html
  head
    title Loading Cat
    link(href="skin.css" rel="stylesheet")
  body
#{cat}
      }
      }.render
    end
  end
end
