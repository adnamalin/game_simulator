get '/' do
  redirect '/calculate/new'
end

get '/calculate/new' do
  erb :'/calculate/new'
end

post '/calculate' do
  @warrior = Lena.new(level: params[:level].to_i)
  @weapon = weapon_creator(params[:weapon], params)
  @results = AttackCalculator.attack_results(@warrior, @weapon)
  if request.xhr?
    erb :'/calculate/results', locals: {warrior: @warrior, weapon: @weapon, results: @results}, layout: false
  else
    erb :'/calculate/results', locals: {warrior: @warrior, weapon: @weapon, results: @results}
  end
end
