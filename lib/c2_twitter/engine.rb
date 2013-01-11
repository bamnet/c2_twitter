module C2Twitter
  class Engine < ::Rails::Engine
    isolate_namespace C2Twitter

    initializer "register content type" do |app|
      app.config.content_types << Twitter
    end
  end
end
