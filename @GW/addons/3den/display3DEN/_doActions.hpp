
class GW_genericObjects {
	text = "Generic Objects";
	items[] = {"GW_enableSimulation","GW_allowDamage","GW_hideObject"};
};

class GW_setObjects {
	text = "Objects Only";
	items[] = {"GW_simpleObject","GW_relativeObjects"};
};

class GW_setGroup {
	text = "Group Actions";
	items[] = {"GW_unitStance","GW_GarrisonBuildings","GW_createWaypoints"};
};

class GW_unitStance {
	items[] = {"GW_unitStance_up","GW_unitStance_middle","GW_unitStance_down","GW_unitStance_auto"};
	text = "Unit Stance";
};
class GW_unitStance_up {
	text = "Up";
	action = "[5, 0] call GW_3DEN_fnc_setAttribute;";
	shortcuts[] = {INPUT_CTRL_OFFSET + DIK_1};
	picture = "\a3\3den\Data\Attributes\Stance\up_ca.paa";
};
class GW_unitStance_middle {
	text = "Middle";
	action = "[5, 1] call GW_3DEN_fnc_setAttribute;";
	shortcuts[] = {INPUT_CTRL_OFFSET + DIK_2};
	picture = "\a3\3den\Data\Attributes\Stance\middle_ca.paa";
};
class GW_unitStance_down {
	text = "Down";
	action = "[5, 2] call GW_3DEN_fnc_setAttribute;";
	shortcuts[] = {INPUT_CTRL_OFFSET + DIK_3};
	picture = "\a3\3den\Data\Attributes\Stance\down_ca.paa";
};
class GW_unitStance_auto {
	text = "Auto";
	action = "[5, 3] call GW_3DEN_fnc_setAttribute;";
	shortcuts[] = {INPUT_CTRL_OFFSET + DIK_4};
};

class GW_GarrisonBuildings {
	action = "call GW_3den_fnc_garrisonNearest";
	Text = "Garrison Selected units *";
	picture = "\a3\3den\Data\CfgWaypoints\guard_ca.paa";
	shortcuts[] = {INPUT_CTRL_OFFSET + DIK_5};
};
class GW_createWaypoints {
	action = "call GW_3den_fnc_createWaypoints";
	Text = "Generate waypoints around group *";
	picture = "\a3\3den\Data\CfgWaypoints\cycle_ca.paa";
	shortcuts[] = {INPUT_CTRL_OFFSET + DIK_6};
};

class GW_enableSimulation {
	items[] = {"GW_enableSimulation_true","GW_enableSimulation_false"};
	text = "EnableSimulation";
};

class GW_enableSimulation_true {
	text = "True";
	action = "[1, true] call GW_3DEN_fnc_setAttribute;";
};
class GW_enableSimulation_false {
	text = "False";
	action = "[1, false] call GW_3DEN_fnc_setAttribute;";
};

class GW_allowDamage {
	items[] = {"GW_allowDamage_true","GW_allowDamage_false"};
	text = "AllowDamage";
};

class GW_allowDamage_true {
	text = "True";
	action = "[2, true] call GW_3DEN_fnc_setAttribute;";
};
class GW_allowDamage_false {
	text = "False";
	action = "[2, false] call GW_3DEN_fnc_setAttribute;";
};

class GW_hideObject {
	items[] = {"GW_hideObject_true","GW_hideObject_false"};
	text = "HideObject";
};

class GW_hideObject_true {
	text = "True";
	action = "[3, true] call GW_3DEN_fnc_setAttribute;";
};
class GW_hideObject_false {
	text = "False";
	action = "[3, false] call GW_3DEN_fnc_setAttribute;";
};

class GW_simpleObject {
	items[] = {"GW_simpleObject_true","GW_simpleObject_false"};
	text = "CreateSimpleObject";
};

class GW_simpleObject_True {
	text = "True";
	action = "[4, True] call GW_3DEN_fnc_setAttribute;";
};
class GW_simpleObject_false {
	text = "False";
	action = "[4, false] call GW_3DEN_fnc_setAttribute;";
};

class GW_relativeObjects {
	text = "Copy relative location of obj 2 from obj 1";
	action = "[0] call GW_3DEN_fnc_doAction";
};
