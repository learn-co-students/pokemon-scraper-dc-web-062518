class Pokemon

attr_reader :id, :name, :type, :db
attr_accessor :hp

@@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db


    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    attributes = db.execute("SELECT * FROM pokemon WHERE id =?", [id_num])
    new_pokemon = Pokemon.new(id: attributes[0][0], name: attributes[0][1], type: attributes[0][2], db: db, hp: attributes[0][3])
  end

  def alter_hp (new_hp, db)
    update = db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_hp], self.id)
 #binding.pry
  end

end
