# Make JSON module available
require 'json'

# Import spotify.json and changes.json into Ruby hash variables
# ARGV[0] is the first param passed from the command line when running the program
# ARGV[1] is the second param passed from the command line when running the program
spotify_data = JSON.parse(File.read(ARGV[0]))
changes_data = JSON.parse(File.read(ARGV[1]))

# Method for adding an existing song to an existing playlist
def add_song_to_playlist(data, song_id, playlist_id)
    # Find existing playlist
    playlist = data["playlists"].find { |p| p["id"] == playlist_id }
    # Add song to playlist
    playlist["song_ids"] << song_id
end

# Method for adding a new playlist for an existing user; the playlist should contain at least one existing song
def add_new_playlist(data, user_id, playlist_id, song_id)
    # Find existing user and song
    user = data["users"].find { |u| u["id"] == user_id }
    song = data["songs"].find { |s| s["id"] == song_id }
    # Create new playlist hash
    new_playlist = { "id" => (data["playlists"].size + 1).to_s, "owner_id" => user_id, "song_ids" => [song["id"]] }
    # Add new playlist
    data["playlists"] << new_playlist
end

# Method to remove an existing playlist
def remove_playlist(data, playlist_id)
  data["playlists"].delete_if { |p| p["id"] == playlist_id }
end

# Apply changes from changes.json to imported spotify_data
changes_data.each do |k,v|
    # Evaluate each key to determine type of action to perform
    case k
    when "add_song_to_playlist"
        v.each do |change|
            add_song_to_playlist(spotify_data, change["song_id"], change["playlist_id"])
        end
    when "add_new_playlist"
        v.each do |change|
            add_new_playlist(spotify_data, change["user_id"], change["playlist_id"], change["song_id"])
        end
    when "remove_playlist"
        v.each do |change|
            remove_playlist(spotify_data, change["playlist_id"])
        end
    end
end

# Export modified spotify data to output.json file
# ARGV[2] is the third param passed from the command line when running the program
File.open(ARGV[2],"w") do |f|
  f.write(JSON.pretty_generate(spotify_data))
end
