helpers do
  def weapon_creator(weapon_choice, params)
    percent = (params[:element_boost_percent].to_f/100)
    details = {min_dmg: params[:min_damage].to_i, max_dmg: params[:max_damage].to_i, element_boost: {type: :"#{params[:element_type]}", percent: percent} ,str_modifer: params[:str_modifier].to_i}

    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p params[:element_boost_percent]
    p percent

    case params[:weapon]
    when "Axe"
      weapon = Axe.new(details)
    when "Mace"
      weapon = Mace.new(details)
    when "Sword"
      weapon = Sword.new(details)
    end
    weapon
  end

end
