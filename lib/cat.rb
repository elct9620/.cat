require "cat/version"
require 'cat/engine'

module Cat
  def self.instance
    @instance ||= Cat::Engine.new
  end

  def self.summon(&block)
    Cat.instance.instance_eval(&block)
  end

  def self.config_file(catfile = nil)
    return @catfile || File.join(Dir.pwd, "cat.rb") if catfile.nil?
    @catfile = File.join(Dir.pwd, catfile)
  end

  def self.to_html
    Cat.instance.to_html
  end
end
