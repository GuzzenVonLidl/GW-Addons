
class arifle_MX_SW_F: Rifle_Base_F {
	modes[] = {"manual","Single","GW_FullAuto","GW_FullAuto_LMG"};
	class Single: Mode_SemiAuto {
		LMG_FIREMODE_SINGLE;
	};
	class GW_FullAuto: medium {
		LMG_FIREMODE_FULLAUTO_Medium;
	};
	class GW_FullAuto_LMG: medium {
		LMG_FIREMODE_FULLAUTO_LONG;
		showToPlayer = 0;
	};
};

class arifle_SPAR_02_base_F: Rifle_Base_F {
	modes[] = {"FullAuto","Single","GW_FullAuto_LMG"};
	class Single: Mode_SemiAuto {
		LMG_FIREMODE_SINGLE;
	};
	class FullAuto: Mode_FullAuto {
		LMG_FIREMODE_FULLAUTO_Medium;
	};
	class GW_FullAuto_LMG: fullauto_medium {
		LMG_FIREMODE_FULLAUTO_LONG;
		showToPlayer = 0;
	};
};

class LMG_03_base_F: Rifle_Base_F {
	modes[] = {"FullAutoFast","GW_FullAuto","GW_FullAuto_LMG"};
	class GW_FullAuto: short {
		LMG_FIREMODE_FULLAUTO_Medium;
		showToPlayer = 0;
	};
	class GW_FullAuto_LMG: medium {
		LMG_FIREMODE_FULLAUTO_LONG;
		showToPlayer = 0;
	};
};

class LMG_Mk200_F: Rifle_Base_F {
	modes[] = {"manual","GW_FullAuto","GW_FullAuto_LMG"};
	class GW_FullAuto: close {
		LMG_FIREMODE_FULLAUTO_Medium;
	};
	class GW_FullAuto_LMG: medium {
		LMG_FIREMODE_FULLAUTO_LONG;
		showToPlayer = 0;
	};
};

class LMG_Zafir_F: Rifle_Long_Base_F {
	modes[] = {"FullAuto","Single","GW_FullAuto_LMG"};
	class Single: Mode_SemiAuto {
		LMG_FIREMODE_SINGLE;
	};
	class FullAuto: Mode_FullAuto {
		LMG_FIREMODE_FULLAUTO_Medium;
	};
	class GW_FullAuto_LMG: FullAuto {
		LMG_FIREMODE_FULLAUTO_LONG;
		showToPlayer = 0;
	};
};

class MMG_01_base_F: Rifle_Long_Base_F {
	modes[] = {"manual","GW_FullAuto","GW_FullAuto_LMG"};
	class GW_FullAuto: short {
		LMG_FIREMODE_FULLAUTO_Medium;
	};
	class GW_FullAuto_LMG: medium {
		LMG_FIREMODE_FULLAUTO_LONG;
	};

};

class MMG_02_base_F: Rifle_Long_Base_F {
	modes[] = {"manual","GW_FullAuto","GW_FullAuto_LMG"};
	class GW_FullAuto: short {
		LMG_FIREMODE_FULLAUTO_Medium;
	};
	class GW_FullAuto_LMG: medium {
		LMG_FIREMODE_FULLAUTO_LONG;
	};
};
