get '/' do
  redirect '/calculate/new'
end

get '/calculate/new' do
  erb :'/calculate/new'
end

post '/calculate' do
  @warrior = warrior_creator(params)
  @weapon = weapon_creator(params)
  @results = AttackReportGenerator.all_attack_results(@warrior, @weapon)
  if request.xhr?
    erb :'/calculate/results', locals: {warrior: @warrior, weapon: @weapon, results: @results}, layout: false
  else
    erb :'/calculate/results', locals: {warrior: @warrior, weapon: @weapon, results: @results}
  end
end
