require("pg")
require_relative("../db/sql_runner")

class Artist
  attr_reader :id, :artist_name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @artist_name = options["artist_name"]
  end

def save()
  sql = "INSERT INTO artists (artist_name)
  VALUES ($1)
  RETURNING id"
  values = [@artist_name]

  result = SqlRunner.run(sql, values)
  return result[0]["id"].to_i

end

def self.delete_all()
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)

end

def self.list_names()
  sql = "SELECT artist_name FROM artists"
  result = SqlRunner.run(sql)
  return result.map{|result_hash| Artist.new(result_hash)}
end

def albums_belonging_to_artist()
  sql = "SELECT * FROM albums WHERE customer_id = $1"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map{|results_hash| Album.new(results_hash)}
end

end
