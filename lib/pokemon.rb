require 'pry'

class Pokemon

  @@all = []

  attr_accessor :name, :type, :db, :id, :hp

  def initialize (id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    find = db.execute(sql, id)
    Pokemon.new(id: find[0][0], name: find[0][1], type: find[0][2], hp: find[0][3], db: db)
  end

  def alter_hp(hp, db)
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    db.execute(sql, hp, @id)
  end

end
