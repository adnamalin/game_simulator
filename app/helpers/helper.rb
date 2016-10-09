helpers do

  def warrior_creator(params)
    details = weapon_details_mapper(params)
    Object.const_get(params[:warrior]).new(details)
  end

  def weapon_details_mapper(original_params)
    {level: params[:level].to_i}
  end

  def weapon_creator(params)
    details = weapon_details_mapper(params)
    Object.const_get(params[:weapon]).new(details)
  end

  def weapon_details_mapper(original_params)
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
