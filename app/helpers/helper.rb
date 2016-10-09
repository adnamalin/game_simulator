helpers do

  def weapon_creator(weapon_choice, params)
    details = details_mapper(params)
    weapon_matcher = {
      "Axe" => Axe,
      "Mace" => Mace,
      "Sword" => Sword
    }
    weapon_matcher[weapon_choice].new(details)
  end

  def details_mapper(original_params)
    percent = percent_to_float_convertor(original_params[:element_boost_percent])
    {
      min_dmg: params[:min_damage].to_i,
      max_dmg: params[:max_damage].to_i,
      element_boost_amt: percent,
      element_type: :"#{params[:element_type]}",
      str_modifer: params[:str_modifier].to_i
    }
  end

  def percent_to_float_convertor(percentage)
    percentage.to_f/100
  end

end
