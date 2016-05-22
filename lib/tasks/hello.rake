task :hello, [:name] do |t, args|
  puts "Hello, #{args[:name]}"
end
