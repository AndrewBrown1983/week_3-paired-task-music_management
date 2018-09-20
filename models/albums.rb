require("pg")
require_relative("../db/sql_runner")

class Album

  attr_accessor :id, :album_name, :genre, :artist_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @album_name = options["album_name"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i

  end

  def save()
    sql = "INSERT INTO albums (album_name, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING *"
    values = [@album_name, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

def self.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
end

def self.list_names()
  sql = "SELECT album_name FROM albums"
  result = SqlRunner.run(sql)
  return result.map{|result_hash| Album.new(result_hash)}
end

def artist_belonging_to_albums()
  sql = "SELECT * FROM artist WHERE id = $1"
  values = [@customer_id]
    result = sql_runner.run(sql, values)
  return Artist.new(reult[0])
end
end
