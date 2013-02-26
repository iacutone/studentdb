# app.rb

class MyApp
  def call(env)
    puts "Hello from MyAPP"
    return [200, {}, ["Hello"]]
  end
end
