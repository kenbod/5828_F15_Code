if __FILE__ == $0

  t = Thread.new {
    puts "Hello from new thread"
  }

  Thread.pass

  puts "Hello from main thread"

  t.join

end
