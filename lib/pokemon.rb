class Pokemon

attr_reader :name, :type, :db, :id
attr_accessor :hp

  @@all = []

  def initialize(name:, type:, db:, hp: 60, id:)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ?);", name, type)

    # var = @@all.select do |pokemon|
    #   pokemon.name == name
    # end
    # db.execute("INSERT INTO pokemon (id, name, type) VALUES ( ?, ?, ?);", var[0].id, var[0].name, var[0].type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
    var = Pokemon.new(id: id, name: pokemon_array[0][1], type: pokemon_array[0][2], hp: pokemon_array [0][3], db: db)
    var
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, @id)
    @hp = new_hp
  end

end
