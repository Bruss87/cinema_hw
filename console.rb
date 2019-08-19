require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')


film1 = Film.new({
   'title' => 'Ocean\'s Eleven',
   'price' => 6
 })

film1.save()

film2 = Film.new({
   'title' => 'John Wick',
   'price' => 5
 })

film2.save()

film3 = Film.new({
   'title' => 'Fast and Furious 8',
   'price' => 8
   })

film3.save()

film4 = Film.new({
   'title' => 'Once upon a time in Hollywood',
   'price' => 6
   })

film4.save()

film5 = Film.new({
   'title' => 'Batman Begins',
   'price' => 10
 })

film5.save

customer1 = Customer.new({
  'name' => 'Mark',
  'funds' => 30
  })

customer1.save

customer2 = Customer.new({
  'name' => 'John',
  'funds' => 45
  })

customer2.save

customer3 = Customer.new({
  'name' => 'Nicky',
  'funds' => 50
  })

customer3.save

customer4 = Customer.new({
  'name' => 'Monica',
  'funds' => 30
  })

customer4.save

customer5 = Customer.new({
  'name' => 'Gemma',
  'funds' => 25
  })

customer5.save

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film3.id
  })

ticket1.save

ticket2 = Ticket.new({
  'customer_id' => customer5.id,
  'film_id' => film2.id
  })

ticket2.save

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })

  ticket3.save

ticket4 = Ticket.new({
    'customer_id' => customer2.id,
    'film_id' => film2.id
    })

ticket4.save

ticket5 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket5.save


binding.pry
nil
