/// @DnDAction : YoYo Games.Movement.Jump_To_Start
/// @DnDVersion : 1
/// @DnDHash : 54179712
/// @DnDComment : place the buttomn back where it started $(13_10)when this alarm is called 
x = xstart;
y = ystart;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 2AB0ED74
/// @DnDArgument : "steps" "10"
alarm_set(0, 10);