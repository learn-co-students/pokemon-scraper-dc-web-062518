require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id, :hp
  @@all = []

  def initialize(id:, name:, type:, hp: nil, db:)
    @hp = hp
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    find = db.execute(sql, id)
    Pokemon.new(id: find[0][0], name: find[0][1], type: find[0][2], hp: find[0][3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  end
end
