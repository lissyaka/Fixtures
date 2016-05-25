require "./lib/mongo_connection"

class ActiveRecord
  attr_reader :db

  def initialize
    @db = MongoConnection.send(:new).db
  end

  def model_name
    @db[:model_name]
  end

  def set
    model_name.insert_one({ :name => 'Depeche Mode' })
  end

  def get
    model_name.with(:read => { :mode => :primary_preferred }).find.to_a
  end

  def save
  end

  def find
  end
end
