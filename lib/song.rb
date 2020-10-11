class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(sname)
    song = Song.new
    song.name = sname
    song
  end

  def self.create_by_name(sname)
    song = Song.create
    song.name = sname
    song
  end

  def self.find_by_name(name)
    @@all.find {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    find = self.find_by_name(name)
    create = self.create_by_name(name)
    if find 
      find
    else
      create
    end
  end

  def self.alphabetical
    @@all.sort_by {|names| names.name}
  end

  def self.new_from_filename(title)
    titles = title.split(" - ")
    sname = titles[1].gsub(".mp3","")
    artist = titles[0]
    song = Song.new
    song.name = sname
    song.artist_name = artist
    song
  end

  def self.create_from_filename(title)
    titles = title.split(" - ")
    sname = titles[1].gsub(".mp3","")
    artist = titles[0]
    song = Song.create
    song.name = sname
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all = []
  end
end
