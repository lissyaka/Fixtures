Dir["./models/*.rb"].each {|file| require file }
# require "./models/post"
# require "./models/user"
# class ModelFactory
#   def self.create(model_name)
#     if ["user.json", "post.json", "user.ini", "post.ini"].include?(model_name)
#       self.class.const_get(model_name[0..(model_name.index(".") - 1)].to_s.capitalize).new
#     else
#       raise "Unknown model name or format"
#     end
#   end
# end
class ModelFactory
  def create
    raise NotImplementedError, "#{self.class.name} does not implement create()"
  end

end

class PostFactory < ModelFactory
  def create
    Post.new
  end
end

class UserFactory < ModelFactory
  def create
    User.new
  end
end

class Application
  def initialize(model_name)
    if ["user", "post"].include?(model_name.split(".")[0]) && ["ini", "json"].include?(model_name.split(".")[1])
      @model_factory = self.class.const_get(model_name[0..(model_name.index(".") - 1)].to_s.capitalize + "Factory").new
    else
      raise "Unknown model name or format"
    end
  end

  def run
    @model_factory.create
  end
end
