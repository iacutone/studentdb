# config.ru

require "./app.rb"

class ContentType
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    puts "Hello from ContentType"

    # TODO: Add "Content-Type" to the HTTP
    #       headers and return the response.
    
  end
end

class FinishSentence
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    puts "Hello from FinishSentence"

    # TODO: Add " world!" to the HTTP
    #       body and return the response.
    
  end
end

use Rack::ContentLength

# TODO: Tell the app to use the "ContentType"
#       and "FinishSentence" middleware.

run MyApp.new
