#include "script_component.hpp"

/*
	Textures sourced from:
	R3F Uniforms		http://www.armaholic.com/page.php?id=24727
	CAF Mod				http://www.armaholic.com/page.php?id=19420
*/

class CfgPatches {
	class ADDON {
		author = "GuzzenVonLidl";
		name = "GW - Retexturing Component";
		url = "https://github.com/GuzzenVonLidl/";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"GW_main", "CBA_common", "A3_UI_F"};
		version = VERSION;
		authors[] = {"GuzzenVonLidl"};
	};
};

class CfgVehicles {
	class B_APC_Wheeled_01_base_F;
	class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
		scope = 2;
		class TextureSources {
			class DefaultCamo {
				author = "Bohemia Interactive";
				displayName = "Default";
				factions[] = {"BLU_F"};
				textures[] = {
					"a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_base_co.paa",
					"a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_adds_co.paa",
					"a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_tows_co.paa"
				};
			};
			class WoodlandCamo {
				author = "GuzzenVonLidl";
				displayName = "Woodland Camo";
				factions[] = {"BLU_F"};
				textures[] = {
					QPATHTOF(B_APC_Wheeled_01\apc_wheeled_01_base_co_fr.paa),
					QPATHTOF(B_APC_Wheeled_01\apc_wheeled_01_adds_co_fr.paa),
					QPATHTOF(B_APC_Wheeled_01\apc_wheeled_01_tows_co_fr.paa)
				};
			};
		};
	};

	class I_APC_Wheeled_03_base_F;
	class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
		scope = 2;
		class TextureSources {
			class DefaultCamo {
				author = "Bohemia Interactive";
				displayName = "Default";
				factions[] = {"IND_F"};
				textures[] = {
					"A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_INDP_CO.paa",
					"A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext2_INDP_CO.paa",
					"A3\armor_f_gamma\APC_Wheeled_03\data\RCWS30_INDP_CO.paa",
					"A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa"
				};
			};
			class DesertCamo {
				author = "GuzzenVonLidl";
				displayName = "Desert Camo";
				factions[] = {"IND_F"};
				textures[] = {
					"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext_co.paa",
					"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext2_co.paa",
					"a3\armor_f_gamma\apc_wheeled_03\data\rcws30_co.paa",
					"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext_alpha_co.paa"
				};
			};
		};
	};

	class I_APC_tracked_03_base_F;
	class I_APC_tracked_03_cannon_F: I_APC_tracked_03_base_F {
		scope = 2;
		class TextureSources {
			class DefaultCamo {
				author = "Bohemia Interactive";
				displayName = "Default Camo";
				factions[] = {"IND_F"};
				textures[] = {
					"A3\armor_f_epb\apc_tracked_03\data\apc_tracked_03_ext_indp_co.paa",
					"a3\armor_f_epb\apc_tracked_03\data\apc_tracked_03_ext2_indp_co.paa"
				};
			};
			class DesertCamo {
				author = "Grace";
				displayName = "Desert Camo";
				factions[] = {"IND_F"};
				textures[] = {
					QPATHTOF(I_APC_tracked_03_cannon_F\apc_tracked_03_ext_uk_co.paa),
					QPATHTOF(I_APC_tracked_03_cannon_F\apc_tracked_03_ext2_uk_co.paa)
				};
			};
			class WoodlandCamo {
				author = "Grace";
				displayName = "Woodland Camo";
				factions[] = {"IND_F"};
				textures[] = {
					QPATHTOF(I_APC_tracked_03_cannon_F\apc_tracked_03_ext_uk_co_wd.paa),
					QPATHTOF(I_APC_tracked_03_cannon_F\apc_tracked_03_ext2_uk_co_wd.paa)
				};
			};
		};
	};

	class I_MBT_03_base_F;
	class I_MBT_03_cannon_F: I_MBT_03_base_F {
		scope = 2;
		class TextureSources {
			class DefaultCamo {
				author = "Bohemia Interactive";
				displayName = "Default";
				factions[] = {"IND_F"};
				textures[] = {
					"a3\armor_f_epb\mbt_03\data\mbt_03_ext01_co.paa",
					"a3\armor_f_epb\mbt_03\data\mbt_03_ext02_co.paa",
					"a3\armor_f_epb\mbt_03\data\mbt_03_rcws_co.paa"
				};
			};
			class WoodlandCamo {
				author = "GuzzenVonLidl";
				displayName = "Woodland Camo";
				factions[] = {"IND_F"};
				textures[] = {
					QPATHTOF(I_MBT_03\mbt_03_can01_co.paa),
					QPATHTOF(I_MBT_03\mbt_03_can02_co.paa),
					QPATHTOF(I_MBT_03\mbt_03_can_rcws_co.paa),
					QPATHTOF(I_MBT_03\mbt_03_can02_co.paa),
					QPATHTOF(I_MBT_03\mbt_03_can02_co.paa),
					QPATHTOF(I_MBT_03\mbt_03_track_co.paa),
					QPATHTOF(I_MBT_03\mbt_03_track_co.paa)
				};
			};
		};
	};

	class Heli_Transport_02_base_F;
	class I_Heli_Transport_02_F: Heli_Transport_02_base_F {
		scope = 2;
		class TextureSources {
			class DefaultCamo {
				author = "Bohemia Interactive";
				displayName = "Default";
				factions[] = {"IND_F"};
				textures[] = {
					"A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_1_INDP_CO.paa",
					"A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_2_INDP_CO.paa",
					"A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_3_INDP_CO.paa",
					"A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_int_02_CO.paa"
				};
			};
			class WoodlandCamo {
				author = "GuzzenVonLidl";
				displayName = "Woodland Camo";
				factions[] = {"IND_F"};
				textures[] = {
					QPATHTOF(Heli_Transport_02\heli_transport_02_1_R3F_co.paa),
					QPATHTOF(Heli_Transport_02\heli_transport_02_2_R3F_co.paa),
					QPATHTOF(Heli_Transport_02\heli_transport_02_3_R3F_co.paa)
				};
			};
		};
	};

	class Plane_Fighter_03_base_F;
	class Plane_Fighter_03_dynamicLoadout_base_F: Plane_Fighter_03_base_F {
		scope = 2;
		class TextureSources {
			class DefaultCamo {
				author = "Bohemia Interactive";
				displayName = "Default";
				factions[] = {"IND_F"};
				textures[] = {
					"A3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_1_INDP_co.paa",
					"A3\Air_F_Gamma\Plane_Fighter_03\Data\Plane_Fighter_03_body_2_INDP_co.paa"
				};
			};
			class WoodlandCamo {
				author = "GuzzenVonLidl";
				displayName = "Woodland Camo";
				factions[] = {"IND_F"};
				textures[] = {
					QPATHTOF(plane_fighter_03\plane_fighter_03_body_1_R3F_co.paa),
					QPATHTOF(plane_fighter_03\plane_fighter_03_body_2_R3F_co.paa)
				};
			};
		};
	};
};
