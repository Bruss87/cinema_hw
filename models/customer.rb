require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customers = SqlRunner.run(sql, values)
    @id = customers[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    customers.map{ |customer| Customer.new(customer)}
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    film_data.map { |film| Film.new(film) }
  end

  def tickets_count
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@id]
    ticket_data = SqlRunner.run(sql, values)
    return ticket_data.map.count{|ticket| Ticket.new(ticket)}
  end

  def film_price
    sql = "SELECT price FROM films
    WHERE id  = $1"
    values = [@id]
    price_data = SqlRunner.run(sql, values)
    return price_data[0]['price'].to_i
  end

  def funds
     price = self.film_price
     return @funds -= price
  end

end
