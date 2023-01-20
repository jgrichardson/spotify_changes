# Spotify Changes

This is a Ruby program that imports a list of users, songs, and playlists from a JSON file (spotify.json), applies a set of changes from another JSON file (changes.json), and exports the resulting JSON to an output file (output-file.json). 

The use cases / requirements for the program included:

* Adding an existing song to an existing playlist
* Adding a new playlist for an existing user; the playlist should contain at least one existing song
* Removing an existing playlist

## Technology / Prerequisites

* Ruby v2.5.8

## Time Spent

The amount of time spent writing this program, testing, and documenting it in this README was 1 hours, 45 minutes.

## Installation

Clone this repo into a folder on your local system.

``` git clone https://github.com/jgrichardson/spotify_changes.git ```

## Usage

Change directories to the cloned repo.

``` cd spotify_changes ```

Run the program from the command line, passing the name of the ruby program, the name of the input file, the name of the changes file, and the name of the output file.

``` ruby apply_changes.rb spotify.json changes.json output-file.json ```

After the program runs, inspect your output file to verify that the changes listed in your changes file were made correctly.

## To Do

1) Write a set of RSpec tests

2) Add error handling for the following cases:

* Command line paramaters (files) do not exist or are not readable / writable
* When adding an existing song to an existing playlist, the song ID or playlist ID provided does not exist
* When adding a new playlist for an existing user, the provided user ID does not exist
* When removing an existing playlist, the provided playlist ID doe not exist
* Move storage to a database so we can enforce relationships, integrity, validations, etc.

## Contributors

[Greg Richardson](https://github.com/jgrichardson)

## License

The source code for the application is licensed under the MIT license, which you can find in the LICENSE file in this repo.
