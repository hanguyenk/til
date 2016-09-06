## Adapter pattern

`Adapter pattern` works as a bridge between two incompatible interfaces. This type of design pattern comes under `structural pattern` as this pattern combines the capability of two independent interfaces.

This pattern involves a single class which is responsible to join functionalities of independent or incompatible interfaces.

### Implementation

Create interfaces for Media Player and Advance Media Player.

```ruby
# media_player.rb

class MediaPlayer
  def play(audio_type, file_name)
    raise NotImplementedYet
  end
end
```

```ruby
# advanced_media_player.rb

class AdvancedMediaPlayer
  def play_vlc(file_name)
    raise NotImplementedYet
  end

  def play_mp4(file_name)
    raise NotImplementedYet
  end
end
```

Create concrete classes implementing the `AdvancedMediaPlayer` interface.

```ruby
# vlc_player.rb

class VlcPlayer < AdvancedMediaPlayer
  def play_vlc(file_name)
    puts "Playing vlc file. Name: #{file_name}"
  end

  def play_mp4(file_name)
  end
end
```

```ruby
# mp4_player.rb

class Mp4Player < AdvancedMediaPlayer
  def play_vlc(file_name)
  end

  def play_mp4(file_name)
    puts "Playing mp4 file. "
  end
end
```

Create adapter class implementing the `MediaPlayer` interface.

```ruby
# media_adapter.rb

class MediaAdapter < MediaPlayer
  attr_reader :advanced_music_player

  def initialize(audio_type)
    case audio_type
    when 'vlc'
      @advanced_music_player = VlcPlayer.new
    when 'mp4'
      @advanced_music_player = Mp4Player.new
    end
  end

  def play(audio_type, file_name)
    case audio_type
    when 'vlc'
      advanced_music_player.play_vlc(file_name)
    when 'mp4'
      advanced_music_player.play_mp4(file_name)
    end
  end
end
```

Create concrete class implementing the `MediaPlayer` interface.

```ruby
# audio_player.rb

class AudioPlayer < MediaPlayer
  def play(audio_type, file_name)
    if audio_type.eql? 'mp3'
      puts "Playing mp3 file. Name: #{file_name}"
    elsif audio_type.eql?('vlc') || audio_type.eql?('mp4')
      media_adapter = MediaAdapter.new(audio_type)
      media_adapter.play(audio_type, file_name)
    else
      puts "Invalid media. #{audio_type} format not supported"
    end
  end
end
```

Use the `AudioPlayer` to play different types of audio formats.

```ruby
audio_player = AudioPlayer.new
audio_player.play("mp3", "beyond the horizon.mp3");
audio_player.play("mp4", "alone.mp4");
audio_player.play("vlc", "far far away.vlc");
audio_player.play("avi", "mind me.avi")
```
