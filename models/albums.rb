require("pg")
require_relative("../db/sql_runner")

class Album

  attr_reader :id, :album_name, :genre, :artist_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @album_name = options["album_name"]
    @year = options["year"].to_i
  end

  def save()
    sql = "INSERT INTO albums (album_name, year)
    VALUES ($1, $2) RETURNING id"
    values = [@album_name, @year]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end



end
