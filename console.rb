require('pry')
require_relative('models/film')

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

binding.pry
nil
