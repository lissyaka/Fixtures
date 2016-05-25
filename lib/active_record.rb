require "./lib/mongo_connection"

class ActiveRecord
  attr_reader :db

  def initialize
    @db = MongoConnection.send(:new)
  end

  def set
  end

  def get
  end

  def save

  end

  def find
  end
end
