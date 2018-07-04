require 'pry'

class Pokemon
  @@all = []
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all = self

  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    array = []
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    poke = Pokemon.new(id: array[0][0], name: array[0][1], type: array[0][2], db: db)
  end
  # def alter_hp(hp, db)
  #   id = @id
  #   arr = []
  #   arr = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, id)
  #   # binding.pry
  # end

end
