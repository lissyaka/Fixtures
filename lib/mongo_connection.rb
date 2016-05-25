require "mongo"
require "singleton"

class MongoConnection
  attr_reader :db
  include Singleton

  def initialize
    @db = Mongo::Client.new(["localhost:27017"], :database => "myfixtures")
  end
end
