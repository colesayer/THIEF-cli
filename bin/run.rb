require_relative '../config/environment'

thief = Thief.new("Vince")

system "clear"
welcome 
display_museum 
context
choose_gadgets
enter_num
select_five_gadgets 

system "clear"
entrypoint_description 
input = get_entrypoint
system "clear"
scaffolding_entry
current_obstacle = get_obstacle 

until obstacle_overcome?(current_obstacle)
	selection = select_gadget_for_obstacle 
	if selection.is_a?(String) && selection.downcase == "none"
		use_base_stats(thief, current_obstacle)
		break
	else 
		current_obstacle = find_working_gadget(selection) 
	end 
end 

enter_new_corridor(current_obstacle)
input = get_user_input 
artwork_left = Artwork.all.sample 
artwork_right = Artwork.all.sample

if input.downcase.split.include?("left")
	corridor_left(artwork_left)
elsif input.downcase.split.include?("right")
	corridor_right(artwork_right)
end 

until input.downcase.split.include?("forward")
	input = corridor_decision(artwork_left, artwork_right)
end 



