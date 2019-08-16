require_relative("../db/sql_runner")

class Film
  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO films (title, price)
    VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)
    @id = film[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM films"
    result = SqlRunner.run(sql)
    result.map{ |film| Film.new(film) }
  end

  def update
    sql = "UPDATE films
    SET (title, price) = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM films
    WHERE id = $1
    RETURNING title"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customer
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN"
  end



















end
