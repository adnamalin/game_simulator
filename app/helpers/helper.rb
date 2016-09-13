helpers do

  def weapon_creator(weapon_choice, params)
    percent = (params[:element_boost_percent].to_f/100)
    details = {min_dmg: params[:min_damage].to_i, max_dmg: params[:max_damage].to_i, element_boost: {type: :"#{params[:element_type]}", percent: percent} ,str_modifer: params[:str_modifier].to_i}
    weapon_matcher = {
      "Axe" => Axe.new(details),
      "Mace" => Mace.new(details),
      "Sword" => Sword.new(details)
    }
    weapon = weapon_matcher[weapon_choice]
  end

end
