module Cat
  class Server
    def self.call(env)
      return [404, {"Content-Type" => "text/plain"}, ["No cats found"]] if env['PATH_INFO'] != "/"

      @last_update ||= Time.now
      @cat_update = File.mtime(Cat.config_file)
      if @cat_update > @last_update
        load Cat.config_file
        @last_update = @cat_update
      end

      [
        200,
        {"Content-Type" => "text/html"},
        [Cat.to_html]
      ]
    end
  end
end
