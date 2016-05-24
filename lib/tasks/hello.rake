require './lib/factories/model_factory'

task :hello, [:model_name] do |t, args|
  p Application.new(args[:model_name]).run
end
