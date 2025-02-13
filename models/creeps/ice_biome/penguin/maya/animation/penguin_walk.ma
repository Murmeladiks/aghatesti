//Maya ASCII 2016R2 scene
//Name: penguin_walk.ma
//Last modified: Wed, Aug 02, 2017 04:21:41 PM
//Codeset: 1252
file -rdi 1 -ns "whiskey_the_stout_hex_rig" -rfn "whiskey_the_stout_hex_rigRN"
		 -op "v=0;" -typ "mayaAscii" "valve:///models/creeps/ice_biome/penguin/maya/penguin_rig.ma";
file -rdi 2 -ns "MDL" -rfn "whiskey_the_stout_hex_rig:MDLRN" -typ "mayaAscii"
		 "valve:///models/creeps/ice_biome/penguin/maya/penguin_model.ma";
file -rdi 3 -ns "whiskey_the_stout_color_vmat" -rfn "whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_color_vmatRN"
		 -typ "mayaAscii" "%VTOOLS%/maya/global/python/Materials/dota_hero_shaderfx.ma";
file -rdi 3 -ns "whiskey_the_stout_penguin_color_vmat" -rfn "whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_penguin_color_vmatRN"
		 -typ "mayaAscii" "%VTOOLS%/maya/global/python/Materials/dota_hero_shaderfx.ma";
file -rdi 1 -ns "whiskey_the_stout_penguin_color_vmat" -rfn "whiskey_the_stout_penguin_color_vmatRN"
		 -typ "mayaAscii" "%VTOOLS%/maya/global/python/Materials/dota_hero_shaderfx.ma";
file -r -ns "whiskey_the_stout_hex_rig" -dr 1 -rfn "whiskey_the_stout_hex_rigRN"
		 -op "v=0;" -typ "mayaAscii" "valve:///models/creeps/ice_biome/penguin/maya/penguin_rig.ma";
file -r -ns "whiskey_the_stout_penguin_color_vmat" -dr 1 -rfn "whiskey_the_stout_penguin_color_vmatRN"
		 -typ "mayaAscii" "%VTOOLS%/maya/global/python/Materials/dota_hero_shaderfx.ma";
requires maya "2016R2";
requires -nodeType "vsVmatToTex" "PVstVmatPlugin.py" "2.0";
requires -nodeType "vstExportNode" "PVstExportNode.py" "2.1.0";
requires "stereoCamera" "10.0";
requires "vstUtils" "1.0";
requires "vsMaster" "1.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2016";
fileInfo "version" "2016 Extension 2";
fileInfo "cutIdentifier" "201603022110-988944-2";
fileInfo "osv" "Microsoft Windows 8 Business Edition, 64-bit  (Build 9200)\n";
createNode transform -s -n "persp";
	rename -uid "96CC63A5-47F9-7475-B636-83B56EA8B7EC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 64.528618112134694 94.061788548884522 -131.73117953253092 ;
	setAttr ".r" -type "double3" -18.338352729926996 -1284.5999999999549 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "9BCA8F58-4EF0-5D48-8BE1-86A0FD234150";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 158.61350583779839;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "24FF33A8-4C87-0DA4-FEF0-6A8A925E36F3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "556366DE-41DB-0A7A-6A15-96AD8D6741F8";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "588F13C0-4667-DBDC-F824-2DA4BD477ACE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "95623FE8-4BEA-43D7-373A-EC866B8A0633";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "8C42BE3F-44D0-97D3-D733-10ADD37ABF03";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "8F81B20E-46B8-0253-540F-38BE9DBC990F";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "AE7653BC-4665-C063-D855-31BB0E1D20D7";
	setAttr -s 8 ".lnk";
	setAttr -s 8 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "9CF00A6E-48B3-2657-8E68-F3B8FB9D98D3";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "07D95D59-43EF-891C-1B7D-BE97BAC27AE0";
createNode displayLayerManager -n "layerManager";
	rename -uid "FFE69C1B-41D3-F525-5152-2890ABF91560";
createNode displayLayer -n "defaultLayer";
	rename -uid "80B0BDF8-443B-F080-8BC9-BD95D6004988";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "4FCF086F-4237-EF81-4B38-A9A30C6B488B";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "6E670207-42B0-BCEF-7CAF-5D9DC71CBE27";
	setAttr ".g" yes;
createNode reference -n "whiskey_the_stout_hex_rigRN";
	rename -uid "D71EE7A8-43E2-E233-0F2A-9BBC31C036DA";
	setAttr ".fn[0]" -type "string" "d:/dev/source2/main/content/dota/models/items/tuskarr/whiskey_the_stout/maya/whiskey_the_stout_hex_rig.ma";
	setAttr -s 87 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".phl[25]" 0;
	setAttr ".phl[26]" 0;
	setAttr ".phl[27]" 0;
	setAttr ".phl[28]" 0;
	setAttr ".phl[29]" 0;
	setAttr ".phl[30]" 0;
	setAttr ".phl[31]" 0;
	setAttr ".phl[32]" 0;
	setAttr ".phl[33]" 0;
	setAttr ".phl[34]" 0;
	setAttr ".phl[35]" 0;
	setAttr ".phl[36]" 0;
	setAttr ".phl[37]" 0;
	setAttr ".phl[38]" 0;
	setAttr ".phl[39]" 0;
	setAttr ".phl[40]" 0;
	setAttr ".phl[41]" 0;
	setAttr ".phl[42]" 0;
	setAttr ".phl[43]" 0;
	setAttr ".phl[44]" 0;
	setAttr ".phl[45]" 0;
	setAttr ".phl[46]" 0;
	setAttr ".phl[47]" 0;
	setAttr ".phl[48]" 0;
	setAttr ".phl[49]" 0;
	setAttr ".phl[50]" 0;
	setAttr ".phl[51]" 0;
	setAttr ".phl[52]" 0;
	setAttr ".phl[53]" 0;
	setAttr ".phl[54]" 0;
	setAttr ".phl[55]" 0;
	setAttr ".phl[56]" 0;
	setAttr ".phl[57]" 0;
	setAttr ".phl[58]" 0;
	setAttr ".phl[59]" 0;
	setAttr ".phl[60]" 0;
	setAttr ".phl[61]" 0;
	setAttr ".phl[62]" 0;
	setAttr ".phl[63]" 0;
	setAttr ".phl[64]" 0;
	setAttr ".phl[65]" 0;
	setAttr ".phl[66]" 0;
	setAttr ".phl[67]" 0;
	setAttr ".phl[68]" 0;
	setAttr ".phl[69]" 0;
	setAttr ".phl[70]" 0;
	setAttr ".phl[71]" 0;
	setAttr ".phl[72]" 0;
	setAttr ".phl[73]" 0;
	setAttr ".phl[74]" 0;
	setAttr ".phl[75]" 0;
	setAttr ".phl[76]" 0;
	setAttr ".phl[77]" 0;
	setAttr ".phl[78]" 0;
	setAttr ".phl[79]" 0;
	setAttr ".phl[80]" 0;
	setAttr ".phl[81]" 0;
	setAttr ".phl[82]" 0;
	setAttr ".phl[83]" 0;
	setAttr ".phl[84]" 0;
	setAttr ".phl[85]" 0;
	setAttr ".phl[86]" 0;
	setAttr ".phl[87]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"whiskey_the_stout_hex_rigRN"
		"whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_penguin_color_vmatRN" 0
		"whiskey_the_stout_hex_rigRN" 0
		"whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_color_vmatRN" 0
		"whiskey_the_stout_hex_rig:MDLRN" 0
		"whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_penguin_color_vmatRN" 2
		2 "whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx" 
		"shaderparams" " -type \"string\" \"fresnelWarpColor~278~fresnelWarpRim~278~fresnelWarpSpec~278~cubeMap~278~color~278~normal~278~specularMask~278~specularColor~319~specularExponent~317~specularScale~317~rimMask~278~rimLightColor~319~rimLightScale~317~selfIllumMask~278~translucency~278~metalnessMask~278~cubeMapScalar~317~\""
		
		5 3 "whiskey_the_stout_hex_rigRN" "whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.message" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[1]" ""
		"whiskey_the_stout_hex_rigRN" 165
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL" 
		"translate" " -type \"double3\" 0 0 86.666666666666671"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL" 
		"translateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL" 
		"translate" " -type \"double3\" 1.6 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL" 
		"translateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL" 
		"translateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL" 
		"rotate" " -type \"double3\" 9.1001335445918592 -7.529841924092783 2.3369922740066329"
		
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL|whiskey_the_stout_hex_rig:BodyOffsetAdj_NUL|whiskey_the_stout_hex_rig:Root_CTRL_HmNUL|whiskey_the_stout_hex_rig:Root_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Root_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Root_CTRL" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL" 
		"rotate" " -type \"double3\" 0 -14.265577233563977 25.085111882554635"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineRig_4_JNT|whiskey_the_stout_hex_rig:SpineRig_5_JNT|whiskey_the_stout_hex_rig:SpineChildPartParent_NUL|whiskey_the_stout_hex_rig:__MouthChain|whiskey_the_stout_hex_rig:MouthChainRig_HmNUL|whiskey_the_stout_hex_rig:MouthChainFK_HmNUL|whiskey_the_stout_hex_rig:MouthChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:MouthChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:MouthChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:MouthChainFK_0_CTRL" 
		"rotate" " -type \"double3\" 0 0 21.683503329264074"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL" 
		"translateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL" 
		"translateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL" 
		"translateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL" 
		"rotate" " -type \"double3\" 0 0 8.1084560385251905"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL" 
		"translateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL" 
		"translateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL" 
		"translateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL" 
		"rotate" " -type \"double3\" 0 0 -9.7508509452067162"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL" 
		"translateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL" 
		"translateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL" 
		"translateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL" 
		"rotate" " -type \"double3\" 0 0 -27.070432164475857"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL" 
		"translateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL" 
		"translateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL" 
		"translateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL" 
		"rotate" " -type \"double3\" 0 -3.311464751604619 -24.415989425366529"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL" 
		"translateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL" 
		"translateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL" 
		"translateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL" 
		"rotate" " -type \"double3\" 0 0 22.892442674267912"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL" 
		"translateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL" 
		"rotate" " -type \"double3\" -3.8294288271461974 0 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainRig_0_R_JNT|whiskey_the_stout_hex_rig:ArmChainFK_1_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_1_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_1_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_1_R_CTRL" 
		"rotate" " -type \"double3\" -22.318246727833145 21.416107111905607 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL" 
		"rotate" " -type \"double3\" -16.805707147853866 41.147506711289211 18.919156803031218"
		
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainRig_0_L_JNT|whiskey_the_stout_hex_rig:ArmChainFK_1_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_1_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_1_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_1_L_CTRL" 
		"rotate" " -type \"double3\" -22.318246727833145 21.416107111905607 0"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL" 
		"rotate" " -type \"double3\" -16.805707147853866 45.916016096997332 31.434343618168857"
		
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL" 
		"translate" " -type \"double3\" 0 3.6471999407416775 -2.5434609462308275"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL" 
		"translateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL" 
		"translateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL" 
		"translateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL" 
		"rotate" " -type \"double3\" 66.543473556160919 -47.34544529693661 -57.187195751126872"
		
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL" 
		"rotateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL" 
		"rotateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL" 
		"rotateZ" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL" 
		"translate" " -type \"double3\" 2.5 0 -6.2787437740983663"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL" 
		"translateX" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL" 
		"translateY" " -av"
		2 "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL" 
		"translateZ" " -av"
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[4]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[5]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[6]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[7]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[8]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[9]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[10]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[11]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[12]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[13]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[14]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:BodyOffsetNUL|whiskey_the_stout_hex_rig:Body_CTRL_HmNUL|whiskey_the_stout_hex_rig:Body_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:Body_CTRL_AnimNUL|whiskey_the_stout_hex_rig:Body_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[15]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[16]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[17]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[18]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[19]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[20]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE|whiskey_the_stout_hex_rig:__TailChain|whiskey_the_stout_hex_rig:TailChainRig_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:TailChainFK_0_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[21]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[22]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[23]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[24]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[25]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[26]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineRig_3_JNT|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_4_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[27]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[28]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[29]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[30]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[31]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[32]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineRig_2_JNT|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_3_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[33]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[34]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[35]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[36]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[37]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[38]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineRig_1_JNT|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_2_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[39]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[40]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[41]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[42]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[43]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[44]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineRig_0_JNT|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_1_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[45]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[46]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[47]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[48]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[49]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[50]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE1|whiskey_the_stout_hex_rig:__Spine|whiskey_the_stout_hex_rig:SpineRig_HmNUL|whiskey_the_stout_hex_rig:SpineFK_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_HmNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL_AnimNUL|whiskey_the_stout_hex_rig:SpineFK_0_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[51]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[52]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[53]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[54]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[55]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[56]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE2|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegBase_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_R_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_R_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_R_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_R_NUL|whiskey_the_stout_hex_rig:__RightFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_R_SDK|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_R_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_R_SDK|whiskey_the_stout_hex_rig:FootBall_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_R_SDK|whiskey_the_stout_hex_rig:FootInner_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_R_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_R_SDK|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_R_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_R_SDK|whiskey_the_stout_hex_rig:FootTip_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_R_CTRL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_R_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_R_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[57]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE3|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegBase_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_L_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_L_NUL|whiskey_the_stout_hex_rig:__LeftFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK|whiskey_the_stout_hex_rig:FootBall_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK|whiskey_the_stout_hex_rig:FootInner_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK|whiskey_the_stout_hex_rig:FootTip_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[58]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE3|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegBase_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_L_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_L_NUL|whiskey_the_stout_hex_rig:__LeftFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK|whiskey_the_stout_hex_rig:FootBall_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK|whiskey_the_stout_hex_rig:FootInner_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK|whiskey_the_stout_hex_rig:FootTip_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[59]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE3|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegBase_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_L_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_L_NUL|whiskey_the_stout_hex_rig:__LeftFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK|whiskey_the_stout_hex_rig:FootBall_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK|whiskey_the_stout_hex_rig:FootInner_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK|whiskey_the_stout_hex_rig:FootTip_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[60]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE3|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegBase_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_L_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_L_NUL|whiskey_the_stout_hex_rig:__LeftFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK|whiskey_the_stout_hex_rig:FootBall_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK|whiskey_the_stout_hex_rig:FootInner_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK|whiskey_the_stout_hex_rig:FootTip_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[61]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE3|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegBase_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_L_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_L_NUL|whiskey_the_stout_hex_rig:__LeftFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK|whiskey_the_stout_hex_rig:FootBall_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK|whiskey_the_stout_hex_rig:FootInner_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK|whiskey_the_stout_hex_rig:FootTip_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[62]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:pelvis__SURROGATE3|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegBase_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegBase_L_CTRL|whiskey_the_stout_hex_rig:LegBaseOffset_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverBase_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriverLimit_L_NUL|whiskey_the_stout_hex_rig:LegIKChildParentDriver_L_NUL|whiskey_the_stout_hex_rig:LegIkChildParent_L_NUL|whiskey_the_stout_hex_rig:__LeftFoot|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootBallHeelRollH_L_SDK|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootHeel_L_CTRL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToePivotTwist_L_SDK|whiskey_the_stout_hex_rig:FootBall_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootBall_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankOuter_L_SDK|whiskey_the_stout_hex_rig:FootInner_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootInner_L_CTRL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootSideToSideBankInner_L_SDK|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootOuter_L_CTRL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeRoll_L_SDK|whiskey_the_stout_hex_rig:FootTip_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootTip_L_CTRL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK_HmNUL|whiskey_the_stout_hex_rig:FootToeTip_L_SDK|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:FootIKToe_0_L_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[63]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[64]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[65]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[66]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[67]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[68]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE1|whiskey_the_stout_hex_rig:__RightArmChain|whiskey_the_stout_hex_rig:ArmChainRig_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_R_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_R_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[69]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[70]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[71]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[72]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[73]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[74]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__surrogates|whiskey_the_stout_hex_rig:spine_2__SURROGATE2|whiskey_the_stout_hex_rig:__LeftArmChain|whiskey_the_stout_hex_rig:ArmChainRig_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_L_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:ArmChainFK_0_L_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[75]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[76]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[77]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[78]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[79]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[80]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__RightLeg|whiskey_the_stout_hex_rig:LegRig_R_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_R_CTRL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_R_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[81]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL.rotateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[82]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL.rotateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[83]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL.rotateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[84]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL.translateX" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[85]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL.translateY" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[86]" ""
		5 4 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:WHISKEY_HEX|whiskey_the_stout_hex_rig:World_CTRL|whiskey_the_stout_hex_rig:Fly_CTRL_HmNUL|whiskey_the_stout_hex_rig:Fly_CTRL|whiskey_the_stout_hex_rig:Scale_CTRL_HmNUL|whiskey_the_stout_hex_rig:Scale_CTRL|whiskey_the_stout_hex_rig:Rig_NUL|whiskey_the_stout_hex_rig:__LeftLeg|whiskey_the_stout_hex_rig:LegRig_L_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegRevIK_L_CTRL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_HmNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_SpaceNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL_AnimNUL|whiskey_the_stout_hex_rig:LegIK_L_CTRL.translateZ" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[87]" ""
		"whiskey_the_stout_hex_rig:MDLRN" 4
		2 "whiskey_the_stout_hex_rig:MDL:JNT" "visibility" " 1"
		3 "|whiskey_the_stout_hex_rig:MDL:polySurface1|whiskey_the_stout_hex_rig:MDL:polySurface1Shape.instObjGroups" 
		"whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG.dagSetMembers" 
		"-na"
		5 3 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:MDL:polySurface1|whiskey_the_stout_hex_rig:MDL:polySurface1Shape.instObjGroups" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[2]" "whiskey_the_stout_hex_rig:MDL:whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG.dsm"
		
		5 3 "whiskey_the_stout_hex_rigRN" "|whiskey_the_stout_hex_rig:MDL:pelvis.message" 
		"whiskey_the_stout_hex_rigRN.placeHolderList[3]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "9C89AF24-4566-E1E5-016A-FA9725095AC6";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n"
		+ "                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n"
		+ "            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n"
		+ "            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n"
		+ "            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"vPlanarDisplay\" 1 \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            -pluginObjects \"vRigWidget\" 1 \n            -pluginObjects \"vChainDisplay\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n"
		+ "                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 638\n                -height 1252\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 638\n            -height 1252\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"vPlanarDisplay\" 1 \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            -pluginObjects \"vRigWidget\" 1 \n            -pluginObjects \"vChainDisplay\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n"
		+ "                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n"
		+ "                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n"
		+ "                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n"
		+ "            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"vPlanarDisplay\" 1 \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            -pluginObjects \"vRigWidget\" 1 \n            -pluginObjects \"vChainDisplay\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n"
		+ "                -useDefaultMaterial 1\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 0\n                -joints 0\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n"
		+ "                -particleInstancers 1\n                -fluids 0\n                -hairSystems 0\n                -follicles 0\n                -nCloths 0\n                -nParticles 0\n                -nRigids 0\n                -dynamicConstraints 0\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 0\n                -clipGhosts 0\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1300\n                -height 1252\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 1\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n"
		+ "            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 0\n            -joints 0\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nParticles 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 0\n            -clipGhosts 0\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1300\n            -height 1252\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "        modelEditor -e \n            -pluginObjects \"vPlanarDisplay\" 1 \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            -pluginObjects \"vRigWidget\" 1 \n            -pluginObjects \"vChainDisplay\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n"
		+ "                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -renderFilterIndex 0\n                -selectionOrder \"chronological\" \n                -expandAttribute 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n"
		+ "            -showShapes 0\n            -showAssignedMaterials 0\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n"
		+ "            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\toutlinerPanel -e -to $panelName;\n"
		+ "\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n"
		+ "                -showUpstreamCurves 0\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -selectionOrder \"display\" \n                -expandAttribute 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 0\n"
		+ "                -showCurveNames 0\n                -showActiveCurveNames 0\n                -clipTime \"off\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -outliner \"graphEditor1OutlineEd\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n"
		+ "                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 0\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n"
		+ "                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -selectionOrder \"display\" \n                -expandAttribute 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n"
		+ "                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 0\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -clipTime \"off\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -outliner \"graphEditor1OutlineEd\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n"
		+ "                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n"
		+ "                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -selectionOrder \"chronological\" \n                -expandAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 0\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n"
		+ "                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n"
		+ "                -selectionOrder \"chronological\" \n                -expandAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 0\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n"
		+ "                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n"
		+ "                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tshapePanel -unParent -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tposePanel -unParent -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels ;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"profilerPanel\" -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"contentBrowserPanel\" -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n"
		+ "                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\t}\n"
		+ "\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n"
		+ "                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n"
		+ "                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 33 100 -ps 2 67 100 $gMainPane;\"\n"
		+ "\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Side View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera side` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 0\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 638\\n    -height 1252\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"vPlanarDisplay\\\" 1 \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    -pluginObjects \\\"vRigWidget\\\" 1 \\n    -pluginObjects \\\"vChainDisplay\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera side` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 0\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 638\\n    -height 1252\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"vPlanarDisplay\\\" 1 \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    -pluginObjects \\\"vRigWidget\\\" 1 \\n    -pluginObjects \\\"vChainDisplay\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 1\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 0\\n    -joints 0\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nParticles 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 0\\n    -clipGhosts 0\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1300\\n    -height 1252\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"vPlanarDisplay\\\" 1 \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    -pluginObjects \\\"vRigWidget\\\" 1 \\n    -pluginObjects \\\"vChainDisplay\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 1\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 0\\n    -joints 0\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nParticles 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 0\\n    -clipGhosts 0\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1300\\n    -height 1252\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"vPlanarDisplay\\\" 1 \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    -pluginObjects \\\"vRigWidget\\\" 1 \\n    -pluginObjects \\\"vChainDisplay\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "FE704DBC-40C3-550C-37A5-1E8B6D964BDB";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 10 -ast 0 -aet 15 ";
	setAttr ".st" 6;
createNode animCurveTL -n "World_CTRL_translateX";
	rename -uid "17645E8E-44DB-1139-F0BF-B58F2C8C308B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 30 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "World_CTRL_translateY";
	rename -uid "B45A4650-4DBD-F0BB-3924-F7B367204E4F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 30 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "World_CTRL_translateZ";
	rename -uid "5DA43159-4E14-7E3A-F1EC-25924132BA32";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 30 325;
	setAttr ".pst" 3;
createNode animCurveTA -n "World_CTRL_rotateX";
	rename -uid "9307B2D0-4708-7B5E-0659-50A263A67D34";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 30 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "World_CTRL_rotateY";
	rename -uid "F742259F-4E83-A905-EA61-09B662581551";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 30 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "World_CTRL_rotateZ";
	rename -uid "1BBDA4C2-4D26-93B0-50A0-A69A6795E1AF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 30 0;
	setAttr ".pst" 3;
createNode reference -n "sharedReferenceNode";
	rename -uid "261506F4-4C8D-5790-5945-D282DC7D30D4";
	setAttr ".ed" -type "dataReferenceEdits" 
		"sharedReferenceNode";
createNode animCurveTL -n "LegIK_R_CTRL_translateX";
	rename -uid "33E333EB-4468-F4D0-57AD-10B026BB369E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -2.5 2 -2.5 3 -2.5 5 -2.5 7 -3.9229402834597757e-015
		 8 -3.4195927206258435e-015 10 -2.5;
	setAttr ".pst" 3;
createNode animCurveTL -n "LegIK_R_CTRL_translateY";
	rename -uid "E690CA26-490D-19E6-AE31-D3B9F8CDFCB3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 3.3486464921043338e-014 2 3.5707043745198775e-014
		 3 -7.6731639404433859e-015 5 3.6471999407416611 7 4.7459888676722368 8 3.6471999407416775
		 10 3.3486464921043338e-014;
	setAttr ".pst" 3;
createNode animCurveTL -n "LegIK_R_CTRL_translateZ";
	rename -uid "A11EE7EA-4B8E-42E3-39BF-46AB7A9FB940";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 7.7010953991880822 2 8.1607110294770635
		 3 -1.764646332728617 5 -6.2787437740983787 7 -4.7545205399623569 8 -2.5434609462308275
		 10 7.7010953991880822;
	setAttr ".pst" 3;
createNode animCurveTA -n "LegIK_R_CTRL_rotateX";
	rename -uid "A9126F79-4C28-6F34-8D9C-6BADB1A165F7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -41.507215834678249 2 0 3 0 5 64.132735922395767
		 7 71.506256736502237 8 66.543473556160919 10 -41.507215834678249;
	setAttr ".pst" 3;
createNode animCurveTA -n "LegIK_R_CTRL_rotateY";
	rename -uid "A0B09539-4170-A679-9D35-089F7FFF5F53";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -9.782566039208092 2 0 3 0 5 -33.078792014538784
		 7 -46.026808332235198 8 -47.34544529693661 10 -9.782566039208092;
	setAttr -s 7 ".kit[3:6]"  18 18 18 1;
	setAttr -s 7 ".kot[3:6]"  18 18 18 1;
	setAttr -s 7 ".kix[0:6]"  0.21836870908737183 0.67748141288757324 
		0.49916285276412964 0.16373792290687561 0.4347693920135498 1 0.21659767627716064;
	setAttr -s 7 ".kiy[0:6]"  0.97586631774902344 0.73553991317749023 
		-0.86650824546813965 -0.98650389909744263 -0.90054184198379517 0 0.9762609601020813;
	setAttr -s 7 ".kox[0:6]"  0.21836861968040466 0.67748141288757324 
		0.49916291236877441 0.16373792290687561 0.43476933240890503 1 0.21659769117832184;
	setAttr -s 7 ".koy[0:6]"  0.97586637735366821 0.73553997278213501 
		-0.86650818586349487 -0.98650389909744263 -0.90054178237915039 0 0.9762609601020813;
	setAttr ".pst" 3;
createNode animCurveTA -n "LegIK_R_CTRL_rotateZ";
	rename -uid "905ABE91-409F-F89F-E0E6-B5B88852309B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 2 0 3 0 5 -30.274800393219131 7 -43.01908989507546
		 8 -57.187195751126872 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "LegIK_L_CTRL_rotateX";
	rename -uid "EFF054BD-426F-AF0C-C203-F490BDACE7B3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 64.132735922395767 2 71.506256736502237
		 3 66.543473556160919 5 -41.507215834678249 7 0 8 0 10 64.132735922395767;
	setAttr ".pst" 3;
createNode animCurveTA -n "LegIK_L_CTRL_rotateY";
	rename -uid "BB13095E-4E53-5748-4A04-BE8AFCE1F87D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 33.078792014538784 2 46.026808332235198
		 3 47.34544529693661 5 9.782566039208092 7 0 8 0 10 33.078792014538784;
	setAttr -s 7 ".kit[3:6]"  1 1 1 18;
	setAttr -s 7 ".kot[3:6]"  1 1 1 18;
	setAttr -s 7 ".kix[3:6]"  0.21659767627716064 0.67748141288757324 
		0.49916285276412964 1;
	setAttr -s 7 ".kiy[3:6]"  -0.9762609601020813 -0.73553991317749023 
		0.86650824546813965 0;
	setAttr -s 7 ".kox[3:6]"  0.21659769117832184 0.67748141288757324 
		0.49916291236877441 1;
	setAttr -s 7 ".koy[3:6]"  -0.9762609601020813 -0.73553997278213501 
		0.86650818586349487 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "LegIK_L_CTRL_rotateZ";
	rename -uid "9B7C13F0-427C-5BCB-F526-F5B5D82D8CE6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 30.274800393219131 2 43.01908989507546
		 3 57.187195751126872 5 0 7 0 8 0 10 30.274800393219131;
	setAttr ".pst" 3;
createNode animCurveTL -n "LegIK_L_CTRL_translateX";
	rename -uid "7F4D55A4-4456-8C3E-8EDE-D38E55B7F01A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 2.5 2 0 3 0 5 2.5 7 2.5 8 2.5 10 2.5;
	setAttr ".pst" 3;
createNode animCurveTL -n "LegIK_L_CTRL_translateY";
	rename -uid "4564F0A8-4A0D-3304-DF8C-7E881F25CB6D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 3.6471999407416611 2 4.7459888676722368
		 3 3.6471999407416775 5 0 7 0 8 0 10 3.6471999407416611;
	setAttr ".pst" 3;
createNode animCurveTL -n "LegIK_L_CTRL_translateZ";
	rename -uid "775F2DA4-4F02-38E0-1FB2-9693B3CD9D59";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -6.2787437740983787 2 -4.7545205399623569
		 3 -2.5434609462308275 5 7.7010953991880822 7 3.2189470657838584 8 -6.2787437740983663
		 10 -6.2787437740983787;
	setAttr ".pst" 3;
createNode animCurveTA -n "Body_CTRL_rotateX";
	rename -uid "E8DD6D7B-41B9-5BD2-3425-BBBD5E6EF34D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 9.1001335445918592 10 9.1001335445918592;
	setAttr ".pst" 3;
createNode animCurveTA -n "Body_CTRL_rotateY";
	rename -uid "2A536BC8-4A37-524C-FC29-3ABF2BB5913B";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 19.291305442410387 3 5.9907138796942068
		 5 -19.108696730855435 8 -7.529841924092783 10 19.291305442410387;
	setAttr -s 5 ".kit[1:4]"  18 3 1 3;
	setAttr -s 5 ".kot[1:4]"  18 3 1 3;
	setAttr -s 5 ".kix[3:4]"  0.20668883621692657 1;
	setAttr -s 5 ".kiy[3:4]"  0.97840672731399536 0;
	setAttr -s 5 ".kox[3:4]"  0.20668882131576538 1;
	setAttr -s 5 ".koy[3:4]"  0.97840672731399536 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "Body_CTRL_rotateZ";
	rename -uid "ECAB335F-4448-C1D6-EC50-46A593248D22";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 6.3114536650908422 3 -1.005169366293857
		 5 -4.9796314842192437 8 2.3369922740066329 10 6.3114536650908422;
	setAttr ".pst" 3;
createNode animCurveTL -n "Body_CTRL_translateX";
	rename -uid "87B0CD6A-45FA-DA5A-BCD9-14AC6BD6BE09";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 3 -1.6 5 0 8 1.6 10 0;
	setAttr -s 5 ".kit[1:4]"  18 1 18 1;
	setAttr -s 5 ".kot[1:4]"  18 1 18 1;
	setAttr -s 5 ".kix[0:4]"  0.035902999341487885 1 0.032926909625530243 
		1 0.036311078816652298;
	setAttr -s 5 ".kiy[0:4]"  -0.99935531616210938 0 0.99945783615112305 
		0 -0.99934053421020508;
	setAttr -s 5 ".kox[0:4]"  0.035902969539165497 1 0.032926913350820541 
		1 0.036311075091362;
	setAttr -s 5 ".koy[0:4]"  -0.99935531616210938 0 0.99945777654647827 
		0 -0.99934053421020508;
	setAttr ".pst" 3;
createNode animCurveTL -n "Body_CTRL_translateY";
	rename -uid "A8A6DF27-4893-18CD-2FA5-8CB1F82B9AEC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 2 3 0 5 2 8 0 10 2;
	setAttr ".pst" 3;
createNode animCurveTL -n "Body_CTRL_translateZ";
	rename -uid "C66051EA-47EA-BEFC-B7E8-7F8731046B0F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 3 0 5 0 8 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "TailChainFK_0_CTRL_rotateX";
	rename -uid "71895403-42DC-58CE-EA5F-ACA536B66BEC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "TailChainFK_0_CTRL_rotateY";
	rename -uid "F11D07E0-43BA-6673-76A3-188E5BE1C227";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 3 16.715544175556513 5 0 7 -16.786538988026752
		 10 0;
	setAttr -s 5 ".kit[1:4]"  18 1 18 1;
	setAttr -s 5 ".kot[1:4]"  18 1 18 1;
	setAttr -s 5 ".kix[0:4]"  0.22768072783946991 1 0.16657185554504395 
		1 0.22579410672187805;
	setAttr -s 5 ".kiy[0:4]"  0.97373586893081665 0 -0.98602938652038574 
		0 0.9741750955581665;
	setAttr -s 5 ".kox[0:4]"  0.22768072783946991 1 0.16657185554504395 
		1 0.22579404711723328;
	setAttr -s 5 ".koy[0:4]"  0.97373586893081665 0 -0.98602932691574097 
		0 0.9741750955581665;
	setAttr ".pst" 3;
createNode animCurveTA -n "TailChainFK_0_CTRL_rotateZ";
	rename -uid "B303E482-4B65-F2CF-B809-B69F09601BD2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 25.085111882554635 10 25.085111882554635;
	setAttr ".pst" 3;
createNode animCurveTL -n "TailChainFK_0_CTRL_translateX";
	rename -uid "9EFA64DF-4B7F-ABC2-B5DA-E8BB0DDF78D7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 3 0 5 0 7 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "TailChainFK_0_CTRL_translateY";
	rename -uid "19EF907F-40B6-9F69-FA43-7DBDC95B01A2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 3 0 5 0 7 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "TailChainFK_0_CTRL_translateZ";
	rename -uid "5DAC9786-4552-7AA7-27B7-1388947EADC9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 3 0 5 0 7 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_1_CTRL_rotateX";
	rename -uid "8D095A2C-44F2-4B79-59A9-E28B9844EF56";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_1_CTRL_rotateY";
	rename -uid "A76FAB42-44E4-016D-26ED-9287A6536525";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr -s 2 ".kix[0:1]"  0.47714418172836304 0.48255601525306702;
	setAttr -s 2 ".kiy[0:1]"  0.87882506847381592 0.87586516141891479;
	setAttr -s 2 ".kox[0:1]"  0.47714412212371826 0.48255601525306702;
	setAttr -s 2 ".koy[0:1]"  0.87882506847381592 0.87586510181427002;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_1_CTRL_rotateZ";
	rename -uid "62066BDF-4763-CB4A-E2D9-D6A7B7687E8C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 -24.415989425366529 10 -24.415989425366529;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_1_CTRL_translateX";
	rename -uid "1110592E-4CBA-8454-B072-A9A5C75515D4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_1_CTRL_translateY";
	rename -uid "98CCDD43-4B7E-507A-8108-68A935DCC4B7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_1_CTRL_translateZ";
	rename -uid "3478C9A0-4C4A-9919-5586-74B6A0E48FE3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "ArmChainFK_0_R_CTRL_rotateX";
	rename -uid "268DBFF8-477B-91E7-9F41-08A0601EAD48";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -16.805707147853866 2 -16.805707147853866
		 4 -16.805707147853866 5 -16.805707147853866 7 -16.805707147853866 9 -16.805707147853866
		 10 -16.805707147853866;
	setAttr ".pst" 3;
createNode animCurveTA -n "ArmChainFK_0_R_CTRL_rotateY";
	rename -uid "A78C69E0-414D-0328-FDB2-F2BECB5516A8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 41.147506711289211 2 41.147506711289211
		 4 41.147506711289211 5 41.147506711289211 7 41.147506711289211 9 41.147506711289211
		 10 41.147506711289211;
	setAttr ".pst" 3;
createNode animCurveTA -n "ArmChainFK_0_R_CTRL_rotateZ";
	rename -uid "A077BC40-434F-1458-B484-4F9E61CF81B1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 20.185889139534048 2 24.998484095910307
		 4 12.839833586656706 5 20.185889139534048 7 24.998484095910307 9 12.839833586656706
		 10 20.185889139534048;
	setAttr ".pst" 3;
createNode animCurveTA -n "ArmChainFK_0_L_CTRL_rotateX";
	rename -uid "382A69FE-4DB4-4AA3-C910-72926CEEB5BC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -6.97754493523618 3 -16.805707147853866
		 4 -21.464769517259548 6 -18.335551148116114 8 -16.805707147853866 10 -6.97754493523618;
	setAttr ".pst" 3;
createNode animCurveTA -n "ArmChainFK_0_L_CTRL_rotateY";
	rename -uid "3978EAFA-43C4-0128-E16C-C3B2DECF9304";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 25.381268351745955 3 41.147506711289211
		 4 49.853566862013473 6 54.391148307199238 8 45.916016096997332 10 25.381268351745955;
	setAttr ".pst" 3;
createNode animCurveTA -n "ArmChainFK_0_L_CTRL_rotateZ";
	rename -uid "B786AC54-438F-CF33-5953-4D95F3600103";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 24.124450754826942 3 7.5517478431312783
		 4 5.479631532783845 6 13.033141082449241 8 31.434343618168857 10 24.124450754826942;
	setAttr -s 6 ".kit[0:5]"  1 18 18 1 18 1;
	setAttr -s 6 ".kot[0:5]"  1 18 18 1 18 1;
	setAttr -s 6 ".kix[0:5]"  0.20181648433208466 0.37914347648620605 
		1 0.43349704146385193 1 0.20024818181991577;
	setAttr -s 6 ".kiy[0:5]"  -0.97942334413528442 -0.92533791065216064 
		0 0.90115493535995483 0 -0.97974520921707153;
	setAttr -s 6 ".kox[0:5]"  0.20181652903556824 0.37914344668388367 
		1 0.43349713087081909 1 0.20024815201759338;
	setAttr -s 6 ".koy[0:5]"  -0.9794234037399292 -0.92533791065216064 
		0 0.90115499496459961 0 -0.97974520921707153;
	setAttr ".pst" 3;
createNode animCurveTL -n "ArmChainFK_0_L_CTRL_translateX";
	rename -uid "38EA6F4B-411A-F457-A90A-908BD05D79E4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 3 0 4 0 6 0 8 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "ArmChainFK_0_L_CTRL_translateY";
	rename -uid "0E66E95A-44FF-839A-471B-498D5597A141";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 3 0 4 0 6 0 8 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "ArmChainFK_0_L_CTRL_translateZ";
	rename -uid "C8EA5F0F-4981-1B05-9D74-93BD85B89C42";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 3 0 4 0 6 0 8 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "ArmChainFK_0_R_CTRL_translateX";
	rename -uid "68B0DDC6-4287-FC4B-2621-44A00CCB3F99";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 2 0 4 0 5 0 7 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "ArmChainFK_0_R_CTRL_translateY";
	rename -uid "6D6BDB67-46C1-4832-6E3E-8C97F5CDD02C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 2 0 4 0 5 0 7 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "ArmChainFK_0_R_CTRL_translateZ";
	rename -uid "049A2561-48DA-893D-1D5B-EBA9E8B4B7E2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 2 0 4 0 5 0 7 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_4_CTRL_rotateX";
	rename -uid "17552266-4C44-8F4D-7C34-77A2A01CCAD5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_4_CTRL_rotateY";
	rename -uid "22E4581B-4FB7-6ADF-7574-FF9A6D32E056";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_4_CTRL_rotateZ";
	rename -uid "58E64EA1-48AB-D406-A120-4F93706B1D48";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 8.1084560385251905 10 8.1084560385251905;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_4_CTRL_translateX";
	rename -uid "E0D219D1-44B1-178C-E6A8-288339ADBE24";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_4_CTRL_translateY";
	rename -uid "9F9B8A56-4D10-DBC9-2736-3EB37E6CAF76";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_4_CTRL_translateZ";
	rename -uid "E970AB5D-4E52-2D6B-ABCE-7AB8FB0FD0BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_2_CTRL_rotateX";
	rename -uid "F9436563-4586-4296-390E-0C9A33482DEE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_2_CTRL_rotateY";
	rename -uid "07846A75-4EB4-0792-595B-518A765B1BB0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "SpineFK_2_CTRL_rotateZ";
	rename -uid "268F74D3-4C86-ACA8-9BF7-B09ED9F5BFCF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 -27.070432164475857 10 -27.070432164475857;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_2_CTRL_translateX";
	rename -uid "EB0647EA-4D4E-C023-2DF5-74AEA657FD57";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_2_CTRL_translateY";
	rename -uid "BB143881-47F4-3BC0-415C-688EA490F525";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_2_CTRL_translateZ";
	rename -uid "2E309063-40A6-3E26-975D-EEBC03FD4D6B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "FootIKToe_0_R_CTRL_rotateX";
	rename -uid "54709E19-4B4D-852A-632A-3F9D4A88C4C7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 2 0 3 0 4 0 6 -7.8776834514426719
		 9 -1.2308877916755159 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "FootIKToe_0_R_CTRL_rotateY";
	rename -uid "0C30E5D6-4971-781F-1D80-2DBBF24BE992";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 2 0 3 0 4 0 6 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "FootIKToe_0_R_CTRL_rotateZ";
	rename -uid "A6290A00-42B0-72A4-55E2-A2B8A7FE5689";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 -18.554512117808361 1 17.201422846121268
		 2 35.970027331119489 3 0 4 29.693099327537261 6 12.902777393016724 8 0 9 -18.415496314223198
		 10 -18.554512117808361;
	setAttr ".pst" 3;
createNode animCurveTL -n "FootIKToe_0_R_CTRL_translateX";
	rename -uid "DF64A311-45F0-871F-0EB5-679CD4E71577";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 2 0 3 0 4 0 6 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "FootIKToe_0_R_CTRL_translateY";
	rename -uid "46C13A64-4642-19B4-6A82-0BBBFCCD86B8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 2 0 3 0 4 0 6 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "FootIKToe_0_R_CTRL_translateZ";
	rename -uid "226C4D48-4542-9001-1108-16BB59E30A9B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 2 0 3 0 4 0 6 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "FootIKToe_0_L_CTRL_translateX";
	rename -uid "4FC19897-4147-3037-4591-A59422DC3656";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "FootIKToe_0_L_CTRL_translateY";
	rename -uid "F1CF217A-40AD-F53E-19A5-28A331364F52";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "FootIKToe_0_L_CTRL_translateZ";
	rename -uid "1714F15B-4E2C-BADC-E3D1-A082BB4F172B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTA -n "FootIKToe_0_L_CTRL_rotateZ";
	rename -uid "55C8AD1F-4A4C-C2B1-BFA5-88A825C64779";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 23.153757040887619 1 12.902777393016724
		 3 0 4 -18.415496314223198 5 -18.554512117808361 6 17.201422846121268 7 35.970027331119489
		 8 0 9 29.693099327537261 10 23.153757040887619;
	setAttr ".pst" 3;
createNode animCurveTA -n "FootIKToe_0_L_CTRL_rotateX";
	rename -uid "D81C7948-439F-571C-A9B0-29B395DFE8CE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 -3.9388417257213355 1 -7.8776834514426719
		 4 -1.2308877916755159 5 0 6 0 7 0 8 0 9 0 10 -3.9388417257213355;
	setAttr ".pst" 3;
createNode animCurveTA -n "FootIKToe_0_L_CTRL_rotateY";
	rename -uid "4DD93AE7-4AF3-A5F1-53EE-AF8F2A20EF94";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0;
	setAttr ".pst" 3;
createNode animCurveTL -n "SpineFK_0_CTRL_translateX";
	rename -uid "6AB2CAAF-4964-D89B-0DB6-F59C3966EC80";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTL -n "SpineFK_0_CTRL_translateY";
	rename -uid "8AF78DA3-4444-ED22-A603-79A3A63783BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTL -n "SpineFK_0_CTRL_translateZ";
	rename -uid "66876611-4C22-BD3A-4B01-C0A60ACDC8D8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTA -n "SpineFK_0_CTRL_rotateX";
	rename -uid "5DE24DCA-426E-48B1-6F52-CFBD832B55B5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTA -n "SpineFK_0_CTRL_rotateY";
	rename -uid "C0F3579E-44FD-4BE3-0A4C-D588056224C3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTA -n "SpineFK_0_CTRL_rotateZ";
	rename -uid "27D9906E-42F5-0171-7774-CEAF4C8B1CE5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 22.892442674267912 10 22.892442674267912;
createNode vstExportNode -n "penguin_walk_exportNode";
	rename -uid "50A48917-4EF9-7BCF-3030-2EAAC306DD83";
	setAttr ".ei[0].exportFile" -type "string" "penguin_run";
	setAttr ".ei[0].t" 2;
	setAttr ".ei[0].fe" 10;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "85CD99F5-4E84-B30E-334C-7B9D18A9698E";
	setAttr ".pee" yes;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -128.57142346245922 -96.428567596844431 ;
	setAttr ".tgi[0].vh" -type "double2" 92.857139167331667 577.38092943789559 ;
	setAttr ".tgi[0].ni[0].x" -150;
	setAttr ".tgi[0].ni[0].y" 320;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode vsVmatToTex -n "whiskey_the_stout_penguin_color_vsVmatToTex_ND";
	rename -uid "85962B23-4928-FA4A-EE67-0499B40A9E91";
	setAttr ".vmat" -type "string" "materials/models/items/tuskarr/whiskey_the_stout/whiskey_the_stout_penguin_color.vmat";
createNode reference -n "whiskey_the_stout_penguin_color_vmatRN";
	rename -uid "7FB1CACF-4CC6-A69D-5563-C0BC4F692089";
	setAttr -s 24 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"whiskey_the_stout_penguin_color_vmatRN"
		"whiskey_the_stout_penguin_color_vmatRN" 0
		"whiskey_the_stout_penguin_color_vmatRN" 26
		1 whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx "FBX_vmatPath" 
		"FBX_vmatPath" " -ci 1 -nn \"FBX_vmatPath\" -dt \"string\""
		2 "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx" "shaderparams" 
		" -type \"string\" \"fresnelWarpColor~278~fresnelWarpRim~278~fresnelWarpSpec~278~cubeMap~278~color~278~normal~278~specularMask~278~specularColor~319~specularExponent~317~specularScale~317~rimMask~278~rimLightColor~319~rimLightScale~317~selfIllumMask~278~translucency~278~metalnessMask~278~cubeMapScalar~317~\""
		
		5 3 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.message" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[1]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.FBX_vmatPath" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[2]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.fresnelWarpColor" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[3]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.fresnelWarpRim" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[4]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.fresnelWarpSpec" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[5]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.cubeMap" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[6]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.color" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[7]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.normal" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[8]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.specularMask" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[9]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.specularColorR" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[10]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.specularColorG" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[11]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.specularColorB" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[12]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.specularExponent" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[13]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.specularScale" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[14]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.rimMask" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[15]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.rimLightColorR" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[16]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.rimLightColorG" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[17]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.rimLightColorB" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[18]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.rimLightScale" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[19]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.selfIllumMask" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[20]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.translucency" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[21]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.metalnessMask" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[22]" ""
		5 4 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.cubeMapScalar" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[23]" ""
		5 3 "whiskey_the_stout_penguin_color_vmatRN" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx.outColor" 
		"whiskey_the_stout_penguin_color_vmatRN.placeHolderList[24]" "";
lockNode -l 1 ;
createNode shadingEngine -n "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG";
	rename -uid "7A909BD8-4A04-3655-9AC5-7D80243A3923";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "EC992FA7-4FD9-6E2F-C82D-10A8D3C4A5B1";
createNode animCurveTL -n "SpineFK_3_CTRL_translateX";
	rename -uid "CB410A11-4F80-635F-FB48-52B3D3181847";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTL -n "SpineFK_3_CTRL_translateY";
	rename -uid "F6853AED-4F95-84D9-A430-2CB91A33657F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTL -n "SpineFK_3_CTRL_translateZ";
	rename -uid "37E8EC4D-45BC-FB4F-8C9E-BDA92C830452";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTA -n "SpineFK_3_CTRL_rotateX";
	rename -uid "A76D1EC3-419B-7D6D-37B4-FC85740AEBB5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTA -n "SpineFK_3_CTRL_rotateY";
	rename -uid "D36BFF9A-4464-B981-0E17-E0852C3057B3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 0;
createNode animCurveTA -n "SpineFK_3_CTRL_rotateZ";
	rename -uid "19F33F21-4FBF-A912-F266-79811D65C351";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 -9.7508509452067162 10 -9.7508509452067162;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 8;
	setAttr ".unw" 8;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 8 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 10 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -s 41 ".u";
select -ne :defaultRenderingList1;
	setAttr -s 3 ".r";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 12 ".tx";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -s 51 ".gn";
select -ne :initialParticleSE;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr -k on ".mcfr";
	setAttr -cb on ".ifg";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr -cb on ".ren";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -cb on ".imfkey";
	setAttr -k on ".gama";
	setAttr -k on ".an";
	setAttr -cb on ".ar";
	setAttr ".fs" 1;
	setAttr ".ef" 10;
	setAttr -av -k on ".bfs";
	setAttr -cb on ".me";
	setAttr -cb on ".se";
	setAttr -k on ".be";
	setAttr -cb on ".ep";
	setAttr -k on ".fec";
	setAttr -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -cb on ".pff";
	setAttr -cb on ".peie";
	setAttr -cb on ".ifp";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -k on ".shs";
	setAttr -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -k on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -k on ".pram";
	setAttr -k on ".poam";
	setAttr -k on ".prlm";
	setAttr -k on ".polm";
	setAttr -cb on ".prm";
	setAttr -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
	setAttr -cb on ".hbl";
select -ne :defaultResolution;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr ".pa" 1;
	setAttr -k on ".al";
	setAttr -av ".dar";
	setAttr -k on ".ldar";
	setAttr -k on ".off";
	setAttr -k on ".fld";
	setAttr -k on ".zsl";
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
select -ne :ikSystem;
connectAttr "whiskey_the_stout_hex_rigRN.phl[1]" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "World_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[4]";
connectAttr "World_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[5]";
connectAttr "World_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[6]";
connectAttr "World_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[7]";
connectAttr "World_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[8]";
connectAttr "World_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[9]";
connectAttr "Body_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[10]";
connectAttr "Body_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[11]";
connectAttr "Body_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[12]";
connectAttr "Body_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[13]";
connectAttr "Body_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[14]";
connectAttr "Body_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[15]";
connectAttr "TailChainFK_0_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[16]"
		;
connectAttr "TailChainFK_0_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[17]"
		;
connectAttr "TailChainFK_0_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[18]"
		;
connectAttr "TailChainFK_0_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[19]"
		;
connectAttr "TailChainFK_0_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[20]"
		;
connectAttr "TailChainFK_0_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[21]"
		;
connectAttr "SpineFK_4_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[22]";
connectAttr "SpineFK_4_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[23]";
connectAttr "SpineFK_4_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[24]";
connectAttr "SpineFK_4_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[25]";
connectAttr "SpineFK_4_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[26]";
connectAttr "SpineFK_4_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[27]";
connectAttr "SpineFK_3_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[28]";
connectAttr "SpineFK_3_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[29]";
connectAttr "SpineFK_3_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[30]";
connectAttr "SpineFK_3_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[31]";
connectAttr "SpineFK_3_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[32]";
connectAttr "SpineFK_3_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[33]";
connectAttr "SpineFK_2_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[34]";
connectAttr "SpineFK_2_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[35]";
connectAttr "SpineFK_2_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[36]";
connectAttr "SpineFK_2_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[37]";
connectAttr "SpineFK_2_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[38]";
connectAttr "SpineFK_2_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[39]";
connectAttr "SpineFK_1_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[40]";
connectAttr "SpineFK_1_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[41]";
connectAttr "SpineFK_1_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[42]";
connectAttr "SpineFK_1_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[43]";
connectAttr "SpineFK_1_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[44]";
connectAttr "SpineFK_1_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[45]";
connectAttr "SpineFK_0_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[46]";
connectAttr "SpineFK_0_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[47]";
connectAttr "SpineFK_0_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[48]";
connectAttr "SpineFK_0_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[49]";
connectAttr "SpineFK_0_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[50]";
connectAttr "SpineFK_0_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[51]";
connectAttr "FootIKToe_0_R_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[52]"
		;
connectAttr "FootIKToe_0_R_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[53]"
		;
connectAttr "FootIKToe_0_R_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[54]"
		;
connectAttr "FootIKToe_0_R_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[55]"
		;
connectAttr "FootIKToe_0_R_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[56]"
		;
connectAttr "FootIKToe_0_R_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[57]"
		;
connectAttr "FootIKToe_0_L_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[58]"
		;
connectAttr "FootIKToe_0_L_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[59]"
		;
connectAttr "FootIKToe_0_L_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[60]"
		;
connectAttr "FootIKToe_0_L_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[61]"
		;
connectAttr "FootIKToe_0_L_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[62]"
		;
connectAttr "FootIKToe_0_L_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[63]"
		;
connectAttr "ArmChainFK_0_R_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[64]"
		;
connectAttr "ArmChainFK_0_R_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[65]"
		;
connectAttr "ArmChainFK_0_R_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[66]"
		;
connectAttr "ArmChainFK_0_R_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[67]"
		;
connectAttr "ArmChainFK_0_R_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[68]"
		;
connectAttr "ArmChainFK_0_R_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[69]"
		;
connectAttr "ArmChainFK_0_L_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[70]"
		;
connectAttr "ArmChainFK_0_L_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[71]"
		;
connectAttr "ArmChainFK_0_L_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[72]"
		;
connectAttr "ArmChainFK_0_L_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[73]"
		;
connectAttr "ArmChainFK_0_L_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[74]"
		;
connectAttr "ArmChainFK_0_L_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[75]"
		;
connectAttr "LegIK_R_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[76]";
connectAttr "LegIK_R_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[77]";
connectAttr "LegIK_R_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[78]";
connectAttr "LegIK_R_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[79]";
connectAttr "LegIK_R_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[80]";
connectAttr "LegIK_R_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[81]";
connectAttr "LegIK_L_CTRL_rotateX.o" "whiskey_the_stout_hex_rigRN.phl[82]";
connectAttr "LegIK_L_CTRL_rotateY.o" "whiskey_the_stout_hex_rigRN.phl[83]";
connectAttr "LegIK_L_CTRL_rotateZ.o" "whiskey_the_stout_hex_rigRN.phl[84]";
connectAttr "LegIK_L_CTRL_translateX.o" "whiskey_the_stout_hex_rigRN.phl[85]";
connectAttr "LegIK_L_CTRL_translateY.o" "whiskey_the_stout_hex_rigRN.phl[86]";
connectAttr "LegIK_L_CTRL_translateZ.o" "whiskey_the_stout_hex_rigRN.phl[87]";
connectAttr "whiskey_the_stout_hex_rigRN.phl[2]" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG.dsm"
		 -na;
connectAttr "whiskey_the_stout_hex_rigRN.phl[3]" "penguin_walk_exportNode.ei[0].objects[0]"
		;
connectAttr "whiskey_the_stout_penguin_color_vmatRN.phl[1]" "materialInfo1.m";
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.vmat" "whiskey_the_stout_penguin_color_vmatRN.phl[2]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.fwc" "whiskey_the_stout_penguin_color_vmatRN.phl[3]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.fwr" "whiskey_the_stout_penguin_color_vmatRN.phl[4]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.fws" "whiskey_the_stout_penguin_color_vmatRN.phl[5]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.cm" "whiskey_the_stout_penguin_color_vmatRN.phl[6]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.clr" "whiskey_the_stout_penguin_color_vmatRN.phl[7]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.norm" "whiskey_the_stout_penguin_color_vmatRN.phl[8]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.sm" "whiskey_the_stout_penguin_color_vmatRN.phl[9]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.sc0" "whiskey_the_stout_penguin_color_vmatRN.phl[10]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.sc1" "whiskey_the_stout_penguin_color_vmatRN.phl[11]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.sc2" "whiskey_the_stout_penguin_color_vmatRN.phl[12]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.se" "whiskey_the_stout_penguin_color_vmatRN.phl[13]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.ss" "whiskey_the_stout_penguin_color_vmatRN.phl[14]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.rm" "whiskey_the_stout_penguin_color_vmatRN.phl[15]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.rlc0" "whiskey_the_stout_penguin_color_vmatRN.phl[16]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.rlc1" "whiskey_the_stout_penguin_color_vmatRN.phl[17]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.rlc2" "whiskey_the_stout_penguin_color_vmatRN.phl[18]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.rls" "whiskey_the_stout_penguin_color_vmatRN.phl[19]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.sim" "whiskey_the_stout_penguin_color_vmatRN.phl[20]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.trans" "whiskey_the_stout_penguin_color_vmatRN.phl[21]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.mm" "whiskey_the_stout_penguin_color_vmatRN.phl[22]"
		;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.cms" "whiskey_the_stout_penguin_color_vmatRN.phl[23]"
		;
connectAttr "whiskey_the_stout_penguin_color_vmatRN.phl[24]" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG.ss"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "sharedReferenceNode.sr" "whiskey_the_stout_hex_rigRN.sr";
connectAttr "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG.msg" "materialInfo1.sg"
		;
connectAttr "whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfxSG.pa" ":renderPartition.st"
		 -na;
connectAttr "whiskey_the_stout_penguin_color_vsVmatToTex_ND.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of penguin_walk.ma
