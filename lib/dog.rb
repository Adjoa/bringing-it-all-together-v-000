class Dog
  attr_accessor :name, :breed
  attr_reader :id

  def initialize(id: nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed
  end

  def create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS dogs")
  end

  def self.find_or_create_by(name:, album:)
  song = DB[:conn].execute("SELECT * FROM songs WHERE name = ? AND album = ?", name, album)
  if !song.empty?
    song_data = song[0]
    song = Song.new(song_data[0], song_data[1], song_data[2])
  else
    song = self.create(name: name, album: album)
  end
  song
  end
  
end
