require 'cat/style/ellipse'
require 'cat/style/mask'
require 'cat/style/fill'
require 'cat/style/center'
require 'cat/style/size'
require 'cat/style/stroke'
require 'cat/style/rotate'
require 'cat/style/clip'
require 'cat/style/position'
require 'cat/style/offset'
require 'cat/style/rounded'
require 'cat/style/animation'

module Cat
  class SkinNode
    def initialize(name, &block)
      @name = name
      @styles = ["box-sizing: border-box;"]
      instance_eval(&block) if block_given?
    end

    def include_children(items)
      items.map { |node| node.skin }.join("\n")
    end

    def ellipse
      @styles << Style::Ellipse.new
      self
    end

    def fill(color)
      @styles << Style::Fill.new(color)
      self
    end

    def center
      @styles << Style::Center.new
      self
    end

    def size(width, height = nil)
      @styles << Style::Size.new(width, height)
      self
    end

    def stroke(width = nil, color: nil, only: [:top, :right, :bottom, :left])
      @styles << Style::Stroke.new(width, color, only)
      self
    end

    def mask(size)
      @styles << Style::Mask.new(size)
      self
    end

    def rotate(deg)
      @styles << Style::Rotate.new(deg)
      self
    end

    def clip(mode = true)
      @styles << Style::Clip.new
      self
    end

    def position(top: nil, right: nil, bottom: nil, left: nil)
      @styles << Style::Position.new(top: top, right: right, bottom: bottom, left: left)
      self
    end

    def offset(amount, direction = :top)
      @styles << Style::Offset.new(amount, direction)
      self
    end

    def rounded(top: nil, right: nil, bottom: nil, left: nil)
      @styles << Style::Rounded.new(top: top, right: right, bottom: bottom, left: left)
      self
    end

    def animation(name = :rotating)
      @styles << Style::Animation.new(name)
      self
    end

    def to_s
      @styles.join("\n")
    end

    def expand(with: [])
      %{
.#{@name} {
  #{to_s}
  #{include_children(with)}
}
      }
    end
  end
end
