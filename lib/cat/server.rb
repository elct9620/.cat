module Cat
  class Server
    ACCEPT_PATH = ["/", "/skin.css"]

    def self.call(env)
      return [404, {"Content-Type" => "text/plain"}, ["No cats found"]] unless ACCEPT_PATH.include?(env['PATH_INFO'])

      @last_update ||= Time.now
      @cat_update = File.mtime(Cat.config_file)
      if @cat_update > @last_update
        load Cat.config_file
        @last_update = @cat_update
      end

      case env['PATH_INFO']
      when "/" then response_skeleton
      when "/skin.css" then response_skin
      end
    end

    def self.response_skeleton
      [
        200,
        {"Content-Type" => "text/html"},
        [Cat.to_html]
      ]
    end

    def self.response_skin
      [
        200,
        {"Content-Type" => "text/css"},
        [Cat.to_css]
      ]
    end
  end
end
