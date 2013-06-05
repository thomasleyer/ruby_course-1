class Song

  attr_accessor :title, :duration
  
  @@songs_played = []

  def initialize(title, duration)
    @stopped = true
    @title = title
    @duration = duration
    puts "Song intialized"
  end

  def self.load_all
    puts "Loading"
  end

  def self.songs_played
    @@songs_played
  end

  def play
    if(@stopped)
      puts "Playing #{@title}"
      @stopped = false 
      @@songs_played << self
    else
      puts "We're already running."
    end
  end

  def stop
      if !@stopped
        puts "Stopping #{@title}"
        @stopped = true
      else
        puts "Nothing is running."
      end
  end

  def duration_in_minutes
    @duration / 60.0
  end

end
