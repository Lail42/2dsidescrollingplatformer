/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 124BE232
/// @DnDComment : 1 would be pressing right$(13_10)-1 would be pressing left $(13_10)0 would be no input
/// @DnDDisabled : 1
/// @DnDArgument : "expr" "keyboard_check(vk_right) - keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"


/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 17922BDA
/// @DnDDisabled : 1
/// @DnDArgument : "expr" "move_x*walk_speed"
/// @DnDArgument : "var" "move_x"


/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 29A1FE42
/// @DnDComment : If we are on the Ground
/// @DnDArgument : "x" "x + (30 * sign(move_x))"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "obj_floor"
/// @DnDSaveInfo : "object" "obj_floor"
var l29A1FE42_0 = instance_place(x + (30 * sign(move_x)), y + 2, [obj_floor]);
if ((l29A1FE42_0 > 0))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 46285BF3
	/// @DnDComment : jump
	/// @DnDParent : 29A1FE42
	/// @DnDArgument : "expr" "-jump_speed"
	/// @DnDArgument : "var" "move_y"
	move_y = -jump_speed;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 11986AC7
	/// @DnDComment : flip movement direction
	/// @DnDParent : 29A1FE42
	/// @DnDArgument : "expr" "move_x * -1"
	/// @DnDArgument : "var" "move_x"
	move_x = move_x * -1;

	/// @DnDAction : YoYo Games.Collisions.If_Object_At
	/// @DnDVersion : 1.1
	/// @DnDHash : 3EC80C88
	/// @DnDParent : 29A1FE42
	/// @DnDArgument : "x" "x + (25 * sign(move_x))"
	/// @DnDArgument : "y" "y + 50"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "target" ""
	/// @DnDArgument : "object" "obj_floor"
	/// @DnDSaveInfo : "object" "obj_floor"
	var l3EC80C88_0 = instance_place(x + (25 * sign(move_x)), y + y + 50, [obj_floor]);
	if ((l3EC80C88_0 > 0))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1A84CC61
		/// @DnDParent : 3EC80C88
		/// @DnDArgument : "expr" "move_x * -1"
		/// @DnDArgument : "var" "move_x"
		move_x = move_x * -1;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5502CD45
		/// @DnDComment : Jump!
		/// @DnDParent : 3EC80C88
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 3984B0E0
/// @DnDComment : if your not on$(13_10) the ground
else
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4546E5A3
	/// @DnDComment : if we are falling $(13_10)after a jump
	/// @DnDParent : 3984B0E0
	/// @DnDArgument : "var" "move_y"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "10"
	if(move_y < 10)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 64D4A2F9
		/// @DnDComment : add gravity
		/// @DnDParent : 4546E5A3
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "move_y"
		move_y += 1;
	}
}

/// @DnDAction : YoYo Games.Movement.move_and_collide
/// @DnDVersion : 1
/// @DnDHash : 27904228
/// @DnDComment : 1st object is$(13_10)object to avoid$(13_10)
/// @DnDArgument : "xvel" "move_x"
/// @DnDArgument : "yvel" "move_y"
/// @DnDArgument : "maxxmove" "walk_speed"
/// @DnDArgument : "maxymove" "jump_speed"
/// @DnDArgument : "object" "obj_floor"
/// @DnDSaveInfo : "object" "obj_floor"
move_and_collide(move_x, move_y, obj_floor,4,0,0,walk_speed,jump_speed);