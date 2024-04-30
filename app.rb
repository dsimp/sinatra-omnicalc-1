require "sinatra"
require "sinatra/reloader"

get("/square/new") do
  erb(:square)
end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/result") do
  @number = params.fetch("user_number").to_f
  @the_result = @number ** 2
 erb(:square_result)
end

get("/square_root/new") do
  erb(:square_root )
end

get("/square_root/result") do
  @number_square = Math.sqrt(params.fetch("user_square_root").to_f)
  erb(:square_root_result)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/result") do
  @r = (params.fetch("user_APR").to_f/100)/12
  @rate = @r.to_fs(:percentage, { :precision => 4 } )
  @n = params.fetch("user_years").to_i * 12
  @numerator = @r * params.fetch("user_present").to_f
  @denominator = 1 - (1 + @r)**-@n
  @pay = (@numerator/@denominator).to_fs(:currency)
  erb(:payment_result)
end

get("/random/new") do
  erb(:random)
end

get("/random/result") do
  @min = params.fetch("minimum").to_i
  @max = params.fetch("maximum").to_i
  @rando = rand(@min..@max).to_f
  erb(:random_result)
end
