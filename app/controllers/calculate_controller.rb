get '/calculate/new' do
  erb :'/calculate/new'
end

# {"level"=>"10", "weapon"=>"Axe", "min_damage"=>"50", "max_damage"=>"65", "str_modifier"=>"20", "element_type"=>"fire", "element_boost_percent"=>"10"}

post '/calculate' do
  @warrior = Lena.new(level: params[:level].to_i)
  @weapon = weapon_creator(params[:weapon], params)
  @results = @warrior.attack_results(@weapon)
  if request.xhr?
    erb :'/calculate/results', locals: {warrior: @warrior, weapon: @weapon, results: @results}, layout: false
  else
    erb :'/calculate/results', locals: {warrior: @warrior, weapon: @weapon, results: @results}
  end
end
