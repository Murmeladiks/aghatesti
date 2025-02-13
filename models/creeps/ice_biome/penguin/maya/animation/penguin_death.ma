//Maya ASCII 2016R2 scene
//Name: penguin_death.ma
//Last modified: Wed, Aug 16, 2017 01:57:29 PM
//Codeset: 1252
file -rdi 1 -ns "penguin_rig" -rfn "penguin_rigRN" -op "v=0;" -typ "mayaAscii"
		 "valve:///models/creeps/ice_biome/penguin/maya/penguin_rig.ma";
file -rdi 2 -ns "MDL" -rfn "penguin_rig:MDLRN" -typ "mayaAscii" "valve:///models/creeps/ice_biome/penguin/maya/penguin_model.ma";
file -rdi 3 -ns "whiskey_the_stout_color_vmat" -rfn "penguin_rig:MDL:whiskey_the_stout_color_vmatRN"
		 -typ "mayaAscii" "%VTOOLS%/maya/global/python/Materials/dota_hero_shaderfx.ma";
file -rdi 3 -ns "whiskey_the_stout_penguin_color_vmat" -rfn "penguin_rig:MDL:whiskey_the_stout_penguin_color_vmatRN"
		 -typ "mayaAscii" "%VTOOLS%/maya/global/python/Materials/dota_hero_shaderfx.ma";
file -r -ns "penguin_rig" -dr 1 -rfn "penguin_rigRN" -op "v=0;" -typ "mayaAscii"
		 "valve:///models/creeps/ice_biome/penguin/maya/penguin_rig.ma";
requires maya "2016R2";
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
	rename -uid "5349DBAD-4851-56AE-DF32-D6B14DCCB4D6";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -286.07309396396545 281.12198842460077 -91.22466774975689 ;
	setAttr ".r" -type "double3" -36.338352731557173 -1169.3999999994733 -3.0372615051691978e-013 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "D4E83D29-452D-1928-6BCB-0ABA35004250";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 372.5918047120723;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "49F6E58F-4435-0DFC-329A-4B9F5D7402FC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "DBF6B74D-47E5-FA18-17F7-3FA6059C5593";
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
	rename -uid "1DBE8044-4EF7-BD72-927A-08B0927EC609";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "82B9ED38-470B-32F1-D2AD-95BA69A6EB82";
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
	rename -uid "894F7E9E-4724-9D15-2EB9-B48A2C2AD369";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "CC479BEE-41C9-17D2-05EB-348F1CA0EC0D";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "pPlane1";
	rename -uid "C199F716-4A42-261C-8A2F-E99EB17D5117";
	setAttr ".s" -type "double3" 111.53262254731365 111.53262254731365 111.53262254731365 ;
createNode mesh -n "pPlaneShape1" -p "pPlane1";
	rename -uid "86952881-4E05-F55B-47D0-0E98F10709B5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 121 ".pt[0:120]" -type "float3"  4.3298698e-015 9.6142423e-031 
		0.96165228 4.3298698e-015 9.6142423e-031 0.96165228 4.3298698e-015 9.6142423e-031 
		0.96165228 2.1649349e-015 9.6142423e-031 0.96165228 1.0824674e-015 9.6142423e-031 
		0.96165228 0 9.6142423e-031 0.96165228 -1.0824674e-015 9.6142423e-031 0.96165228 
		-2.1649349e-015 9.6142423e-031 0.96165228 -4.3298698e-015 9.6142423e-031 0.96165228 
		-4.3298698e-015 9.6142423e-031 0.96165228 -4.3298698e-015 9.6142423e-031 0.96165228 
		4.3298698e-015 9.6142423e-031 0.7693212 4.3298698e-015 9.6142423e-031 0.7693212 4.3298698e-015 
		9.6142423e-031 0.7693212 2.1649349e-015 9.6142423e-031 0.7693212 1.0824674e-015 9.6142423e-031 
		0.7693212 0 9.6142423e-031 0.7693212 -1.0824674e-015 9.6142423e-031 0.7693212 -2.1649349e-015 
		9.6142423e-031 0.7693212 -4.3298698e-015 9.6142423e-031 0.7693212 -4.3298698e-015 
		9.6142423e-031 0.7693212 -4.3298698e-015 9.6142423e-031 0.7693212 4.3298698e-015 
		9.6142423e-031 0.57699114 4.3298698e-015 9.6142423e-031 0.57699114 4.3298698e-015 
		9.6142423e-031 0.57699114 2.1649349e-015 9.6142423e-031 0.57699114 1.0824674e-015 
		9.6142423e-031 0.57699114 0 9.6142423e-031 0.57699114 -1.0824674e-015 9.6142423e-031 
		0.57699114 -2.1649349e-015 9.6142423e-031 0.57699114 -4.3298698e-015 9.6142423e-031 
		0.57699114 -4.3298698e-015 9.6142423e-031 0.57699114 -4.3298698e-015 9.6142423e-031 
		0.57699114 4.3298698e-015 4.8071211e-031 0.38466057 4.3298698e-015 4.8071211e-031 
		0.38466057 4.3298698e-015 4.8071211e-031 0.38466057 2.1649349e-015 4.8071211e-031 
		0.38466057 1.0824674e-015 4.8071211e-031 0.38466057 0 4.8071211e-031 0.38466057 -1.0824674e-015 
		4.8071211e-031 0.38466057 -2.1649349e-015 4.8071211e-031 0.38466057 -4.3298698e-015 
		4.8071211e-031 0.38466057 -4.3298698e-015 4.8071211e-031 0.38466057 -4.3298698e-015 
		4.8071211e-031 0.38466057 4.3298698e-015 2.4035606e-031 0.19233029 4.3298698e-015 
		2.4035606e-031 0.19233029 4.3298698e-015 2.4035606e-031 0.19233029 2.1649349e-015 
		2.4035606e-031 0.19233029 1.0824674e-015 2.4035606e-031 0.19233029 0 2.4035606e-031 
		0.19233029 -1.0824674e-015 2.4035606e-031 0.19233029 -2.1649349e-015 2.4035606e-031 
		0.19233029 -4.3298698e-015 2.4035606e-031 0.19233029 -4.3298698e-015 2.4035606e-031 
		0.19233029 -4.3298698e-015 2.4035606e-031 0.19233029 4.3298698e-015 0 0 4.3298698e-015 
		0 0 4.3298698e-015 0 0 2.1649349e-015 0 0 1.0824674e-015 0 0 0 0 0 -1.0824674e-015 
		0 0 -2.1649349e-015 0 0 -4.3298698e-015 0 0 -4.3298698e-015 0 0 -4.3298698e-015 0 
		0 4.3298698e-015 -2.4035606e-031 -0.19233033 4.3298698e-015 -2.4035606e-031 -0.19233033 
		4.3298698e-015 -2.4035606e-031 -0.19233033 2.1649349e-015 -2.4035606e-031 -0.19233033 
		1.0824674e-015 -2.4035606e-031 -0.19233033 0 -2.4035606e-031 -0.19233033 -1.0824674e-015 
		-2.4035606e-031 -0.19233033 -2.1649349e-015 -2.4035606e-031 -0.19233033 -4.3298698e-015 
		-2.4035606e-031 -0.19233033 -4.3298698e-015 -2.4035606e-031 -0.19233033 -4.3298698e-015 
		-2.4035606e-031 -0.19233033 4.3298698e-015 -4.8071211e-031 -0.38466057 4.3298698e-015 
		-4.8071211e-031 -0.38466057 4.3298698e-015 -4.8071211e-031 -0.38466057 2.1649349e-015 
		-4.8071211e-031 -0.38466057 1.0824674e-015 -4.8071211e-031 -0.38466057 0 -4.8071211e-031 
		-0.38466057 -1.0824674e-015 -4.8071211e-031 -0.38466057 -2.1649349e-015 -4.8071211e-031 
		-0.38466057 -4.3298698e-015 -4.8071211e-031 -0.38466057 -4.3298698e-015 -4.8071211e-031 
		-0.38466057 -4.3298698e-015 -4.8071211e-031 -0.38466057 4.3298698e-015 -9.6142423e-031 
		-0.57699114 4.3298698e-015 -9.6142423e-031 -0.57699114 4.3298698e-015 -9.6142423e-031 
		-0.57699114 2.1649349e-015 -9.6142423e-031 -0.57699114 1.0824674e-015 -9.6142423e-031 
		-0.57699114 0 -9.6142423e-031 -0.57699114 -1.0824674e-015 -9.6142423e-031 -0.57699114 
		-2.1649349e-015 -9.6142423e-031 -0.57699114 -4.3298698e-015 -9.6142423e-031 -0.57699114 
		-4.3298698e-015 -9.6142423e-031 -0.57699114 -4.3298698e-015 -9.6142423e-031 -0.57699114 
		4.3298698e-015 -9.6142423e-031 -0.76932126 4.3298698e-015 -9.6142423e-031 -0.76932126 
		4.3298698e-015 -9.6142423e-031 -0.76932126 2.1649349e-015 -9.6142423e-031 -0.76932126 
		1.0824674e-015 -9.6142423e-031 -0.76932126 0 -9.6142423e-031 -0.76932126 -1.0824674e-015 
		-9.6142423e-031 -0.76932126 -2.1649349e-015 -9.6142423e-031 -0.76932126 -4.3298698e-015 
		-9.6142423e-031 -0.76932126 -4.3298698e-015 -9.6142423e-031 -0.76932126 -4.3298698e-015 
		-9.6142423e-031 -0.76932126 4.3298698e-015 -9.6142423e-031 -0.96165228 4.3298698e-015 
		-9.6142423e-031 -0.96165228 4.3298698e-015 -9.6142423e-031 -0.96165228 2.1649349e-015 
		-9.6142423e-031 -0.96165228 1.0824674e-015 -9.6142423e-031 -0.96165228 0 -9.6142423e-031 
		-0.96165228 -1.0824674e-015 -9.6142423e-031 -0.96165228 -2.1649349e-015 -9.6142423e-031 
		-0.96165228 -4.3298698e-015 -9.6142423e-031 -0.96165228 -4.3298698e-015 -9.6142423e-031 
		-0.96165228 -4.3298698e-015 -9.6142423e-031 -0.96165228;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "1BE39A4E-4DAB-6EC8-28B7-14831542C2FB";
	setAttr -s 7 ".lnk";
	setAttr -s 7 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "11DA99C8-4106-86FB-3BE8-CBB39FF7529F";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "DF66DDD6-43AD-DFC8-36DF-C4B0D43A54F5";
createNode displayLayerManager -n "layerManager";
	rename -uid "1F7CB8B0-4A73-3200-56E3-4BAF75ADA979";
	setAttr ".cdl" 1;
	setAttr ".dli[1]"  1;
	setAttr -s 2 ".dli";
createNode displayLayer -n "defaultLayer";
	rename -uid "A34DF88F-4864-151B-8156-37A56EEB1402";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "06D7B74B-49DB-1B5F-C685-4C9F9DC5E3A1";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "693013AC-4FE9-4E5E-0DB0-5DAFAA086E43";
	setAttr ".g" yes;
createNode reference -n "penguin_rigRN";
	rename -uid "D83A0112-4AFA-044F-047E-54AD8A888257";
	setAttr -s 192 ".phl";
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
	setAttr ".phl[88]" 0;
	setAttr ".phl[89]" 0;
	setAttr ".phl[90]" 0;
	setAttr ".phl[91]" 0;
	setAttr ".phl[92]" 0;
	setAttr ".phl[93]" 0;
	setAttr ".phl[94]" 0;
	setAttr ".phl[95]" 0;
	setAttr ".phl[96]" 0;
	setAttr ".phl[97]" 0;
	setAttr ".phl[98]" 0;
	setAttr ".phl[99]" 0;
	setAttr ".phl[100]" 0;
	setAttr ".phl[101]" 0;
	setAttr ".phl[102]" 0;
	setAttr ".phl[103]" 0;
	setAttr ".phl[104]" 0;
	setAttr ".phl[105]" 0;
	setAttr ".phl[106]" 0;
	setAttr ".phl[107]" 0;
	setAttr ".phl[108]" 0;
	setAttr ".phl[109]" 0;
	setAttr ".phl[110]" 0;
	setAttr ".phl[111]" 0;
	setAttr ".phl[112]" 0;
	setAttr ".phl[113]" 0;
	setAttr ".phl[114]" 0;
	setAttr ".phl[115]" 0;
	setAttr ".phl[116]" 0;
	setAttr ".phl[117]" 0;
	setAttr ".phl[118]" 0;
	setAttr ".phl[119]" 0;
	setAttr ".phl[120]" 0;
	setAttr ".phl[121]" 0;
	setAttr ".phl[122]" 0;
	setAttr ".phl[123]" 0;
	setAttr ".phl[124]" 0;
	setAttr ".phl[125]" 0;
	setAttr ".phl[126]" 0;
	setAttr ".phl[127]" 0;
	setAttr ".phl[128]" 0;
	setAttr ".phl[129]" 0;
	setAttr ".phl[130]" 0;
	setAttr ".phl[131]" 0;
	setAttr ".phl[132]" 0;
	setAttr ".phl[133]" 0;
	setAttr ".phl[134]" 0;
	setAttr ".phl[135]" 0;
	setAttr ".phl[136]" 0;
	setAttr ".phl[137]" 0;
	setAttr ".phl[138]" 0;
	setAttr ".phl[139]" 0;
	setAttr ".phl[140]" 0;
	setAttr ".phl[141]" 0;
	setAttr ".phl[142]" 0;
	setAttr ".phl[143]" 0;
	setAttr ".phl[144]" 0;
	setAttr ".phl[145]" 0;
	setAttr ".phl[146]" 0;
	setAttr ".phl[147]" 0;
	setAttr ".phl[148]" 0;
	setAttr ".phl[149]" 0;
	setAttr ".phl[150]" 0;
	setAttr ".phl[151]" 0;
	setAttr ".phl[152]" 0;
	setAttr ".phl[153]" 0;
	setAttr ".phl[154]" 0;
	setAttr ".phl[155]" 0;
	setAttr ".phl[156]" 0;
	setAttr ".phl[157]" 0;
	setAttr ".phl[158]" 0;
	setAttr ".phl[159]" 0;
	setAttr ".phl[160]" 0;
	setAttr ".phl[161]" 0;
	setAttr ".phl[162]" 0;
	setAttr ".phl[163]" 0;
	setAttr ".phl[164]" 0;
	setAttr ".phl[165]" 0;
	setAttr ".phl[166]" 0;
	setAttr ".phl[167]" 0;
	setAttr ".phl[168]" 0;
	setAttr ".phl[169]" 0;
	setAttr ".phl[170]" 0;
	setAttr ".phl[171]" 0;
	setAttr ".phl[172]" 0;
	setAttr ".phl[173]" 0;
	setAttr ".phl[174]" 0;
	setAttr ".phl[175]" 0;
	setAttr ".phl[176]" 0;
	setAttr ".phl[177]" 0;
	setAttr ".phl[178]" 0;
	setAttr ".phl[179]" 0;
	setAttr ".phl[180]" 0;
	setAttr ".phl[181]" 0;
	setAttr ".phl[182]" 0;
	setAttr ".phl[183]" 0;
	setAttr ".phl[184]" 0;
	setAttr ".phl[185]" 0;
	setAttr ".phl[186]" 0;
	setAttr ".phl[187]" 0;
	setAttr ".phl[188]" 0;
	setAttr ".phl[189]" 0;
	setAttr ".phl[190]" 0;
	setAttr ".phl[191]" 0;
	setAttr ".phl[192]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"penguin_rigRN"
		"penguin_rigRN" 0
		"penguin_rig:MDL:whiskey_the_stout_penguin_color_vmatRN" 0
		"penguin_rig:MDLRN" 0
		"penguin_rig:MDL:whiskey_the_stout_color_vmatRN" 0
		"penguin_rigRN" 404
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL" "translate" " -type \"double3\" 0 0 0.041535093624209374"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL" "translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL" "translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL" "translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL" "rotate" " -type \"double3\" 0 0 0"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL" "rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL" "rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL" "rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"translate" " -type \"double3\" 0 0 0.041535093624209374"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL" 
		"position" " -av -k 1 5"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL" 
		"translate" " -type \"double3\" 0 3.0600244636906249 -79.259228295823249"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL" 
		"rotate" " -type \"double3\" -91.340822058679606 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL|penguin_rig:BodyOffsetAdj_NUL|penguin_rig:Root_CTRL_HmNUL|penguin_rig:Root_CTRL_SpaceNUL|penguin_rig:Root_CTRL_AnimNUL|penguin_rig:Root_CTRL" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL|penguin_rig:BodyOffsetAdj_NUL|penguin_rig:Root_CTRL_HmNUL|penguin_rig:Root_CTRL_SpaceNUL|penguin_rig:Root_CTRL_AnimNUL|penguin_rig:Root_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL|penguin_rig:BodyOffsetAdj_NUL|penguin_rig:Root_CTRL_HmNUL|penguin_rig:Root_CTRL_SpaceNUL|penguin_rig:Root_CTRL_AnimNUL|penguin_rig:Root_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL|penguin_rig:BodyOffsetAdj_NUL|penguin_rig:Root_CTRL_HmNUL|penguin_rig:Root_CTRL_SpaceNUL|penguin_rig:Root_CTRL_AnimNUL|penguin_rig:Root_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL" 
		"translate" " -type \"double3\" -2.022018519438344 1.359273632584368 0.068083459835715815"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL" 
		"rotate" " -type \"double3\" 2.3958161235734043 -0.34682847253233856 -65.869472440105184"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL" 
		"translate" " -type \"double3\" 0.041389296936982387 0.0034770823162730271 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL" 
		"rotate" " -type \"double3\" 0 0 35.75255387699044"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL" 
		"translate" " -type \"double3\" 1.8190615629062425 1.1206778855597013 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL" 
		"rotate" " -type \"double3\" 19.645032431443376 -0.99605279445419037 -14.122312133098896"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL" 
		"rotate" " -type \"double3\" 13.619715970617483 -1.6670600672931952 -5.4363475805906454"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL" 
		"rotate" " -type \"double3\" 0 0 -27.630986547313611"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL" 
		"translate" " -type \"double3\" 1.1928607474148913 -0.23071546838274859 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL" 
		"rotate" " -type \"double3\" 0 0 -14.617484622428909"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL" 
		"translate" " -type \"double3\" -0.005191819359064008 0.041209331638776756 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL" 
		"rotate" " -type \"double3\" 0 0 9.2573835679468885"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL" 
		"translate" " -type \"double3\" 0 0 0.041535093624209374"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL" 
		"translate" " -type \"double3\" -0.68347498870850598 0.37426133989034216 -0.003685032128601455"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL" 
		"translate" " -type \"double3\" -0.034265187188067876 -0.023474305982010835 0.00013382078103535259"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL" 
		"translate" " -type \"double3\" 0 0 0.04153509362420936"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL" 
		"translate" " -type \"double3\" 0.041412428578642704 -0.0029539263536311174 0.0012037776738148911"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL" 
		"translate" " -type \"double3\" 0.034265187188067689 0.023474305982011015 -0.00013382078103715074"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL" 
		"translate" " -type \"double3\" 3.4318373722171501e-005 0.0023196588123321872 -0.041470254491809369"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL" 
		"rotate" " -type \"double3\" -5.2834095521150131 -7.2975707019714591 -14.341371281352462"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL" 
		"translate" " -type \"double3\" -0.0075738371627475688 -0.014214537710198514 -0.038285087314636812"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL" 
		"rotate" " -type \"double3\" -7.2436830101263805 -10.035333045722306 -10.975649303365508"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL" 
		"translate" " -type \"double3\" -0.33650306246074357 0.26814388086933527 0.098087286968018494"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL" 
		"rotate" " -type \"double3\" -54.584230496626475 25.558718504168695 68.272430312375789"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL" 
		"translate" " -type \"double3\" 3.4318373722171501e-005 0.0023196588123321872 -0.041470254491809369"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL" 
		"rotate" " -type \"double3\" -5.2834095521150131 -7.2975707019714591 -14.341371281352462"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL" 
		"translate" " -type \"double3\" -0.0075738371627475688 -0.014214537710198514 -0.038285087314636812"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL" 
		"rotate" " -type \"double3\" -7.2436830101263805 -10.035333045722306 -10.975649303365508"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL" 
		"translate" " -type \"double3\" -0.33650306246074357 0.26814388086933527 0.098087286968018494"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL" 
		"rotate" " -type \"double3\" -54.584230496626475 25.558718504168695 68.272430312375789"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL" 
		"translate" " -type \"double3\" 0 2.2188368015010167 -65.481489136832707"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL" 
		"rotate" " -type \"double3\" -43.038028134329522 -7.8311053787228015 1.1183767738297483"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegPV_R_CTRL_HmNUL|penguin_rig:LegPV_R_CTRL_SpaceNUL|penguin_rig:LegPV_R_CTRL_AnimNUL|penguin_rig:LegPV_R_CTRL" 
		"translate" " -type \"double3\" 0 40.791215130894699 -81.069739527868521"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegPV_R_CTRL_HmNUL|penguin_rig:LegPV_R_CTRL_SpaceNUL|penguin_rig:LegPV_R_CTRL_AnimNUL|penguin_rig:LegPV_R_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegPV_R_CTRL_HmNUL|penguin_rig:LegPV_R_CTRL_SpaceNUL|penguin_rig:LegPV_R_CTRL_AnimNUL|penguin_rig:LegPV_R_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegPV_R_CTRL_HmNUL|penguin_rig:LegPV_R_CTRL_SpaceNUL|penguin_rig:LegPV_R_CTRL_AnimNUL|penguin_rig:LegPV_R_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL" 
		"translate" " -type \"double3\" 0 2.2188368015010513 -65.481489136832693"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL" 
		"rotate" " -type \"double3\" -37.17271354948624 -4.8552461350576017 -1.1619230942584453"
		
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegPV_L_CTRL_HmNUL|penguin_rig:LegPV_L_CTRL_SpaceNUL|penguin_rig:LegPV_L_CTRL_AnimNUL|penguin_rig:LegPV_L_CTRL" 
		"translate" " -type \"double3\" 0 40.791215130894699 -81.069739527868506"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegPV_L_CTRL_HmNUL|penguin_rig:LegPV_L_CTRL_SpaceNUL|penguin_rig:LegPV_L_CTRL_AnimNUL|penguin_rig:LegPV_L_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegPV_L_CTRL_HmNUL|penguin_rig:LegPV_L_CTRL_SpaceNUL|penguin_rig:LegPV_L_CTRL_AnimNUL|penguin_rig:LegPV_L_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegPV_L_CTRL_HmNUL|penguin_rig:LegPV_L_CTRL_SpaceNUL|penguin_rig:LegPV_L_CTRL_AnimNUL|penguin_rig:LegPV_L_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"translate" " -type \"double3\" 0 0 0.041535093624209374"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"translateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"translateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"translateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"rotateX" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"rotateY" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"rotateZ" " -av"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"track" " -av -k 1 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"trackOffsetX" " -av -k 1 0"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"trackOffsetY" " -av -k 1 -8.9723994398099993"
		2 "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL" 
		"trackOffsetZ" " -av -k 1 0"
		2 "|penguin_rig:mirrorPlane" "translate" " -type \"double3\" 0 0 0.041535093624209374"
		
		2 "|penguin_rig:mirrorPlane" "translateX" " -av"
		2 "|penguin_rig:mirrorPlane" "translateY" " -av"
		2 "|penguin_rig:mirrorPlane" "translateZ" " -av"
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[2]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[3]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[4]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[5]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[6]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[7]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL.position" 
		"penguin_rigRN.placeHolderList[8]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[9]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[10]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[11]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[12]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[13]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[14]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[15]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[16]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[17]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[18]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[19]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[20]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL|penguin_rig:BodyOffsetAdj_NUL|penguin_rig:Root_CTRL_HmNUL|penguin_rig:Root_CTRL_SpaceNUL|penguin_rig:Root_CTRL_AnimNUL|penguin_rig:Root_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[21]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL|penguin_rig:BodyOffsetAdj_NUL|penguin_rig:Root_CTRL_HmNUL|penguin_rig:Root_CTRL_SpaceNUL|penguin_rig:Root_CTRL_AnimNUL|penguin_rig:Root_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[22]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL|penguin_rig:BodyOffsetAdj_NUL|penguin_rig:Root_CTRL_HmNUL|penguin_rig:Root_CTRL_SpaceNUL|penguin_rig:Root_CTRL_AnimNUL|penguin_rig:Root_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[23]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:BodyOffsetNUL|penguin_rig:Body_CTRL_HmNUL|penguin_rig:Body_CTRL_SpaceNUL|penguin_rig:Body_CTRL_AnimNUL|penguin_rig:Body_CTRL|penguin_rig:_CTRL_ATTRIBUTES.bodyOffset" 
		"penguin_rigRN.placeHolderList[24]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[25]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[26]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[27]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[28]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[29]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE|penguin_rig:__TailChain|penguin_rig:TailChainRig_HmNUL|penguin_rig:TailChainFK_HmNUL|penguin_rig:TailChainFK_0_CTRL_HmNUL|penguin_rig:TailChainFK_0_CTRL_SpaceNUL|penguin_rig:TailChainFK_0_CTRL_AnimNUL|penguin_rig:TailChainFK_0_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[30]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[31]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[32]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[33]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[34]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[35]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineRig_4_JNT|penguin_rig:SpineRig_5_JNT|penguin_rig:SpineChildPartParent_NUL|penguin_rig:__MouthChain|penguin_rig:MouthChainRig_HmNUL|penguin_rig:MouthChainFK_HmNUL|penguin_rig:MouthChainFK_0_CTRL_HmNUL|penguin_rig:MouthChainFK_0_CTRL_SpaceNUL|penguin_rig:MouthChainFK_0_CTRL_AnimNUL|penguin_rig:MouthChainFK_0_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[36]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[37]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[38]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[39]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[40]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[41]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineRig_3_JNT|penguin_rig:SpineFK_4_CTRL_HmNUL|penguin_rig:SpineFK_4_CTRL_SpaceNUL|penguin_rig:SpineFK_4_CTRL_AnimNUL|penguin_rig:SpineFK_4_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[42]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[43]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[44]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[45]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[46]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[47]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineRig_2_JNT|penguin_rig:SpineFK_3_CTRL_HmNUL|penguin_rig:SpineFK_3_CTRL_SpaceNUL|penguin_rig:SpineFK_3_CTRL_AnimNUL|penguin_rig:SpineFK_3_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[48]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[49]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[50]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[51]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[52]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[53]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineRig_1_JNT|penguin_rig:SpineFK_2_CTRL_HmNUL|penguin_rig:SpineFK_2_CTRL_SpaceNUL|penguin_rig:SpineFK_2_CTRL_AnimNUL|penguin_rig:SpineFK_2_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[54]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[55]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[56]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[57]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[58]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[59]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineRig_0_JNT|penguin_rig:SpineFK_1_CTRL_HmNUL|penguin_rig:SpineFK_1_CTRL_SpaceNUL|penguin_rig:SpineFK_1_CTRL_AnimNUL|penguin_rig:SpineFK_1_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[60]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[61]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[62]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[63]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[64]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[65]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE1|penguin_rig:__Spine|penguin_rig:SpineRig_HmNUL|penguin_rig:SpineFK_HmNUL|penguin_rig:SpineFK_0_CTRL_HmNUL|penguin_rig:SpineFK_0_CTRL_SpaceNUL|penguin_rig:SpineFK_0_CTRL_AnimNUL|penguin_rig:SpineFK_0_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[66]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[67]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[68]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[69]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.ikBlend" 
		"penguin_rigRN.placeHolderList[70]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.ikStretch" 
		"penguin_rigRN.placeHolderList[71]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.fk_vis" 
		"penguin_rigRN.placeHolderList[72]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.ik_vis" 
		"penguin_rigRN.placeHolderList[73]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.secondary_vis" 
		"penguin_rigRN.placeHolderList[74]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.annotation_vis" 
		"penguin_rigRN.placeHolderList[75]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.toePivotTwist" 
		"penguin_rigRN.placeHolderList[76]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.sideToSideBank" 
		"penguin_rigRN.placeHolderList[77]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.toeRoll" 
		"penguin_rigRN.placeHolderList[78]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.ballHeelRoll" 
		"penguin_rigRN.placeHolderList[79]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegFK_R_HmNUL|penguin_rig:LegFK_0_R_CTRL_HmNUL|penguin_rig:LegFK_0_R_CTRL_SpaceNUL|penguin_rig:LegFK_0_R_CTRL_AnimNUL|penguin_rig:LegFK_0_R_CTRL|penguin_rig:LegFK_1_R_CTRL_HmNUL|penguin_rig:LegFK_1_R_CTRL_SpaceNUL|penguin_rig:LegFK_1_R_CTRL_AnimNUL|penguin_rig:LegFK_1_R_CTRL|penguin_rig:LegFK_2_R_CTRL_HmNUL|penguin_rig:LegFK_2_R_CTRL_SpaceNUL|penguin_rig:LegFK_2_R_CTRL_AnimNUL|penguin_rig:LegFK_2_R_CTRL|penguin_rig:LegFkchildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootFK_0_R_CTRL_HmNUL|penguin_rig:FootFK_0_R_CTRL_SpaceNUL|penguin_rig:FootFK_0_R_CTRL_AnimNUL|penguin_rig:FootFK_0_R_CTRL|penguin_rig:FootFK_1_R_CTRL_HmNUL|penguin_rig:FootFK_1_R_CTRL_SpaceNUL|penguin_rig:FootFK_1_R_CTRL_AnimNUL|penguin_rig:FootFK_1_R_CTRL|penguin_rig:Foot_R_staleSharedShapeParent_SHP.toeTip" 
		"penguin_rigRN.placeHolderList[80]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[81]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[82]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[83]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[84]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[85]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootBallHeelRollB_R_SDK_HmNUL|penguin_rig:FootBallHeelRollB_R_SDK|penguin_rig:FootRevIK_0_R_CTRL_HmNUL|penguin_rig:FootRevIK_0_R_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_R_CTRL_AnimNUL|penguin_rig:FootRevIK_0_R_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[86]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[87]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[88]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[89]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[90]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[91]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE2|penguin_rig:__RightLeg|penguin_rig:LegBase_R_CTRL_HmNUL|penguin_rig:LegBase_R_CTRL_SpaceNUL|penguin_rig:LegBase_R_CTRL_AnimNUL|penguin_rig:LegBase_R_CTRL|penguin_rig:LegBaseOffset_R_NUL|penguin_rig:LegIKChildParentDriverBase_R_NUL|penguin_rig:LegIKChildParentDriverLimit_R_NUL|penguin_rig:LegIKChildParentDriver_R_NUL|penguin_rig:LegIkChildParent_R_NUL|penguin_rig:__RightFoot|penguin_rig:FootBallHeelRollH_R_SDK_HmNUL|penguin_rig:FootBallHeelRollH_R_SDK|penguin_rig:FootHeel_R_CTRL_HmNUL|penguin_rig:FootHeel_R_CTRL_SpaceNUL|penguin_rig:FootHeel_R_CTRL_AnimNUL|penguin_rig:FootHeel_R_CTRL|penguin_rig:FootToePivotTwist_R_SDK_HmNUL|penguin_rig:FootToePivotTwist_R_SDK|penguin_rig:FootBall_R_CTRL_HmNUL|penguin_rig:FootBall_R_CTRL_SpaceNUL|penguin_rig:FootBall_R_CTRL_AnimNUL|penguin_rig:FootBall_R_CTRL|penguin_rig:FootSideToSideBankOuter_R_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_R_SDK|penguin_rig:FootInner_R_CTRL_HmNUL|penguin_rig:FootInner_R_CTRL_SpaceNUL|penguin_rig:FootInner_R_CTRL_AnimNUL|penguin_rig:FootInner_R_CTRL|penguin_rig:FootSideToSideBankInner_R_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_R_SDK|penguin_rig:FootOuter_R_CTRL_HmNUL|penguin_rig:FootOuter_R_CTRL_SpaceNUL|penguin_rig:FootOuter_R_CTRL_AnimNUL|penguin_rig:FootOuter_R_CTRL|penguin_rig:FootToeRoll_R_SDK_HmNUL|penguin_rig:FootToeRoll_R_SDK|penguin_rig:FootTip_R_CTRL_HmNUL|penguin_rig:FootTip_R_CTRL_SpaceNUL|penguin_rig:FootTip_R_CTRL_AnimNUL|penguin_rig:FootTip_R_CTRL|penguin_rig:FootToeTip_R_SDK_HmNUL|penguin_rig:FootToeTip_R_SDK|penguin_rig:FootIKToe_0_R_CTRL_HmNUL|penguin_rig:FootIKToe_0_R_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_R_CTRL_AnimNUL|penguin_rig:FootIKToe_0_R_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[92]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[93]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[94]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[95]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.ikBlend" 
		"penguin_rigRN.placeHolderList[96]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.ikStretch" 
		"penguin_rigRN.placeHolderList[97]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.fk_vis" 
		"penguin_rigRN.placeHolderList[98]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.ik_vis" 
		"penguin_rigRN.placeHolderList[99]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.secondary_vis" 
		"penguin_rigRN.placeHolderList[100]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.annotation_vis" 
		"penguin_rigRN.placeHolderList[101]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.toePivotTwist" 
		"penguin_rigRN.placeHolderList[102]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.sideToSideBank" 
		"penguin_rigRN.placeHolderList[103]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.toeRoll" 
		"penguin_rigRN.placeHolderList[104]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.ballHeelRoll" 
		"penguin_rigRN.placeHolderList[105]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegFK_L_HmNUL|penguin_rig:LegFK_0_L_CTRL_HmNUL|penguin_rig:LegFK_0_L_CTRL_SpaceNUL|penguin_rig:LegFK_0_L_CTRL_AnimNUL|penguin_rig:LegFK_0_L_CTRL|penguin_rig:LegFK_1_L_CTRL_HmNUL|penguin_rig:LegFK_1_L_CTRL_SpaceNUL|penguin_rig:LegFK_1_L_CTRL_AnimNUL|penguin_rig:LegFK_1_L_CTRL|penguin_rig:LegFK_2_L_CTRL_HmNUL|penguin_rig:LegFK_2_L_CTRL_SpaceNUL|penguin_rig:LegFK_2_L_CTRL_AnimNUL|penguin_rig:LegFK_2_L_CTRL|penguin_rig:LegFkchildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootFK_0_L_CTRL_HmNUL|penguin_rig:FootFK_0_L_CTRL_SpaceNUL|penguin_rig:FootFK_0_L_CTRL_AnimNUL|penguin_rig:FootFK_0_L_CTRL|penguin_rig:FootFK_1_L_CTRL_HmNUL|penguin_rig:FootFK_1_L_CTRL_SpaceNUL|penguin_rig:FootFK_1_L_CTRL_AnimNUL|penguin_rig:FootFK_1_L_CTRL|penguin_rig:Foot_L_staleSharedShapeParent_SHP.toeTip" 
		"penguin_rigRN.placeHolderList[106]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[107]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[108]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[109]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[110]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[111]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootBallHeelRollB_L_SDK_HmNUL|penguin_rig:FootBallHeelRollB_L_SDK|penguin_rig:FootRevIK_0_L_CTRL_HmNUL|penguin_rig:FootRevIK_0_L_CTRL_SpaceNUL|penguin_rig:FootRevIK_0_L_CTRL_AnimNUL|penguin_rig:FootRevIK_0_L_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[112]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[113]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[114]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[115]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[116]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[117]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:pelvis__SURROGATE3|penguin_rig:__LeftLeg|penguin_rig:LegBase_L_CTRL_HmNUL|penguin_rig:LegBase_L_CTRL_SpaceNUL|penguin_rig:LegBase_L_CTRL_AnimNUL|penguin_rig:LegBase_L_CTRL|penguin_rig:LegBaseOffset_L_NUL|penguin_rig:LegIKChildParentDriverBase_L_NUL|penguin_rig:LegIKChildParentDriverLimit_L_NUL|penguin_rig:LegIKChildParentDriver_L_NUL|penguin_rig:LegIkChildParent_L_NUL|penguin_rig:__LeftFoot|penguin_rig:FootBallHeelRollH_L_SDK_HmNUL|penguin_rig:FootBallHeelRollH_L_SDK|penguin_rig:FootHeel_L_CTRL_HmNUL|penguin_rig:FootHeel_L_CTRL_SpaceNUL|penguin_rig:FootHeel_L_CTRL_AnimNUL|penguin_rig:FootHeel_L_CTRL|penguin_rig:FootToePivotTwist_L_SDK_HmNUL|penguin_rig:FootToePivotTwist_L_SDK|penguin_rig:FootBall_L_CTRL_HmNUL|penguin_rig:FootBall_L_CTRL_SpaceNUL|penguin_rig:FootBall_L_CTRL_AnimNUL|penguin_rig:FootBall_L_CTRL|penguin_rig:FootSideToSideBankOuter_L_SDK_HmNUL|penguin_rig:FootSideToSideBankOuter_L_SDK|penguin_rig:FootInner_L_CTRL_HmNUL|penguin_rig:FootInner_L_CTRL_SpaceNUL|penguin_rig:FootInner_L_CTRL_AnimNUL|penguin_rig:FootInner_L_CTRL|penguin_rig:FootSideToSideBankInner_L_SDK_HmNUL|penguin_rig:FootSideToSideBankInner_L_SDK|penguin_rig:FootOuter_L_CTRL_HmNUL|penguin_rig:FootOuter_L_CTRL_SpaceNUL|penguin_rig:FootOuter_L_CTRL_AnimNUL|penguin_rig:FootOuter_L_CTRL|penguin_rig:FootToeRoll_L_SDK_HmNUL|penguin_rig:FootToeRoll_L_SDK|penguin_rig:FootTip_L_CTRL_HmNUL|penguin_rig:FootTip_L_CTRL_SpaceNUL|penguin_rig:FootTip_L_CTRL_AnimNUL|penguin_rig:FootTip_L_CTRL|penguin_rig:FootToeTip_L_SDK_HmNUL|penguin_rig:FootToeTip_L_SDK|penguin_rig:FootIKToe_0_L_CTRL_HmNUL|penguin_rig:FootIKToe_0_L_CTRL_SpaceNUL|penguin_rig:FootIKToe_0_L_CTRL_AnimNUL|penguin_rig:FootIKToe_0_L_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[118]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[119]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[120]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[121]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[122]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[123]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainRig_1_R_JNT|penguin_rig:ArmChainFK_2_R_CTRL_HmNUL|penguin_rig:ArmChainFK_2_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_R_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[124]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[125]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[126]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[127]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[128]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[129]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainRig_0_R_JNT|penguin_rig:ArmChainFK_1_R_CTRL_HmNUL|penguin_rig:ArmChainFK_1_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_R_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[130]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[131]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[132]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[133]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[134]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[135]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE1|penguin_rig:__RightArmChain|penguin_rig:ArmChainRig_R_HmNUL|penguin_rig:ArmChainFK_R_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_HmNUL|penguin_rig:ArmChainFK_0_R_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_R_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_R_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[136]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[137]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[138]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[139]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[140]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[141]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainRig_1_L_JNT|penguin_rig:ArmChainFK_2_L_CTRL_HmNUL|penguin_rig:ArmChainFK_2_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_2_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_2_L_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[142]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[143]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[144]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[145]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[146]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[147]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainRig_0_L_JNT|penguin_rig:ArmChainFK_1_L_CTRL_HmNUL|penguin_rig:ArmChainFK_1_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_1_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_1_L_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[148]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[149]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[150]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[151]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[152]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[153]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__surrogates|penguin_rig:spine_2__SURROGATE2|penguin_rig:__LeftArmChain|penguin_rig:ArmChainRig_L_HmNUL|penguin_rig:ArmChainFK_L_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_HmNUL|penguin_rig:ArmChainFK_0_L_CTRL_SpaceNUL|penguin_rig:ArmChainFK_0_L_CTRL_AnimNUL|penguin_rig:ArmChainFK_0_L_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[154]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[155]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[156]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[157]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[158]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[159]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegRig_R_HmNUL|penguin_rig:LegRevIK_R_CTRL_HmNUL|penguin_rig:LegRevIK_R_CTRL_SpaceNUL|penguin_rig:LegRevIK_R_CTRL_AnimNUL|penguin_rig:LegRevIK_R_CTRL|penguin_rig:LegIK_R_CTRL_HmNUL|penguin_rig:LegIK_R_CTRL_SpaceNUL|penguin_rig:LegIK_R_CTRL_AnimNUL|penguin_rig:LegIK_R_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[160]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegPV_R_CTRL_HmNUL|penguin_rig:LegPV_R_CTRL_SpaceNUL|penguin_rig:LegPV_R_CTRL_AnimNUL|penguin_rig:LegPV_R_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[161]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegPV_R_CTRL_HmNUL|penguin_rig:LegPV_R_CTRL_SpaceNUL|penguin_rig:LegPV_R_CTRL_AnimNUL|penguin_rig:LegPV_R_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[162]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__RightLeg|penguin_rig:LegPV_R_CTRL_HmNUL|penguin_rig:LegPV_R_CTRL_SpaceNUL|penguin_rig:LegPV_R_CTRL_AnimNUL|penguin_rig:LegPV_R_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[163]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[164]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[165]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[166]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[167]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[168]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegRig_L_HmNUL|penguin_rig:LegRevIK_L_CTRL_HmNUL|penguin_rig:LegRevIK_L_CTRL_SpaceNUL|penguin_rig:LegRevIK_L_CTRL_AnimNUL|penguin_rig:LegRevIK_L_CTRL|penguin_rig:LegIK_L_CTRL_HmNUL|penguin_rig:LegIK_L_CTRL_SpaceNUL|penguin_rig:LegIK_L_CTRL_AnimNUL|penguin_rig:LegIK_L_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[169]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegPV_L_CTRL_HmNUL|penguin_rig:LegPV_L_CTRL_SpaceNUL|penguin_rig:LegPV_L_CTRL_AnimNUL|penguin_rig:LegPV_L_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[170]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegPV_L_CTRL_HmNUL|penguin_rig:LegPV_L_CTRL_SpaceNUL|penguin_rig:LegPV_L_CTRL_AnimNUL|penguin_rig:LegPV_L_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[171]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:World_CTRL|penguin_rig:Fly_CTRL_HmNUL|penguin_rig:Fly_CTRL|penguin_rig:Scale_CTRL_HmNUL|penguin_rig:Scale_CTRL|penguin_rig:Rig_NUL|penguin_rig:__LeftLeg|penguin_rig:LegPV_L_CTRL_HmNUL|penguin_rig:LegPV_L_CTRL_SpaceNUL|penguin_rig:LegPV_L_CTRL_AnimNUL|penguin_rig:LegPV_L_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[172]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.track" 
		"penguin_rigRN.placeHolderList[173]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.trackOffsetX" 
		"penguin_rigRN.placeHolderList[174]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.trackOffsetY" 
		"penguin_rigRN.placeHolderList[175]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.trackOffsetZ" 
		"penguin_rigRN.placeHolderList[176]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.translateX" 
		"penguin_rigRN.placeHolderList[177]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.translateY" 
		"penguin_rigRN.placeHolderList[178]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.translateZ" 
		"penguin_rigRN.placeHolderList[179]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.rotateX" 
		"penguin_rigRN.placeHolderList[180]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.rotateY" 
		"penguin_rigRN.placeHolderList[181]" ""
		5 4 "penguin_rigRN" "|penguin_rig:WHISKEY_HEX|penguin_rig:ExportRelativeAllTranslate|penguin_rig:ExportRelative_CTRL_HmNUL|penguin_rig:ExportRelative_CTRL_SpaceNUL|penguin_rig:ExportRelative_CTRL_AnimNUL|penguin_rig:ExportRelative_CTRL.rotateZ" 
		"penguin_rigRN.placeHolderList[182]" ""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.translateX" "penguin_rigRN.placeHolderList[183]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.translateY" "penguin_rigRN.placeHolderList[184]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.translateZ" "penguin_rigRN.placeHolderList[185]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.visibility" "penguin_rigRN.placeHolderList[186]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.rotateX" "penguin_rigRN.placeHolderList[187]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.rotateY" "penguin_rigRN.placeHolderList[188]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.rotateZ" "penguin_rigRN.placeHolderList[189]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.scaleX" "penguin_rigRN.placeHolderList[190]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.scaleY" "penguin_rigRN.placeHolderList[191]" 
		""
		5 4 "penguin_rigRN" "|penguin_rig:mirrorPlane.scaleZ" "penguin_rigRN.placeHolderList[192]" 
		""
		"penguin_rig:MDLRN" 1
		5 3 "penguin_rigRN" "|penguin_rig:MDL:pelvis.message" "penguin_rigRN.placeHolderList[1]" 
		""
		"penguin_rig:MDL:whiskey_the_stout_penguin_color_vmatRN" 1
		2 "penguin_rig:MDL:whiskey_the_stout_penguin_color_vmat:dota2_hero_shaderfx" 
		"shaderparams" " -type \"string\" \"fresnelWarpColor~278~fresnelWarpRim~278~fresnelWarpSpec~278~cubeMap~278~color~278~normal~278~specularMask~278~specularColor~319~specularExponent~317~specularScale~317~rimMask~278~rimLightColor~319~rimLightScale~317~selfIllumMask~278~translucency~278~metalnessMask~278~cubeMapScalar~317~\"";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode animCurveTL -n "animCurveTL1";
	rename -uid "58BAF5D1-44B1-56B8-F1A7-CE99D765551E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.0075738371627475688 2 -0.0075738371627475688
		 5 -0.0075738371627475688 7 -0.0075738371627475688 10 -0.0075738371627475688 13 0
		 18 -0.0075738371627475688 22 -0.0075738371627475688 24 -0.0075738371627475688 26 -0.0075738371627475688
		 28 -0.0075738371627475688;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL2";
	rename -uid "55F88BA0-4352-73C0-0BD8-BC981162D44D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.014214537710198514 2 -0.014214537710198514
		 5 -0.014214537710198514 7 -0.014214537710198514 10 -0.014214537710198514 13 0 18 -0.014214537710198514
		 22 -0.014214537710198514 24 -0.014214537710198514 26 -0.014214537710198514 28 -0.014214537710198514;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL3";
	rename -uid "E2C8F33D-4E09-1DD7-83B1-24A3714E6F8F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.038285087314636812 2 -0.038285087314636812
		 5 -0.038285087314636812 7 -0.038285087314636812 10 -0.038285087314636812 13 0 18 -0.038285087314636812
		 22 -0.038285087314636812 24 -0.038285087314636812 26 -0.038285087314636812 28 -0.038285087314636812;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA1";
	rename -uid "74754B73-40AE-F09B-7DA6-F9BFC3405033";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 14.757940875061685 13 5.3447468465936527
		 18 13.468910930986913 22 -20.034400634233887 24 -22.692264387138433 26 -7.2436830101263805
		 28 -7.2926171059756459 30 -7.221254655507451;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 1 1 0.43203181028366089 1 1 1 
		1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0 0 -0.90185832977294922 0 0 
		0 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 1 1 0.43203181028366089 1 1 1 
		1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0 0 -0.90185832977294922 0 0 
		0 0;
createNode animCurveTA -n "animCurveTA2";
	rename -uid "B46824F2-4F06-5488-7491-66A6C55415E5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 5.4496231476200334 13 14.348100857448012
		 18 -6.7880686546189297 22 -4.3198537031798034 24 -9.4493609302805268 26 -10.035333045722306
		 28 -10.18565748854917 30 -10.360564477762647;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 0.62405312061309814 1 1 1 0.90841400623321533 
		0.99538743495941162 0.99909502267837524 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0.78138190507888794 0 0 0 -0.41807159781455994 
		-0.09593643993139267 -0.042534168809652328 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 0.62405318021774292 1 1 1 0.90841400623321533 
		0.99538743495941162 0.99909502267837524 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0.78138196468353271 0 0 0 -0.41807159781455994 
		-0.09593643993139267 -0.042534168809652328 0;
createNode animCurveTA -n "animCurveTA3";
	rename -uid "6E46A8F8-4DBF-FCDE-DAC7-9DA5BA04712F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 -69.135797015291189 13 -5.3901012214301014
		 18 5.1173272850635865 22 -2.9434567598901404 24 -10.797805905361779 26 -10.975649303365508
		 28 -3.2413381334075271 30 0.19849697391886523;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 0.28992646932601929 1 0.58431345224380493 
		0.99038553237915039 1 0.56438040733337402 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0.95704895257949829 0 -0.81152808666229248 
		-0.1383349597454071 0 0.82551485300064087 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 0.28992646932601929 1 0.58431345224380493 
		0.99038553237915039 1 0.56438040733337402 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0.95704889297485352 0 -0.81152808666229248 
		-0.1383349597454071 0 0.82551485300064087 0;
createNode animCurveTL -n "animCurveTL4";
	rename -uid "6EC4F52D-4D76-D7B9-5939-FDA80F086E2C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 9.0201238488159277e-016 2 9.0201238488159277e-016
		 5 0 7 0 10 0 18 9.0201238488159277e-016 22 9.0201238488159277e-016 25 9.0201238488159277e-016;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL5";
	rename -uid "B3FFEEB3-412B-9719-F735-EA8D491C15CE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -6.6382815391151613e-016 2 -6.6382815391151613e-016
		 5 0 7 0 10 0 18 -6.6382815391151613e-016 22 -6.6382815391151613e-016 25 -6.6382815391151613e-016;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL6";
	rename -uid "CF1DC4BB-4228-03D4-95C3-5AAB1AFF13C7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0.041535093624209374 2 0.041535093624209374
		 5 0.041535093624209374 7 0.041535093624209374 10 0.041535093624209374 18 0.041535093624209374
		 22 0.041535093624209374 25 0.041535093624209374;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL7";
	rename -uid "7026FC62-49EB-D7FC-DF7E-4FB25DCB399D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.0075738371627475688 2 -0.0075738371627475688
		 5 -0.0075738371627475688 7 -0.0075738371627475688 10 -0.0075738371627475688 13 0
		 18 -0.0075738371627475688 22 -0.0075738371627475688 24 -0.0075738371627475688 26 -0.0075738371627475688
		 28 -0.0075738371627475688;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL8";
	rename -uid "A2A75FF2-496C-A338-61BB-1F8E529E8EE1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.014214537710198514 2 -0.014214537710198514
		 5 -0.014214537710198514 7 -0.014214537710198514 10 -0.014214537710198514 13 0 18 -0.014214537710198514
		 22 -0.014214537710198514 24 -0.014214537710198514 26 -0.014214537710198514 28 -0.014214537710198514;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL9";
	rename -uid "47DAA896-440D-219E-E87E-EBB15BC6698D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.038285087314636812 2 -0.038285087314636812
		 5 -0.038285087314636812 7 -0.038285087314636812 10 -0.038285087314636812 13 0 18 -0.038285087314636812
		 22 -0.038285087314636812 24 -0.038285087314636812 26 -0.038285087314636812 28 -0.038285087314636812;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA4";
	rename -uid "27ABD996-4B44-F484-F020-EC88A7A7AFB1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 14.757940875061685 13 5.3447468465936527
		 18 13.468910930986913 22 -20.034400634233887 24 -22.692264387138433 26 -7.2436830101263805
		 28 -7.2926171059756459 30 -7.221254655507451;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 1 1 0.43203181028366089 1 1 1 
		1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0 0 -0.90185832977294922 0 0 
		0 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 1 1 0.43203181028366089 1 1 1 
		1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0 0 -0.90185832977294922 0 0 
		0 0;
createNode animCurveTA -n "animCurveTA5";
	rename -uid "3536B27D-4DB2-A6F2-65EC-E99D7F013EA6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 5.4496231476200334 13 14.348100857448012
		 18 -6.7880686546189297 22 -4.3198537031798034 24 -9.4493609302805268 26 -10.035333045722306
		 28 -10.18565748854917 30 -10.360564477762647;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 0.62405312061309814 1 1 1 0.90841400623321533 
		0.99538743495941162 0.99909502267837524 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0.78138190507888794 0 0 0 -0.41807159781455994 
		-0.09593643993139267 -0.042534168809652328 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 0.62405318021774292 1 1 1 0.90841400623321533 
		0.99538743495941162 0.99909502267837524 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0.78138196468353271 0 0 0 -0.41807159781455994 
		-0.09593643993139267 -0.042534168809652328 0;
createNode animCurveTA -n "animCurveTA6";
	rename -uid "96A24F34-416D-C4E9-C492-D8AAB932401D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 -69.135797015291189 13 -5.3901012214301014
		 18 5.1173272850635865 22 -2.9434567598901404 24 -10.797805905361779 26 -10.975649303365508
		 28 -3.2413381334075271 30 0.19849697391886523;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 0.28992646932601929 1 0.58431345224380493 
		0.99038553237915039 1 0.56438040733337402 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0.95704895257949829 0 -0.81152808666229248 
		-0.1383349597454071 0 0.82551485300064087 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 0.28992646932601929 1 0.58431345224380493 
		0.99038553237915039 1 0.56438040733337402 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0.95704889297485352 0 -0.81152808666229248 
		-0.1383349597454071 0 0.82551485300064087 0;
createNode animCurveTL -n "animCurveTL10";
	rename -uid "5488C9FA-4BC6-FC0D-88F5-56AE31FB8E68";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 8.8817841970012523e-016 2 8.8817841970012523e-016
		 7 8.8817841970012523e-016 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "animCurveTL11";
	rename -uid "599F4DB0-4264-086E-A3CF-81B8E2331032";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -6.6613381477509392e-016 2 -6.6613381477509392e-016
		 7 -6.6613381477509392e-016 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "animCurveTL12";
	rename -uid "150D828E-44CA-7E3D-5E8A-4B87CEBEA5F4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.041535093624209374 2 0.041535093624209374
		 7 0.041535093624209374 10 0.041535093624209374;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA7";
	rename -uid "389C0CB0-4C89-85DD-FA51-B5A155E2C53A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA8";
	rename -uid "EA3CCFCC-41CE-8A0A-DF89-9E9E23807442";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA9";
	rename -uid "0F8AFFEF-4B13-92FE-B340-43B39142AAEB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "animCurveTU1";
	rename -uid "4F62DBF1-4068-A5E7-6C6C-47A3A85F7373";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU2";
	rename -uid "00FE8699-47D9-8880-FDB6-EE9F2B03D3E3";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU3";
	rename -uid "01480201-4C7D-9876-EC9E-22B925FE10EE";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU4";
	rename -uid "76CD37B7-4E4B-BBEA-B49E-7A97D3ED5E29";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU5";
	rename -uid "0B0A7763-4769-190A-0C6B-ECAC855E7CB4";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU6";
	rename -uid "EF0B7484-4CC0-AD38-613B-1F9EAFA7C35C";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU7";
	rename -uid "A79CDF6C-4F3B-4FDD-186F-568C67504E15";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU8";
	rename -uid "FBF36AA2-451D-B93C-EECE-9F88D134A096";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU9";
	rename -uid "BDF5E307-4989-0E5B-90F7-6FBBC08E431A";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU10";
	rename -uid "A4E86468-41E3-2C66-AAEC-52A710520911";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU11";
	rename -uid "54C6A95B-42B7-224A-677A-A6BA4F671EE8";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTL -n "animCurveTL13";
	rename -uid "F60C84F0-4648-0EDD-067A-F1B1154AB0FD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 8.8817841970012523e-016 2 8.8817841970012523e-016
		 5 0 7 0 10 0 18 8.8817841970012523e-016 22 8.8817841970012523e-016 25 8.8817841970012523e-016;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL14";
	rename -uid "649D250F-402F-CAAC-76BB-EBA7C0FD9067";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -6.6613381477509392e-016 2 -6.6613381477509392e-016
		 5 26.527287683758395 7 37.487679477531003 10 44.490700846218132 18 50.822064655993231
		 22 48.221476695643304 25 40.791215130894699;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 0.0044458606280386448 0.0092777181416749954 
		0.027487440034747124 1 0.023255279287695885 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0.99999010562896729 0.99995690584182739 
		0.99962210655212402 0 -0.99972963333129883 0;
	setAttr -s 8 ".kox[0:7]"  1 1 0.0044458610936999321 0.00927771907299757 
		0.027487440034747124 1 0.023255275562405586 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0.99999016523361206 0.99995702505111694 
		0.99962210655212402 0 -0.99972951412200928 0;
createNode animCurveTL -n "animCurveTL15";
	rename -uid "BA23DB94-4E5E-CFE4-10DB-AC914B20DFB0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0.041535093624209374 2 0.041535093624209374
		 3 -46.089824366867596 5 -74.94530083867059 7 -85.674924955386217 10 -132.90640877034215
		 18 -130.40562552194487 22 -118.47999315742867 25 -81.069739527868521;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 0.0013335663825273514 0.0033682512585073709 
		0.0028754794038832188 1 0.035521991550922394 0.0047294311225414276 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 -0.99999916553497314 -0.99999433755874634 
		-0.99999582767486572 0 0.99936896562576294 0.999988853931427 0;
	setAttr -s 9 ".kox[0:8]"  1 1 0.0013335661496967077 0.0033682512585073709 
		0.0028754794038832188 1 0.035521987825632095 0.0047294311225414276 1;
	setAttr -s 9 ".koy[0:8]"  0 0 -0.99999910593032837 -0.99999433755874634 
		-0.99999582767486572 0 0.99936890602111816 0.99998879432678223 0;
createNode animCurveTU -n "animCurveTU12";
	rename -uid "297E154B-4F43-0FB3-6424-E5AB7553E227";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU13";
	rename -uid "3264FE41-4996-6F18-B206-87BEE72BD0A1";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU14";
	rename -uid "B59469CE-4735-957D-84BA-E38B772C572B";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU15";
	rename -uid "03382D05-47A3-9BAD-4000-2F891FB96E72";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU16";
	rename -uid "81B4B153-4FC8-3E21-03FE-3AA288E628F1";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU17";
	rename -uid "9D078614-4367-D3C4-1686-5C89ACED1A70";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU18";
	rename -uid "7D99F192-4387-53D5-A972-7FB322AF9B89";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU19";
	rename -uid "07E2D1AA-4208-0A00-98A5-C4BE68A651AA";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU20";
	rename -uid "9589C285-47EF-0782-3A56-13A65E53CA32";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU21";
	rename -uid "EEE69C6F-412B-FBA0-CEDA-4E85BDC69018";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "animCurveTU22";
	rename -uid "BBBE3EEA-44CF-1434-DB77-A8B87C29AC01";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTL -n "animCurveTL16";
	rename -uid "79C0070B-4439-4D75-9333-DC8DF8626D9F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 0.015902457311945496 2 0.015902457311945496
		 4 0.015902457311945496 6 0.015902457311945496 8 0.015902457311945496 11 0.015902457311945496
		 13 0.015902457311945496 18 0.015902457311945496 20 0.015902457311945496 22 0.015902457311945496
		 24 0.015902457311945496 25 -0.86909992138374859 26 -0.33650306246074357 29 0.015902457311945496;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.14897745847702026 
		1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0.98884057998657227 
		0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.14897745847702026 
		1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0.98884063959121704 
		0;
createNode animCurveTL -n "animCurveTL17";
	rename -uid "FEB993BF-45D6-881B-BF17-9597CD8DD49D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 -5.7009968514111801e-005 2 -5.7009968514111801e-005
		 4 -5.7009968514111801e-005 6 -5.7009968514111801e-005 8 -5.7009968514111801e-005
		 11 -5.7009968514111801e-005 13 -5.7009968514111801e-005 18 -5.7009968514111801e-005
		 20 -5.7009968514111801e-005 22 -5.7009968514111801e-005 24 -5.7009968514111801e-005
		 25 0.69152158898358973 26 0.26814388086933527 29 -5.7009968514111801e-005;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.18930938839912415 
		1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 -0.98191750049591064 
		0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.18930938839912415 
		1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 -0.98191750049591064 
		0;
createNode animCurveTL -n "animCurveTL18";
	rename -uid "DD77B75D-44C1-49E0-70A5-4DA589712036";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 -0.038370204634289043 2 -0.038370204634289043
		 4 -0.038370204634289043 6 -0.038370204634289043 8 -0.038370204634289043 11 -0.038370204634289043
		 13 -0.038370204634289043 18 -0.038370204634289043 20 -0.038370204634289043 22 -0.038370204634289043
		 24 -0.038370204634289043 25 0.25607324442574586 26 0.098087286968018494 29 -0.038370204634289043;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.41250866651535034 
		1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 -0.91095370054244995 
		0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.41250869631767273 
		1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 -0.91095370054244995 
		0;
createNode animCurveTA -n "animCurveTA10";
	rename -uid "2986293C-4B69-AF4C-E234-4EA5DABDB00C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 25.192702822265453 2 18.027882692118336
		 4 -25.164555285503557 6 -2.9389915971413716 8 -9.5294376448429059 11 -61.714786604041834
		 13 -74.922002398239925 18 -122.99926697732187 20 -136.09233916644746 22 -127.02919317889634
		 24 -87.378686631947517 25 -59.376543190537554 26 -54.584230496626475 29 -57.465980324810147;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 0.11304921656847 1 1 0.18968723714351654 
		0.14449772238731384 0.21313446760177612 0.2135140597820282 1 0.1549297422170639 0.084388971328735352 
		0.13168512284755707 1 1;
	setAttr -s 14 ".kiy[0:13]"  0 -0.99358940124511719 0 0 -0.98184460401535034 
		-0.9895051121711731 -0.97702288627624512 -0.97694003582000732 0 0.98792546987533569 
		0.99643290042877197 0.9912915825843811 0 0;
	setAttr -s 14 ".kox[0:13]"  1 0.11304921656847 1 1 0.18968725204467773 
		0.14449773728847504 0.21313445270061493 0.2135140597820282 1 0.1549297422170639 0.084388978779315948 
		0.13168512284755707 1 1;
	setAttr -s 14 ".koy[0:13]"  0 -0.99358940124511719 0 0 -0.98184454441070557 
		-0.9895051121711731 -0.97702288627624512 -0.97693997621536255 0 0.98792546987533569 
		0.99643290042877197 0.9912915825843811 0 0;
createNode animCurveTA -n "animCurveTA11";
	rename -uid "CEBD8943-4322-07CA-9846-7F8BB56057EE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 3.4771253752525295 2 -55.733916034805283
		 4 -79.478268826627442 6 -64.152487014475057 8 -49.486206171246813 11 -2.8231860929790713
		 13 -17.200264033234085 18 -29.696010244690896 20 -32.952566134319049 22 -50.879555752796193
		 24 -5.4945205371608647 25 18.845829922701824 26 25.558718504168695 29 16.27544784068526;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 0.068904027342796326 1 0.24683386087417603 
		0.1538514643907547 1 0.44541630148887634 0.64707386493682861 0.36413517594337463 
		1 0.081897422671318054 0.1220853328704834 1 1;
	setAttr -s 14 ".kiy[0:13]"  0 -0.9976232647895813 0 0.96905785799026489 
		0.98809397220611572 0 -0.89532351493835449 -0.76242733001708984 -0.93134605884552002 
		0 0.99664080142974854 0.9925195574760437 0 0;
	setAttr -s 14 ".kox[0:13]"  1 0.068904027342796326 1 0.24683386087417603 
		0.1538514643907547 1 0.44541636109352112 0.64707386493682861 0.36413517594337463 
		1 0.081897415220737457 0.1220853328704834 1 1;
	setAttr -s 14 ".koy[0:13]"  0 -0.9976232647895813 0 0.96905785799026489 
		0.98809397220611572 0 -0.89532357454299927 -0.76242727041244507 -0.93134605884552002 
		0 0.99664074182510376 0.9925195574760437 0 0;
createNode animCurveTA -n "animCurveTA12";
	rename -uid "0F494CB3-4D8D-CE84-AB0B-969EC61FCF05";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 -28.38265080144371 2 -42.9793538294821
		 4 21.874228100734598 6 -5.5544071158783703 8 -6.5955155313111717 11 29.018839039369979
		 13 73.403966306013373 18 120.29681751408677 20 126.56896344045455 22 96.923086119487337
		 24 74.111468933593869 25 67.401067443066523 26 68.272430312375789 29 70.23411090369423;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 0.77414590120315552 1 0.11852554976940155 
		0.14491870999336243 0.24387051165103912 1 0.14411082863807678 0.19052307307720184 
		1 0.93760389089584351 1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 -0.63300710916519165 0 0.99295103549957275 
		0.98944354057312012 0.96980780363082886 0 -0.98956155776977539 -0.98168271780014038 
		0 0.34770527482032776 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 0.77414596080780029 1 0.11852555721998215 
		0.14491870999336243 0.24387054145336151 1 0.14411082863807678 0.19052307307720184 
		1 0.93760383129119873 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 -0.63300716876983643 0 0.99295097589492798 
		0.98944360017776489 0.96980786323547363 0 -0.98956155776977539 -0.98168271780014038 
		0 0.34770527482032776 0;
createNode animCurveTA -n "animCurveTA13";
	rename -uid "E8DAC2BF-4901-FCEA-A43C-50A285DE5A49";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA14";
	rename -uid "AF1C17F4-4AF8-E6BB-CAFA-34B4B158C629";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA15";
	rename -uid "5CE5F56C-4E45-A9CA-E0AE-53BD0EFA082D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL19";
	rename -uid "0B6F4C46-4B7A-696E-118D-9483BA98FB7A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 9.1123502833590433e-016 2 9.1123502833590433e-016
		 5 0 7 0 10 0 18 9.1123502833590433e-016 22 9.1123502833590433e-016 25 9.1123502833590433e-016;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL20";
	rename -uid "A08B57C8-4E08-FA0C-67AB-87B0C6839AE6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -7.5144326672747743e-016 2 -7.5144326672747743e-016
		 5 0 7 0 10 0 18 -7.5144326672747743e-016 22 -7.5144326672747743e-016 25 -7.5144326672747743e-016;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL21";
	rename -uid "D6EE1227-4B0E-01A0-B9C4-7D86D5356A49";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0.04153509362420936 2 0.04153509362420936
		 5 0.04153509362420936 7 0.04153509362420936 10 0.04153509362420936 18 0.04153509362420936
		 22 0.04153509362420936 25 0.04153509362420936;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL22";
	rename -uid "07A4F935-4830-037F-A6E8-FEB2CD575BEA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0.014823876686038594 2 0.014823876686038594
		 3 0 5 0 7 0 10 0 15 0 18 0 22 0 25 0 28 0;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL23";
	rename -uid "664E922C-490D-726D-E984-0390D1026455";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0.03879969951390308 2 0.03879969951390308
		 3 0 5 0 7 0 10 0 15 0 18 0 22 0 25 0 28 0;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL24";
	rename -uid "06FB801C-4F89-DEC9-6A22-C3BA95791885";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 6.1330609841159328e-016 2 6.1330609841159328e-016
		 5 0 7 0 10 0 15 4.1925215546879708e-016 18 4.1925215546879708e-016 22 6.1330609841159328e-016
		 25 6.1330609841159328e-016 28 6.1330609841159328e-016;
	setAttr -s 10 ".kit[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kot[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kix[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[0:9]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA16";
	rename -uid "3A05B3E5-4846-3F87-0BEB-2699FF204C33";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 1.9878466759126272e-016 2 1.9878466759126272e-016
		 5 0 7 0 10 0 15 1.3588793683550605e-016 18 1.3588793683550605e-016 22 0 25 0 28 0;
	setAttr -s 10 ".kit[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kot[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kix[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[0:9]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA17";
	rename -uid "44632B9C-4E73-E79B-3706-858A784DF331";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 -6.8967285906917861e-033 2 -6.8967285906917861e-033
		 5 0 7 0 10 0 15 -4.7145598826091075e-033 18 -4.7145598826091075e-033 22 0 25 0 28 0;
	setAttr -s 10 ".kit[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kot[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kix[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[0:9]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA18";
	rename -uid "8D2E1136-45BA-534F-2038-EF968882BDF0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 3.9756933518309839e-015 2 15.490363074583108
		 5 25.159899101267808 7 25.159899101267808 10 12.208042417397536 15 22.131167272221152
		 18 22.131167272221152 22 1.0314997056134734 25 -25.985005130875756 28 -28.324030536502327;
	setAttr -s 10 ".kit[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kot[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kix[0:9]"  1 0.29053771495819092 1 1 1 1 1 0.26770725846290588 
		0.63246613740921021 1;
	setAttr -s 10 ".kiy[0:9]"  0 0.95686352252960205 0 0 0 0 0 -0.96350032091140747 
		-0.77458798885345459 0;
	setAttr -s 10 ".kox[0:9]"  1 0.29053771495819092 1 1 1 1 1 0.2677072286605835 
		0.63246619701385498 1;
	setAttr -s 10 ".koy[0:9]"  0 0.95686358213424683 0 0 0 0 0 -0.96350032091140747 
		-0.77458798885345459 0;
createNode animCurveTL -n "animCurveTL25";
	rename -uid "7BD39B8C-4FA0-6C23-B304-84A9FC60E951";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 8.8817841970012523e-016 2 8.8817841970012523e-016
		 7 8.8817841970012523e-016 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "animCurveTL26";
	rename -uid "BA97D7AC-492A-FDBA-B0F3-F5AC094739F8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -6.6613381477509392e-016 2 -6.6613381477509392e-016
		 7 -6.6613381477509392e-016 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "animCurveTL27";
	rename -uid "C45CF3A5-4DEC-AE91-B6C0-16B6584C8541";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.041535093624209374 2 0.041535093624209374
		 7 0.041535093624209374 10 0.041535093624209374;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA19";
	rename -uid "38529702-4714-5EA1-5FD0-269659773556";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA20";
	rename -uid "441E8AA9-4655-D425-19EE-DB966F9F0E97";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA21";
	rename -uid "5C546BF0-49E8-1744-46F1-7D9638F354DD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "animCurveTU23";
	rename -uid "C7EAEB13-44E4-C60F-B19A-8C8FAA968966";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5 2 5 7 5 10 5;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "animCurveTL28";
	rename -uid "FE98EBBB-4F37-8D7A-A762-958A3566B7A0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 8.8443172079681138e-016 2 8.8443172079681138e-016
		 5 0 7 0 10 -2.3029402215224927e-015 15 1.2643861829267997e-015 18 3.8772400438281722e-015
		 22 3.3980676231409211e-015 23 2.9628805455340656e-015 25 4.6838292203255112e-015;
	setAttr -s 10 ".kit[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kot[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kix[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".kiy[0:9]"  0 0 0 0 0 0 0 0 0 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 1 1 1 1 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL29";
	rename -uid "D190474C-4472-225F-EC1C-1B9B2E4D44A1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -5.8762978142494557e-016 2 -5.8762978142494557e-016
		 5 13.593685737835392 7 28.597850588297025 10 40.261825119658518 15 42.731828058073773
		 18 42.869333516634299 22 36.63458938435997 23 21.942668579945011 24 6.8129467740182719
		 25 2.2188368015010167;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 0.0058278441429138184 0.0062495335005223751 
		0.022486412897706032 0.23559126257896423 1 0.0079640652984380722 0.0022355071268975735 
		0.0033799861557781696 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0.99998301267623901 0.99998050928115845 
		0.99974715709686279 0.97185224294662476 0 -0.99996823072433472 -0.99999749660491943 
		-0.99999427795410156 0;
	setAttr -s 11 ".kox[0:10]"  1 1 0.0058278446085751057 0.0062495325691998005 
		0.022486411035060883 0.23559123277664185 1 0.0079640652984380722 0.0022355071268975735 
		0.0033799863886088133 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0.99998307228088379 0.99998044967651367 
		0.99974709749221802 0.97185224294662476 0 -0.99996823072433472 -0.99999749660491943 
		-0.99999427795410156 0;
createNode animCurveTL -n "animCurveTL30";
	rename -uid "C0163CA3-470D-C1D7-AA4F-499763E8CD46";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0.041535093624209388 2 3.1040393295882263
		 3 -42.28561959625938 5 -52.450704654582069 7 -62.837555594832388 10 -84.86335882032337
		 15 -96.127689166688342 18 -94.626562890601647 22 -88.955286092318843 23 -75.297190594671207
		 25 -65.481489136832707;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 0.0021861272398382425 0.0064874915406107903 
		0.0051419567316770554 0.0080101238563656807 1 0.032514899969100952 0.0086221331730484962 
		0.004260028712451458 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 -0.99999761581420898 -0.99997895956039429 
		-0.99998676776885986 -0.99996793270111084 0 0.99947124719619751 0.99996280670166016 
		0.99999094009399414 0;
	setAttr -s 11 ".kox[0:10]"  1 1 0.0021861272398382425 0.0064874920062720776 
		0.0051419567316770554 0.0080101238563656807 1 0.032514899969100952 0.0086221331730484962 
		0.0042600291781127453 1;
	setAttr -s 11 ".koy[0:10]"  0 0 -0.99999755620956421 -0.99997895956039429 
		-0.99998676776885986 -0.99996793270111084 0 0.99947124719619751 0.99996280670166016 
		0.99999094009399414 0;
createNode animCurveTA -n "animCurveTA22";
	rename -uid "C2734849-47F3-175B-7556-C59716E5C839";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 2 -26.010409805527921 5 -26.010409805527921
		 7 -26.010409805527921 10 -117.01432905425303 15 -144.37622713856973 18 -171.98465227239521
		 22 -173.9310039874882 23 -90.779934944574947 25 -37.424766417905573 28 -59.075896629692636;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 0.12801967561244965 0.2677958607673645 
		0.7945016622543335 1 0.041936073452234268 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 -0.9917716383934021 -0.96347570419311523 
		-0.60726195573806763 0 0.99912029504776001 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 0.12801967561244965 0.2677958607673645 
		0.7945016622543335 1 0.041936073452234268 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 -0.9917716383934021 -0.96347570419311523 
		-0.60726195573806763 0 0.99912029504776001 0 0;
createNode animCurveTA -n "animCurveTA23";
	rename -uid "5671B596-406A-A40D-4D82-3BB8B70D445E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 -1.870215806158164 2 -1.6809046381672503
		 5 -1.6809046381672503 7 -1.6809046381672503 10 -1.6809046381672563 15 -1.5093891727146422
		 18 -1.4300019783672862 22 -2.8178888311851544 23 -4.7252568235304686 25 -7.8311053787228015;
	setAttr -s 10 ".kit[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kot[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kix[0:9]"  1 1 1 1 1 0.99986517429351807 1 0.94529992341995239 
		0.75258725881576538 1;
	setAttr -s 10 ".kiy[0:9]"  0 0 0 0 0 0.016419325023889542 0 -0.32620254158973694 
		-0.65849250555038452 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 0.99986517429351807 1 0.94529986381530762 
		0.75258725881576538 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 0.016419326886534691 0 -0.32620254158973694 
		-0.6584925651550293 0;
createNode animCurveTA -n "animCurveTA24";
	rename -uid "C43E371A-46C7-183F-AC1E-19A29D53D3E5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 0 2 0.8200363995176736 5 0.8200363995176736
		 7 0.8200363995176736 10 0.82003639951767304 15 -1.5638531049314071 18 -2.667253890935763
		 22 -1.3285601945085366 23 -0.71843086359024677 25 1.1183767738297483;
	setAttr -s 10 ".kit[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kot[0:9]"  1 18 18 18 18 18 18 18 
		18 18;
	setAttr -s 10 ".kix[0:9]"  1 1 1 1 1 0.97492808103561401 1 0.97980427742004395 
		0.9196438193321228 1;
	setAttr -s 10 ".kiy[0:9]"  0 0 0 0 0 -0.2225201427936554 0 0.19995877146720886 
		0.39275342226028442 0;
	setAttr -s 10 ".kox[0:9]"  1 1 1 1 1 0.97492814064025879 1 0.97980427742004395 
		0.91964375972747803 1;
	setAttr -s 10 ".koy[0:9]"  0 0 0 0 0 -0.2225201278924942 0 0.19995875656604767 
		0.39275339245796204 0;
createNode animCurveTL -n "animCurveTL31";
	rename -uid "497C5E99-440A-229A-DFC0-04AB6C33CD14";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0.041412428578642704 2 0.041412428578642704
		 5 0.041412428578642704 7 0.041412428578642704 10 0.041412428578642704 18 0.041412428578642704
		 22 0.041412428578642704 25 0.041412428578642704;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL32";
	rename -uid "664BD54C-43A5-C1AF-72FB-C0A2508713F5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -0.0029539263536311174 2 -0.0029539263536311174
		 5 -0.0029539263536311174 7 -0.0029539263536311174 10 -0.0029539263536311174 18 -0.0029539263536311174
		 22 -0.0029539263536311174 25 -0.0029539263536311174;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL33";
	rename -uid "F8EC75BE-430D-B43A-5D82-83B4D35342F7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0.0012037776738148911 2 0.0012037776738148911
		 5 0.0012037776738148911 7 0.0012037776738148911 10 0.0012037776738148911 18 0.0012037776738148911
		 22 0.0012037776738148911 25 0.0012037776738148911;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA25";
	rename -uid "06505F78-4BDF-F78C-06A7-6B826AE65E67";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA26";
	rename -uid "E54F835E-441B-8F04-008A-A8831B34A687";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA27";
	rename -uid "2AA7E3A8-44E9-B11F-6E0F-029CB33C9B01";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL34";
	rename -uid "F1D1FEFF-42D5-A793-3828-26A650A8F312";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0.023329758827009689 2 0.55364006701483071
		 3 7.0146920674962665 5 0 7 0 10 0 15 0 18 0 22 0 23 0 25 0 26 0;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 0.020947497338056564 1 1 1 1 1 1 1 1 
		1 1;
	setAttr -s 12 ".kiy[0:11]"  0 0.99978059530258179 0 0 0 0 0 0 0 0 0 
		0;
	setAttr -s 12 ".kox[0:11]"  1 0.020947497338056564 1 1 1 1 1 1 1 1 
		1 1;
	setAttr -s 12 ".koy[0:11]"  0 0.99978059530258179 0 0 0 0 0 0 0 0 0 
		0;
createNode animCurveTL -n "animCurveTL35";
	rename -uid "F0C12D9E-45C3-7907-C610-CDA86183AF58";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0.034364027055125597 2 0.71463759914852099
		 3 4.7645441332199745 5 0 7 0 10 0 15 0 18 0 22 0 23 0 25 0 26 0;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 0.016331121325492859 1 1 1 1 1 1 1 1 
		1 1;
	setAttr -s 12 ".kiy[0:11]"  0 0.99986660480499268 0 0 0 0 0 0 0 0 0 
		0;
	setAttr -s 12 ".kox[0:11]"  1 0.01633111946284771 1 1 1 1 1 1 1 1 1 
		1;
	setAttr -s 12 ".koy[0:11]"  0 0.99986660480499268 0 0 0 0 0 0 0 0 0 
		0;
createNode animCurveTL -n "animCurveTL36";
	rename -uid "8258D5AA-4155-CCA1-A7DF-DDB1A261376E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 1.2354636047555932e-015 2 1.2354636047555932e-015
		 5 0 7 0 10 0 15 5.7733248935436794e-016 18 5.7733248935436794e-016 22 9.0639848836630947e-016
		 23 1.2354636047555932e-015 25 1.2354636047555932e-015 26 1.2354636047555932e-015;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA28";
	rename -uid "71BADE21-4BFA-5555-BF38-D4A0AEADA868";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 -5.9635400277665295e-015 2 -5.9635400277665295e-015
		 5 0 7 0 10 0 15 6.884851959776042 18 6.884851959776042 22 5.3728434786363461 23 3.8608390530142307
		 25 13.224494266199487 26 13.619715970617483 29 13.496014297344839;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 1 1 0.95334017276763916 1 0.84959346055984497 
		1 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0 0 -0.30189803242683411 0 0.52743804454803467 
		0 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 1 1 0.95334017276763916 1 0.84959352016448975 
		1 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0 0 -0.30189800262451172 0 0.52743810415267944 
		0 0;
createNode animCurveTA -n "animCurveTA29";
	rename -uid "01D69595-4171-6BD4-458A-CA8EF2E64753";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 3.1805546814659327e-015 2 3.1805546814659327e-015
		 5 0 7 0 10 0 15 -4.934270978549864 18 -4.934270978549864 22 -3.8764263254199389 23 -1.760522203484336
		 25 3.530231199726114 26 -1.6670600672931952 29 -2.4184494612052361;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 1 1 0.94896167516708374 0.61186528205871582 
		1 0.93057096004486084 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0 0 0.31539148092269897 0.79096198081970215 
		0 -0.36611148715019226 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 1 1 0.94896161556243896 0.6118653416633606 
		1 0.93057101964950562 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0 0 0.31539145112037659 0.79096198081970215 
		0 -0.36611148715019226 0;
createNode animCurveTA -n "animCurveTA30";
	rename -uid "F39299E6-4393-E0FB-58E3-BEAE6928DB3B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 -6.3611093629547841e-015 2 15.49036307458312
		 3 25.290885606025824 5 34.96042163271057 7 34.96042163271057 8 18.281768942015066
		 10 18.281768942015066 15 -13.862016524574974 18 -13.862016524574974 22 -9.1568199533004453
		 23 -4.451636002330404 25 -22.958220843957417 26 -5.4363475805906454 29 -2.3028678977659669;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 0.14933779835700989 0.28230646252632141 
		1 1 1 1 1 1 0.71226847171783447 1 1 0.52044856548309326 1;
	setAttr -s 14 ".kiy[0:13]"  0 0.98878628015518188 0.95932430028915405 
		0 0 0 0 0 0 0.70190709829330444 0 0 0.85389304161071777 0;
	setAttr -s 14 ".kox[0:13]"  1 0.14933778345584869 0.28230643272399902 
		1 1 1 1 1 1 0.71226847171783447 1 1 0.52044856548309326 1;
	setAttr -s 14 ".koy[0:13]"  0 0.98878622055053711 0.95932424068450928 
		0 0 0 0 0 0 0.70190709829330444 0 0 0.85389304161071777 0;
createNode animCurveTL -n "animCurveTL37";
	rename -uid "8C7DCF68-4132-8EA0-69EC-0581AFFC9701";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 3.4318373722171501e-005 2 3.4318373722171501e-005
		 5 3.4318373722171501e-005 7 3.4318373722171501e-005 10 3.4318373722171501e-005 13 0
		 18 3.4318373722171501e-005 22 3.4318373722171501e-005 24 3.4318373722171501e-005
		 26 3.4318373722171501e-005 28 3.4318373722171501e-005;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL38";
	rename -uid "639FAD81-420D-BD82-A5A6-E0B39BD0A30A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0.0023196588123321872 2 0.0023196588123321872
		 5 0.0023196588123321872 7 0.0023196588123321872 10 0.0023196588123321872 13 0 18 0.0023196588123321872
		 22 0.0023196588123321872 24 0.0023196588123321872 26 0.0023196588123321872 28 0.0023196588123321872;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL39";
	rename -uid "6A1A123B-41C7-3C06-CACF-E8BB513C0725";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.041470254491809369 2 -0.041470254491809369
		 5 -0.041470254491809369 7 -0.041470254491809369 10 -0.041470254491809369 13 0 18 -0.041470254491809369
		 22 -0.041470254491809369 24 -0.041470254491809369 26 -0.041470254491809369 28 -0.041470254491809369;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA31";
	rename -uid "B5C69D47-431C-C74B-CA9B-9DBDE1D9C579";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 15.17466618809649 13 6.3874691429953954
		 18 12.721785602096084 22 -18.715119733637966 24 -20.223354848625206 26 -5.2834095521150131
		 28 -4.3171491611678832 30 -3.9028600552476398;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 1 1 0.64506804943084717 1 0.79658442735671997 
		0.98406064510345459 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0 0 -0.76412516832351685 0 0.60452723503112793 
		0.17783306539058685 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 1 1 0.64506804943084717 1 0.79658442735671997 
		0.98406064510345459 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0 0 -0.76412516832351685 0 0.60452723503112793 
		0.17783306539058685 0;
createNode animCurveTA -n "animCurveTA32";
	rename -uid "3D0F86A8-4219-C969-7648-70AB5C79D0FE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 12.59695203755035 13 15.166030573494639
		 18 -7.9444436485598411 22 -0.47566647088324793 24 -2.8881198273715434 26 -7.2975707019714591
		 28 -11.220285086507319 30 -13.069735036338708;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 0.60284572839736938 1 1 1 0.74589020013809204 
		0.67580246925354004 0.79786002635955811 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0.79785776138305664 0 0 0 -0.6660689115524292 
		-0.73708277940750122 -0.60284274816513062 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 0.60284572839736938 1 1 1 0.74589020013809204 
		0.67580246925354004 0.79786002635955811 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0.79785776138305664 0 0 0 -0.6660689115524292 
		-0.73708277940750122 -0.60284274816513062 0;
createNode animCurveTA -n "animCurveTA33";
	rename -uid "5181EB61-43E4-9FBF-D04F-E4A1249C3A69";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 -6.8285582153982771 13 1.5814194107333728
		 18 7.0651299404618442 22 -9.039334620422613 24 -18.521556291657127 26 -14.341371281352462
		 28 -7.9065753322278463 30 -5.1003121262445967;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 0.73984849452972412 1 0.40873691439628601 
		1 0.58413606882095337 0.63715499639511108 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0.67277359962463379 0 -0.91265225410461426 
		0 0.81165575981140137 0.77073574066162109 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 0.73984843492507935 1 0.40873691439628601 
		1 0.58413606882095337 0.63715499639511108 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0.67277359962463379 0 -0.91265225410461426 
		0 0.81165575981140137 0.77073574066162109 0;
createNode animCurveTL -n "animCurveTL40";
	rename -uid "D9D4A1B5-41C0-877B-E003-06BBB229FB53";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  1 0.012321654708615001 2 0.52554642360035708
		 3 7.8047503621247634 5 1.8190615629062425 7 1.8190615629062425 8 0.35721481836590752
		 10 0 15 1.2434989365898419 18 1.2434989365898419 22 1.5312806356928814 23 1.8190615629062425
		 24 1.8190615629062425 26 1.8190615629062425 27 1.8190615629062425 30 1.8190615629062425;
	setAttr -s 15 ".kit[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18;
	setAttr -s 15 ".kix[0:14]"  1 0.021644530817866325 1 1 1 0.062089651823043823 
		1 1 1 0.27814492583274841 1 1 1 1 1;
	setAttr -s 15 ".kiy[0:14]"  0 0.99976575374603271 0 0 0 -0.99807047843933105 
		0 0 0 0.96053910255432129 0 0 0 0 0;
	setAttr -s 15 ".kox[0:14]"  1 0.021644530817866325 1 1 1 0.06208965927362442 
		1 1 1 0.27814489603042603 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0.99976575374603271 0 0 0 -0.99807059764862061 
		0 0 0 0.96053916215896606 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL41";
	rename -uid "A8DF2F00-4AC2-530D-A358-8B82B2F4EE8E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  1 0.039665360550652951 2 0.73291963746136002
		 3 5.9912046149749001 5 1.1206778855597013 7 1.1206778855597013 8 5.9035764820847341
		 10 0 15 0.76608828825276409 18 0.76608828825276409 22 0.94338332467710051 23 1.1206778855597013
		 24 1.1206778855597013 26 1.1206778855597013 27 1.1206778855597013 30 1.1206778855597013;
	setAttr -s 15 ".kit[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18;
	setAttr -s 15 ".kix[0:14]"  1 0.01602541096508503 1 1 1 1 1 1 1 0.42538100481033325 
		1 1 1 1 1;
	setAttr -s 15 ".kiy[0:14]"  0 0.99987161159515381 0 0 0 0 0 0 0 0.90501433610916138 
		0 0 0 0 0;
	setAttr -s 15 ".kox[0:14]"  1 0.01602541096508503 1 1 1 1 1 1 1 0.42538103461265564 
		1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0.99987161159515381 0 0 0 0 0 0 0 0.90501433610916138 
		0 0 0 0 0;
createNode animCurveTL -n "animCurveTL42";
	rename -uid "5F1DDFAF-4B00-5384-F8E2-77A8F649C055";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 6.6746246154081587e-014 2 6.7061550925814484e-014
		 5 0 7 0 8 0 10 0 15 4.5627310150713228e-014 18 4.5627310150713228e-014 22 5.6186792313748386e-014
		 23 6.6746246154081587e-014 24 6.6746246154081587e-014 26 6.6746246154081587e-014
		 27 6.6746246154081587e-014 30 6.6746246154081587e-014;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA34";
	rename -uid "919FBB21-4475-8B06-78FB-039775F95DB9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 3.4818330110757486e-015 2 0 5 0 7 0 8 0
		 10 0 15 9.5566926576577238 18 9.5566926576577238 22 15.941756526375181 23 23.491752806739978
		 24 11.62177281414934 26 19.645032431443376 27 19.731991472008723 30 19.962768266262923;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 0.56527966260910034 1 1 
		0.9907994270324707 0.99913620948791504 1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 0.82489931583404541 0 0 
		0.13533832132816315 0.041555598378181458 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 0.56527966260910034 1 1 
		0.99079936742782593 0.99913620948791504 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0.82489925622940063 0 0 
		0.13533832132816315 0.041555598378181458 0;
createNode animCurveTA -n "animCurveTA35";
	rename -uid "D76EA543-442C-F452-B6EC-3EB4568EB86F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 3.1771592793014257e-015 2 0 5 0 7 0 8 0
		 10 0 15 -0.51475193375635975 18 -0.51475193375635975 22 -5.0582589616882858 23 -6.496406435678475
		 24 -16.816651383358579 26 -0.99605279445419037 27 3.6882864570540672 30 2.5126856571170579;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 0.84746551513671875 0.40478011965751648 
		1 0.26911565661430359 1 1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 -0.53085035085678101 -0.91441398859024048 
		0 0.9631078839302063 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 0.84746557474136353 0.40478014945983887 
		1 0.26911565661430359 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 -0.53085035085678101 -0.91441404819488525 
		0 0.9631078839302063 0 0;
createNode animCurveTA -n "animCurveTA36";
	rename -uid "D1EA65B1-4FE4-30FF-4D0F-999B80DD25B2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  1 0.11179679053739595 2 -17.149810316357723
		 3 -22.946825721206402 5 -6.3609333568054209 7 35.916344468913081 8 62.21424893153663
		 10 45.872114716017748 15 56.232830167009389 18 56.232830167009389 22 54.200619636483886
		 23 34.501980211634738 24 45.129209525947545 26 -14.122312133098896 27 -25.696620457567185
		 30 -20.895915968490435;
	setAttr -s 15 ".kit[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18;
	setAttr -s 15 ".kix[0:14]"  1 0.16342541575431824 1 0.12870356440544128 
		0.083261661231517792 1 1 1 1 0.7816128134727478 1 1 0.080633282661437988 1 1;
	setAttr -s 15 ".kiy[0:14]"  0 -0.98655569553375244 0 0.99168306589126587 
		0.99652773141860962 0 0 0 0 -0.62376397848129272 0 0 -0.99674385786056519 0 0;
	setAttr -s 15 ".kox[0:14]"  1 0.16342540085315704 1 0.12870356440544128 
		0.083261661231517792 1 1 1 1 0.7816128134727478 1 1 0.080633282661437988 1 1;
	setAttr -s 15 ".koy[0:14]"  0 -0.98655563592910767 0 0.99168306589126587 
		0.99652773141860962 0 0 0 0 -0.62376391887664795 0 0 -0.99674379825592041 0 0;
createNode animCurveTL -n "animCurveTL43";
	rename -uid "13AB72EA-4E2B-BEB2-B46B-4586C9DE9C1C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0.034265187188067689 2 0.034265187188067689
		 5 0.034265187188067689 7 0.034265187188067689 10 0.034265187188067689 18 0.034265187188067689
		 22 0.034265187188067689 25 0.034265187188067689;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL44";
	rename -uid "898F5E25-4B0C-F91B-C124-37A6FA4F1044";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0.023474305982011015 2 0.023474305982011015
		 5 0.023474305982011015 7 0.023474305982011015 10 0.023474305982011015 18 0.023474305982011015
		 22 0.023474305982011015 25 0.023474305982011015;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL45";
	rename -uid "635E6CFE-4A13-DD05-E128-B78554B014B2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -0.00013382078103715074 2 -0.00013382078103715074
		 5 -0.00013382078103715074 7 -0.00013382078103715074 10 -0.00013382078103715074 18 -0.00013382078103715074
		 22 -0.00013382078103715074 25 -0.00013382078103715074;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA37";
	rename -uid "300B7EBE-42CD-0615-0A83-A6B5C987AFFE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA38";
	rename -uid "E37DD088-4354-6544-7E2A-8BA498D978C4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA39";
	rename -uid "110F898E-4A5C-6146-18BD-37AEC4993AE5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL46";
	rename -uid "F4B81CBC-4F35-727E-80C9-F4A24375A587";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 8.9192511860343928e-016 2 8.9192511860343928e-016
		 5 0 7 0 10 0 18 3.6674577533622185e-015 22 3.5474016212329231e-015 24 5.1399274585692299e-015
		 25 2.8608685768648819e-015 26 2.8608685768648819e-015 29 2.8608685768648819e-015;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL47";
	rename -uid "26D95016-4A0A-F3CE-F5F2-07A7974AC5EA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 -6.3863602104419249e-016 2 -6.3863602104419249e-016
		 5 13.593685737835404 7 28.597850588297053 10 40.261825119658582 18 42.869333516634363
		 22 32.330326618454265 23 30.106781268767897 24 19.006467086978571 25 2.2188368015010513
		 26 2.2188368015010513 29 2.2188368015010513;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 0.0058278441429138184 0.0062495335005223751 
		0.03406979888677597 1 0.013057922013103962 0.0050034923478960991 0.0023905120324343443 
		1 1 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0.99998301267623901 0.99998050928115845 
		0.9994194507598877 0 -0.99991470575332642 -0.99998748302459717 -0.99999713897705078 
		0 0 0;
	setAttr -s 12 ".kox[0:11]"  1 1 0.0058278446085751057 0.0062495325691998005 
		0.034069802612066269 1 0.013057922013103962 0.0050034923478960991 0.0023905120324343443 
		1 1 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0.99998307228088379 0.99998044967651367 
		0.9994194507598877 0 -0.99991470575332642 -0.99998748302459717 -0.99999713897705078 
		0 0 0;
createNode animCurveTL -n "animCurveTL48";
	rename -uid "11DEADB6-4A41-356C-5508-6188EAD9DBFC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  1 0.041535093624209374 2 3.1040393295882258
		 3 -42.285619596259373 5 -52.450704654582061 7 -62.837555594832381 10 -90.700948293566967
		 18 -94.626562890601633 22 -86.083147504279268 23 -80.567967689387842 24 -71.307914455731108
		 25 -65.481489136832693 26 -65.481489136832693 29 -65.481489136832693;
	setAttr -s 13 ".kit[0:12]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kot[0:12]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18;
	setAttr -s 13 ".kix[0:12]"  1 1 0.0021861272398382425 0.0064874915406107903 
		0.0043572294525802135 0.02263750322163105 1 0.011854306794703007 0.0045120087452232838 
		0.0044189244508743286 1 1 1;
	setAttr -s 13 ".kiy[0:12]"  0 0 -0.99999761581420898 -0.99997895956039429 
		-0.99999052286148071 -0.9997437596321106 0 0.99992972612380981 0.99998980760574341 
		0.99999022483825684 0 0 0;
	setAttr -s 13 ".kox[0:12]"  1 1 0.0021861272398382425 0.0064874920062720776 
		0.0043572294525802135 0.02263750322163105 1 0.011854307726025581 0.0045120092108845711 
		0.0044189249165356159 1 1 1;
	setAttr -s 13 ".koy[0:12]"  0 0 -0.99999755620956421 -0.99997895956039429 
		-0.99999052286148071 -0.9997437596321106 0 0.99992972612380981 0.99998986721038818 
		0.99999028444290161 0 0 0;
createNode animCurveTA -n "animCurveTA40";
	rename -uid "548487CA-4B1A-93BE-B906-AD9931876310";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 -26.010409805527921 5 -26.010409805527921
		 7 -26.010409805527921 10 -148.00013696391858 18 -203.7384821237363 22 -160.55480847009608
		 23 -132.66489603527342 24 -98.02913688199807 25 -71.663051133499067 26 -37.17271354948624
		 29 -48.644721496295702;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 0.11738833785057068 1 0.13316129148006439 
		0.060976725071668625 0.062494043260812759 0.062642790377140045 1 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 -0.99308609962463379 0 0.99109429121017456 
		0.99813920259475708 0.99804532527923584 0.9980359673500061 0 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 0.11738833785057068 1 0.13316130638122559 
		0.060976721346378326 0.062494043260812759 0.062642790377140045 1 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 -0.99308609962463379 0 0.99109435081481934 
		0.99813920259475708 0.99804532527923584 0.9980359673500061 0 0;
createNode animCurveTA -n "animCurveTA41";
	rename -uid "377BA3DA-4B31-E349-28F5-35A5888B6AE8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 1.870215806158164 2 1.6809046381672503
		 5 1.6809046381672503 7 1.6809046381672503 10 -4.855246135057584 18 -4.8552461350576017
		 22 -4.8552461350576017 24 -4.8552461350576106 25 -4.8552461350576017 26 -4.8552461350576017
		 29 -4.8552461350575999;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA42";
	rename -uid "4C75A283-49E0-7A62-8327-A586176A605E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 2 -0.8200363995176736 5 -0.8200363995176736
		 7 -0.8200363995176736 10 -1.1619230942584582 18 -1.1619230942584453 22 -1.1619230942584453
		 24 -1.16192309425845 25 -1.1619230942584453 26 -1.1619230942584453 29 -1.161923094258446;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL49";
	rename -uid "E991C354-4505-3281-4DD8-E996A06103B4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 0.015902457311945496 2 0.015902457311945496
		 4 0.015902457311945496 6 0.015902457311945496 8 0.015902457311945496 11 0.015902457311945496
		 13 0.015902457311945496 18 0.015902457311945496 20 0.015902457311945496 22 0.015902457311945496
		 24 0.015902457311945496 25 -0.86909992138374859 26 -0.33650306246074357 29 0.015902457311945496;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.14897745847702026 
		1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0.98884057998657227 
		0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.14897745847702026 
		1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0.98884063959121704 
		0;
createNode animCurveTL -n "animCurveTL50";
	rename -uid "DCA3690B-4E9C-9F64-3A3A-138D3E5A296B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 -5.7009968514111801e-005 2 -5.7009968514111801e-005
		 4 -5.7009968514111801e-005 6 -5.7009968514111801e-005 8 -5.7009968514111801e-005
		 11 -5.7009968514111801e-005 13 -5.7009968514111801e-005 18 -5.7009968514111801e-005
		 20 -5.7009968514111801e-005 22 -5.7009968514111801e-005 24 -5.7009968514111801e-005
		 25 0.69152158898358973 26 0.26814388086933527 29 -5.7009968514111801e-005;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.18930938839912415 
		1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 -0.98191750049591064 
		0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.18930938839912415 
		1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 -0.98191750049591064 
		0;
createNode animCurveTL -n "animCurveTL51";
	rename -uid "974440F3-40CE-2665-A89F-5D9CDBF7C887";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 -0.038370204634289043 2 -0.038370204634289043
		 4 -0.038370204634289043 6 -0.038370204634289043 8 -0.038370204634289043 11 -0.038370204634289043
		 13 -0.038370204634289043 18 -0.038370204634289043 20 -0.038370204634289043 22 -0.038370204634289043
		 24 -0.038370204634289043 25 0.25607324442574586 26 0.098087286968018494 29 -0.038370204634289043;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.41250866651535034 
		1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 -0.91095370054244995 
		0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 0.41250869631767273 
		1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 -0.91095370054244995 
		0;
createNode animCurveTA -n "animCurveTA43";
	rename -uid "A325DC2F-458B-7A72-4915-8385FA3BB8DB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 25.192702822265453 2 18.027882692118336
		 4 -25.164555285503557 6 -2.9389915971413716 8 -9.5294376448429059 11 -61.714786604041834
		 13 -74.922002398239925 18 -122.99926697732187 20 -136.09233916644746 22 -127.02919317889634
		 24 -87.378686631947517 25 -59.376543190537554 26 -54.584230496626475 29 -57.465980324810147;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 0.11304921656847 1 1 0.18968723714351654 
		0.14449772238731384 0.21313446760177612 0.2135140597820282 1 0.1549297422170639 0.084388971328735352 
		0.13168512284755707 1 1;
	setAttr -s 14 ".kiy[0:13]"  0 -0.99358940124511719 0 0 -0.98184460401535034 
		-0.9895051121711731 -0.97702288627624512 -0.97694003582000732 0 0.98792546987533569 
		0.99643290042877197 0.9912915825843811 0 0;
	setAttr -s 14 ".kox[0:13]"  1 0.11304921656847 1 1 0.18968725204467773 
		0.14449773728847504 0.21313445270061493 0.2135140597820282 1 0.1549297422170639 0.084388978779315948 
		0.13168512284755707 1 1;
	setAttr -s 14 ".koy[0:13]"  0 -0.99358940124511719 0 0 -0.98184454441070557 
		-0.9895051121711731 -0.97702288627624512 -0.97693997621536255 0 0.98792546987533569 
		0.99643290042877197 0.9912915825843811 0 0;
createNode animCurveTA -n "animCurveTA44";
	rename -uid "B9E6982B-4D54-E38A-98F7-3B8F26756EE9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 3.4771253752525295 2 -55.733916034805283
		 4 -79.478268826627442 6 -64.152487014475057 8 -49.486206171246813 11 -2.8231860929790713
		 13 -17.200264033234085 18 -29.696010244690896 20 -32.952566134319049 22 -50.879555752796193
		 24 -5.4945205371608647 25 18.845829922701824 26 25.558718504168695 29 16.27544784068526;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 0.068904027342796326 1 0.24683386087417603 
		0.1538514643907547 1 0.44541630148887634 0.64707386493682861 0.36413517594337463 
		1 0.081897422671318054 0.1220853328704834 1 1;
	setAttr -s 14 ".kiy[0:13]"  0 -0.9976232647895813 0 0.96905785799026489 
		0.98809397220611572 0 -0.89532351493835449 -0.76242733001708984 -0.93134605884552002 
		0 0.99664080142974854 0.9925195574760437 0 0;
	setAttr -s 14 ".kox[0:13]"  1 0.068904027342796326 1 0.24683386087417603 
		0.1538514643907547 1 0.44541636109352112 0.64707386493682861 0.36413517594337463 
		1 0.081897415220737457 0.1220853328704834 1 1;
	setAttr -s 14 ".koy[0:13]"  0 -0.9976232647895813 0 0.96905785799026489 
		0.98809397220611572 0 -0.89532357454299927 -0.76242727041244507 -0.93134605884552002 
		0 0.99664074182510376 0.9925195574760437 0 0;
createNode animCurveTA -n "animCurveTA45";
	rename -uid "5DBCA2EC-481F-213D-6CF4-DBA662B25607";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  1 -28.38265080144371 2 -42.9793538294821
		 4 21.874228100734598 6 -5.5544071158783703 8 -6.5955155313111717 11 29.018839039369979
		 13 73.403966306013373 18 120.29681751408677 20 126.56896344045455 22 96.923086119487337
		 24 74.111468933593869 25 67.401067443066523 26 68.272430312375789 29 70.23411090369423;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18;
	setAttr -s 14 ".kix[0:13]"  1 1 1 0.77414590120315552 1 0.11852554976940155 
		0.14491870999336243 0.24387051165103912 1 0.14411082863807678 0.19052307307720184 
		1 0.93760389089584351 1;
	setAttr -s 14 ".kiy[0:13]"  0 0 0 -0.63300710916519165 0 0.99295103549957275 
		0.98944354057312012 0.96980780363082886 0 -0.98956155776977539 -0.98168271780014038 
		0 0.34770527482032776 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 0.77414596080780029 1 0.11852555721998215 
		0.14491870999336243 0.24387054145336151 1 0.14411082863807678 0.19052307307720184 
		1 0.93760383129119873 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 -0.63300716876983643 0 0.99295097589492798 
		0.98944360017776489 0.96980786323547363 0 -0.98956155776977539 -0.98168271780014038 
		0 0.34770527482032776 0;
createNode animCurveTL -n "animCurveTL52";
	rename -uid "37E29DE4-4D2D-21C9-CC47-DA9F086CCA31";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 -0.041412428578642677 2 -0.041412428578642677
		 3 -0.68347498870850598 5 -0.68347498870850598 7 -0.68347498870850598 10 -0.68347498870850598
		 18 -0.68347498870850598 22 -0.68347498870850598 25 -0.68347498870850598;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 0 0 0 0 0 0 0;
	setAttr -s 9 ".kox[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL53";
	rename -uid "7EE54BCE-469E-5489-FADC-1F8E6D8B48B8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0.0029539263536313143 2 0.0029539263536313143
		 3 0.37426133989034216 5 0.37426133989034216 7 0.37426133989034216 10 0.37426133989034216
		 18 0.37426133989034216 22 0.37426133989034216 25 0.37426133989034216;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 0 0 0 0 0 0 0;
	setAttr -s 9 ".kox[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL54";
	rename -uid "F6080260-4AEB-DC57-26FE-BBB12443B99C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 -0.0012037776738165582 2 -0.0012037776738165582
		 3 -0.003685032128601455 5 -0.003685032128601455 7 -0.003685032128601455 10 -0.003685032128601455
		 18 -0.003685032128601455 22 -0.003685032128601455 25 -0.003685032128601455;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 0 0 0 0 0 0 0;
	setAttr -s 9 ".kox[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA46";
	rename -uid "B6CE0BDF-4044-F08A-784B-FDBAF7E06E52";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA47";
	rename -uid "9D7F1070-4708-DAFE-DF49-69B0248784F5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA48";
	rename -uid "BE083EB6-4DFF-0AB9-2ED9-768EEB1D0FC2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL55";
	rename -uid "7BE7CCAC-413D-D8B3-7268-FF8026222722";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.03753683575018351 2 -2.022018519438344
		 5 -2.022018519438344 7 -2.022018519438344 10 -2.022018519438344 18 -2.022018519438344
		 22 -2.022018519438344 24 -2.022018519438344 25 -2.022018519438344 27 -2.022018519438344
		 30 -2.022018519438344;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL56";
	rename -uid "5241588F-4EFF-0357-8953-D7A45A9A5A80";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.017758344120534376 2 1.359273632584368
		 5 1.359273632584368 7 1.359273632584368 10 1.359273632584368 18 1.359273632584368
		 22 1.359273632584368 24 1.359273632584368 25 1.359273632584368 27 1.359273632584368
		 30 1.359273632584368;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL57";
	rename -uid "2CC48DA4-4FB6-61E6-B557-C7AA9F630711";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.0008894820584279589 2 0.068083459835715815
		 5 0.068083459835715815 7 0.068083459835715815 10 0.068083459835715815 18 0.068083459835715815
		 22 0.068083459835715815 24 0.068083459835715815 25 0.068083459835715815 27 0.068083459835715815
		 30 0.068083459835715815;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA49";
	rename -uid "187389DF-4AFA-B936-4B94-1B81989C17CA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 2 -1.1047379954974179 5 2.4922699179600287
		 7 1.1640585368523091 10 1.2919538623712241 18 2.1922432580137836 22 2.3229836444181839
		 24 2.3613882884520154 25 2.5078763299113396 27 2.2837562178039796 30 2.5078763299113396;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 0.99880450963973999 0.99898958206176758 
		0.99989104270935059 0.99954545497894287 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0.048882964998483658 0.044941704720258713 
		0.014759081415832043 0.030149227008223534 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 0.99880450963973999 0.99898958206176758 
		0.99989104270935059 0.99954545497894287 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0.048882964998483658 0.044941704720258713 
		0.014759081415832043 0.030149228870868683 0 0 0;
createNode animCurveTA -n "animCurveTA50";
	rename -uid "1A1AD614-493E-8C51-3AD8-97B1B0A2283F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 2 -2.2620149474449516 5 -0.3538264076239036
		 7 -1.1908184921204406 10 -2.1605948251182552 18 -1.0899879039545322 22 -0.70415235071738802
		 24 -0.48027766375392739 25 -0.21704816142727024 27 -0.4766084355399326 30 -0.21704816142727024;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 0.98256748914718628 1 0.99798679351806641 
		0.99858748912811279 0.99640560150146484 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 -0.18590602278709412 0 0.063421353697776794 
		0.053132101893424988 0.084710173308849335 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 0.98256748914718628 1 0.99798679351806641 
		0.99858748912811279 0.99640560150146484 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 -0.1859060525894165 0 0.063421353697776794 
		0.053132101893424988 0.084710165858268738 0 0 0;
createNode animCurveTA -n "animCurveTA51";
	rename -uid "8E583650-4D68-491C-033E-D29E479DB8F9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 2 52.056065430378531 5 -55.907695711906769
		 7 21.580326805690952 10 -4.8709579099447469 18 -33.46594273486231 22 -64.747156577625162
		 24 -75.680913597032145 25 -59.039598919879495 27 -72.699327641206025 30 -59.039598919879495;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 0.35656511783599854 0.35747048258781433 
		0.26196777820587158 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 -0.93427050113677979 -0.93392443656921387 
		-0.96507662534713745 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 0.35656508803367615 0.35747045278549194 
		0.26196777820587158 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 -0.93427050113677979 -0.93392443656921387 
		-0.96507662534713745 0 0 0 0;
createNode animCurveTL -n "animCurveTL58";
	rename -uid "5AD3CC3E-4F83-43A4-B661-C88E2364F1A4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -0.034265187188067876 2 -0.034265187188067876
		 5 -0.034265187188067876 7 -0.034265187188067876 10 -0.034265187188067876 18 -0.034265187188067876
		 22 -0.034265187188067876 25 -0.034265187188067876;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL59";
	rename -uid "F144ECD1-40A7-89AE-784F-51B9DEDF5F12";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -0.023474305982010835 2 -0.023474305982010835
		 5 -0.023474305982010835 7 -0.023474305982010835 10 -0.023474305982010835 18 -0.023474305982010835
		 22 -0.023474305982010835 25 -0.023474305982010835;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL60";
	rename -uid "679E26E3-4320-C0E4-AE83-D1BC45A07546";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0.00013382078103535259 2 0.00013382078103535259
		 5 0.00013382078103535259 7 0.00013382078103535259 10 0.00013382078103535259 18 0.00013382078103535259
		 22 0.00013382078103535259 25 0.00013382078103535259;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA52";
	rename -uid "8611F877-433C-D2FE-8BDA-8B8C196A87B8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA53";
	rename -uid "D514DABF-4040-888E-4EF3-108FB0E3D108";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA54";
	rename -uid "A1DDC5B2-4F8F-9344-3E62-48BBB8248EFB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL61";
	rename -uid "63983932-4AFC-8DFC-D8C2-CCBF822CED9D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0.0023316086538490745 2 0.0023316086538490745
		 3 0 5 0 7 0 10 0 18 0 22 0 24 -1.7955306424142807 25 1.6103625849205909 28 0 30 0;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL62";
	rename -uid "E9BC2B6A-4C71-2B77-7A46-4C9AEAADD1BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0.041469598544682559 2 0.041469598544682559
		 3 0 5 0 7 0 10 0 18 0 22 0 24 -0.16284796729188108 25 -0.31146599370562011 28 0 30 0;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 1 1 1 0.30569303035736084 1 1 
		1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0 0 0 -0.95213013887405396 0 
		0 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 1 1 1 0.30569303035736084 1 1 
		1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0 0 0 -0.95213019847869873 0 
		0 0;
createNode animCurveTL -n "animCurveTL63";
	rename -uid "07119FD7-494C-4FAC-808E-27BB7B351B2A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 9.0201238488159316e-016 2 9.0201238488159316e-016
		 5 0 7 0 10 0 18 9.0201238488159316e-016 22 9.0201238488159316e-016 24 1.309556339841095e-015
		 25 -8.5023696769192748e-018 28 9.0201238488159316e-016 30 9.0201238488159316e-016;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA55";
	rename -uid "3FAB71AA-4DD7-6247-8456-1F9F97F68DAE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 24 0 25 0
		 28 0 30 0;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA56";
	rename -uid "114654F9-4081-8EA0-9A00-C1A4F87C7C5B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 24 0 25 0
		 28 0 30 0;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA57";
	rename -uid "2E82FDAB-401A-7FD6-5176-468419F68D36";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 9.0693994419545731 3 31.663374516502802
		 5 41.332910543187559 7 41.332910543187559 10 41.332910543187559 18 41.332910543187559
		 22 41.332910543187559 24 2.9016796690271756 25 -13.539808252649172 28 -15.071242528877775
		 30 -15.071242528877775;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 0.11976689845323563 0.174851194024086 
		1 1 1 1 1 0.10385115444660187 0.78016161918640137 1 1;
	setAttr -s 12 ".kiy[0:11]"  0 0.9928019642829895 0.98459488153457642 
		0 0 0 0 0 -0.99459284543991089 -0.62557798624038696 0 0;
	setAttr -s 12 ".kox[0:11]"  1 0.11976690590381622 0.1748511791229248 
		1 1 1 1 1 0.10385114699602127 0.78016161918640137 1 1;
	setAttr -s 12 ".koy[0:11]"  0 0.99280208349227905 0.98459488153457642 
		0 0 0 0 0 -0.99459278583526611 -0.62557798624038696 0 0;
createNode animCurveTL -n "animCurveTL64";
	rename -uid "650DEE12-41B4-CAAA-25BE-129D638CA507";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 8.8817841970012523e-016 2 8.8817841970012523e-016
		 5 0 7 0 10 0 18 0 22 0 23 0 25 0;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 0 0 0 0 0 0 0;
	setAttr -s 9 ".kox[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL65";
	rename -uid "25F0B19A-4118-2DF2-9E33-67898C40433B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 -6.6613381477509392e-016 2 -6.6613381477509392e-016
		 5 4.2041678613307267 7 17.922427462214319 10 23.251504785588711 18 24.787024940278371
		 22 19.154104646483397 23 13.602077707690551 25 3.0600244636906249;
	setAttr -s 9 ".kit[0:8]"  1 18 18 1 1 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 1 1 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 0.0092989327386021614 0.0079787345603108406 
		0.041897609829902649 1 0.014899321831762791 0.0062133427709341049 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 0.99995672702789307 0.99996823072433472 
		0.99912190437316895 0 -0.99988895654678345 -0.99998068809509277 0;
	setAttr -s 9 ".kox[0:8]"  1 1 0.0092989327386021614 0.0079787354916334152 
		0.041897591203451157 1 0.014899320900440216 0.0062133427709341049 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0.99995678663253784 0.99996823072433472 
		0.99912190437316895 0 -0.99988895654678345 -0.99998068809509277 0;
createNode animCurveTL -n "animCurveTL66";
	rename -uid "2BC29568-49F8-FB77-7FA2-1B8CEF84C4D8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0.041535093624209096 2 -4.0282870991160724
		 3 -50.159646559607886 5 -61.404332749766908 7 -68.885074445838967 10 -90.364363819102536
		 18 -93.620010526684098 22 -86.504703035190943 23 -81.979822878465015 25 -79.136599984685489
		 29 -79.921419912936074;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 1 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 1 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 0.0027301118243485689 0.0019762383308261633 
		0.0071202619001269341 0.0057549634948372841 0.027292819693684578 1 0.012157722376286983 
		0.013570758514106274 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 -0.99999624490737915 -0.99999809265136719 
		-0.99997460842132568 -0.99998342990875244 -0.99962747097015381 0 0.99992609024047852 
		0.99990791082382202 0 0;
	setAttr -s 11 ".kox[0:10]"  1 0.0027301120571792126 0.0019762383308261633 
		0.0071202614344656467 0.0057549630291759968 0.027292819693684578 1 0.012157721444964409 
		0.013570758514106274 1 1;
	setAttr -s 11 ".koy[0:10]"  0 -0.99999624490737915 -0.99999809265136719 
		-0.99997460842132568 -0.99998342990875244 -0.99962741136550903 0 0.99992609024047852 
		0.99990791082382202 0 0;
createNode animCurveTA -n "animCurveTA58";
	rename -uid "D1B43031-42CC-BD66-A3C1-82BEDA6A3286";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  1 1.0734372049910998e-014 2 -29.86341201941196
		 3 -53.208463812594921 5 -101.49558983561128 7 -146.21169134069257 10 -175.62562400878477
		 18 -180.51319337103746 22 -157.39445406082004 23 -134.60771892104887 25 -91.340822058679606;
	setAttr -s 10 ".kit[0:9]"  1 18 18 18 1 1 18 18 
		18 18;
	setAttr -s 10 ".kot[0:9]"  1 18 18 18 1 1 18 18 
		18 18;
	setAttr -s 10 ".kix[0:9]"  1 0.071603529155254364 0.079731449484825134 
		0.081865906715393066 0.19236749410629272 0.6441805362701416 1 0.20366100966930389 
		0.086416780948638916 1;
	setAttr -s 10 ".kiy[0:9]"  0 -0.99743318557739258 -0.99681639671325684 
		-0.9966433048248291 -0.98132294416427612 -0.76487356424331665 0 0.97904151678085327 
		0.99625909328460693 0;
	setAttr -s 10 ".kox[0:9]"  1 0.071603529155254364 0.079731449484825134 
		0.081865914165973663 0.19236740469932556 0.6441802978515625 1 0.20366100966930389 
		0.086416780948638916 1;
	setAttr -s 10 ".koy[0:9]"  0 -0.99743318557739258 -0.99681639671325684 
		-0.99664342403411865 -0.98132306337356567 -0.76487374305725098 0 0.9790414571762085 
		0.99625909328460693 0;
createNode animCurveTA -n "animCurveTA59";
	rename -uid "0FC49739-4A8C-6298-CEBF-0C864DDE7B8D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 3.6934191238496147e-013 2 3.6934191238496147e-013
		 5 0 7 0 10 0 18 0 22 0 23 0 25 0;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 0 0 0 0 0 0 0;
	setAttr -s 9 ".kox[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA60";
	rename -uid "EF1A5189-4467-DB6F-8162-5DA4F5F90843";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 3.1805546814659332e-014 2 3.1805546814659332e-014
		 5 0 7 0 10 0 18 0 22 0 23 0 25 0;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 0 0 0 0 0 0 0;
	setAttr -s 9 ".kox[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL67";
	rename -uid "12F2D773-4C3B-BE3C-F1ED-7D88A6FC81BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  1 0.041389296936982387 2 0.041389296936982387
		 3 0.041389296936982387 5 0.041389296936982387 7 0.041389296936982387 10 0.041389296936982387
		 18 0.041389296936982387;
	setAttr -s 7 ".kit[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kix[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".kiy[0:6]"  0 0 0 0 0 0 0;
	setAttr -s 7 ".kox[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".koy[0:6]"  0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL68";
	rename -uid "BAD89774-48A0-4092-924F-D2845E90FE15";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  1 0.0034770823162730271 2 0.0034770823162730271
		 3 0.0034770823162730271 5 0.0034770823162730271 7 0.0034770823162730271 10 0.0034770823162730271
		 18 0.0034770823162730271;
	setAttr -s 7 ".kit[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kix[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".kiy[0:6]"  0 0 0 0 0 0 0;
	setAttr -s 7 ".kox[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".koy[0:6]"  0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL69";
	rename -uid "9861EAE5-4AFA-9C94-907B-2795C45F6C76";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  1 1.7587490648395932e-015 2 1.7587490648395932e-015
		 3 1.3027771433050374e-015 5 0 7 0 10 0 18 1.2022696957888137e-015;
	setAttr -s 7 ".kit[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kix[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".kiy[0:6]"  0 0 0 0 0 0 0;
	setAttr -s 7 ".kox[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".koy[0:6]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA61";
	rename -uid "521C1781-4FAB-330C-4B73-A8A1A7A46CD4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  1 4.4527765540511601e-014 2 4.4527765540511601e-014
		 3 0 5 0 7 0 10 0 18 0;
	setAttr -s 7 ".kit[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kix[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".kiy[0:6]"  0 0 0 0 0 0 0;
	setAttr -s 7 ".kox[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".koy[0:6]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA62";
	rename -uid "70C30FC1-4901-D20D-E90E-F9B10555BFD7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  1 -4.9435750538134178e-030 2 -4.9435750538134178e-030
		 3 0 5 0 7 0 10 0 18 0;
	setAttr -s 7 ".kit[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kix[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".kiy[0:6]"  0 0 0 0 0 0 0;
	setAttr -s 7 ".kox[0:6]"  1 1 1 1 1 1 1;
	setAttr -s 7 ".koy[0:6]"  0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA63";
	rename -uid "46A4AC07-4C12-15AC-C3EF-5D96A0995C06";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 1.2722218725852273e-014 2 4.0198572936089096
		 3 -2.2063950027121639 5 21.585563737938276 7 21.585563737938276 8 -11.824311709720993
		 10 -0.44145967556464955 18 35.75255387699044;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 0.37253126502037048 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0.92801964282989502 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 0.37253129482269287 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0.92801964282989502 0;
createNode animCurveTL -n "animCurveTL70";
	rename -uid "A9274686-4E33-26DA-FB55-16BE1B9D7D9A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 8.8817841970012523e-016 2 8.8817841970012523e-016
		 7 8.8817841970012523e-016 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "animCurveTL71";
	rename -uid "A0640E8A-440F-A70E-3592-D5846ADCB111";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -6.6613381477509392e-016 2 -6.6613381477509392e-016
		 7 -6.6613381477509392e-016 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "animCurveTL72";
	rename -uid "2A27C79E-41B2-5863-21DF-58A258DB4F66";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.041535093624209374 2 0.041535093624209374
		 7 0.041535093624209374 10 0.041535093624209374;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "animCurveTU24";
	rename -uid "42553E89-4B55-C3F3-1BEF-C595B41ECCF1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 9 9 9;
	setAttr -s 4 ".kot[0:3]"  1 5 5 5;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 0 0 0;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA64";
	rename -uid "FF0019B3-425C-9000-278B-6EBF38D43659";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA65";
	rename -uid "8E2F0349-416F-D8D4-B2C3-6DA2ABA668E7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "animCurveTA66";
	rename -uid "5D42A3C5-4B7D-ADED-75AE-BC8B99B6617E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "animCurveTU25";
	rename -uid "25C0282B-4566-D547-F996-37B55BA20650";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "animCurveTU26";
	rename -uid "124697D9-4CAF-BA46-F62A-2986EC7B832B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -8.9723994398099993 2 -8.9723994398099993
		 7 -8.9723994398099993 10 -8.9723994398099993;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTU -n "animCurveTU27";
	rename -uid "69787A5A-410B-5AB0-6BF4-1FB11E04488A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 2 0 7 0 10 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[0:3]"  1 1 1 1;
	setAttr -s 4 ".kiy[0:3]"  0 0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTL -n "animCurveTL73";
	rename -uid "0EF482A5-4CBB-DE7A-E631-57AD9723EAEA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 8.8817841970012523e-016 2 8.8817841970012523e-016
		 5 0 7 0 10 0 18 8.8817841970012523e-016 22 8.8817841970012523e-016 25 8.8817841970012523e-016;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL74";
	rename -uid "5F6DE171-47DD-76E8-6A3F-66AD54E7699F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -6.6613381477509392e-016 2 -6.6613381477509392e-016
		 5 26.527287683758395 7 37.487679477531003 10 44.490700846218132 18 50.822064655993231
		 22 48.221476695643304 25 40.791215130894699;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 0.0044458606280386448 0.0092777181416749954 
		0.027487440034747124 1 0.023255279287695885 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0.99999010562896729 0.99995690584182739 
		0.99962210655212402 0 -0.99972963333129883 0;
	setAttr -s 8 ".kox[0:7]"  1 1 0.0044458610936999321 0.00927771907299757 
		0.027487440034747124 1 0.023255275562405586 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0.99999016523361206 0.99995702505111694 
		0.99962210655212402 0 -0.99972951412200928 0;
createNode animCurveTL -n "animCurveTL75";
	rename -uid "D03A1906-449F-D669-1573-32BA64E5483F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0.04153509362420936 2 0.04153509362420936
		 3 -46.089824366867596 5 -74.94530083867059 7 -85.674924955386217 10 -132.90640877034215
		 18 -130.40562552194487 22 -118.47999315742867 25 -81.069739527868506;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 0.0013335663825273514 0.0033682512585073709 
		0.0028754794038832188 1 0.035521991550922394 0.0047294311225414276 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 -0.99999916553497314 -0.99999433755874634 
		-0.99999582767486572 0 0.99936896562576294 0.999988853931427 0;
	setAttr -s 9 ".kox[0:8]"  1 1 0.0013335661496967077 0.0033682512585073709 
		0.0028754794038832188 1 0.035521987825632095 0.0047294311225414276 1;
	setAttr -s 9 ".koy[0:8]"  0 0 -0.99999910593032837 -0.99999433755874634 
		-0.99999582767486572 0 0.99936890602111816 0.99998879432678223 0;
createNode animCurveTL -n "animCurveTL76";
	rename -uid "BE692C96-44B7-922F-02CB-28AB326D279F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 -0.005191819359064008 2 -0.005191819359064008
		 5 -0.005191819359064008 7 -0.005191819359064008 10 -0.005191819359064008 18 -0.005191819359064008
		 22 -0.005191819359064008 25 -0.005191819359064008;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL77";
	rename -uid "1825CA92-4888-85A5-0142-F78E17426BC1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0.041209331638776756 2 0.041209331638776756
		 5 0.041209331638776756 7 0.041209331638776756 10 0.041209331638776756 18 0.041209331638776756
		 22 0.041209331638776756 25 0.041209331638776756;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL78";
	rename -uid "D2A9B974-4B3F-8380-EC7B-49BBFE5A5EFA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 9.0201238488159297e-016 2 9.0201238488159297e-016
		 5 0 7 0 10 0 18 9.0201238488159297e-016 22 9.0201238488159297e-016 25 9.0201238488159297e-016;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA67";
	rename -uid "C83B5EBB-414A-4601-D6EC-B6938BC9A6BE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA68";
	rename -uid "CC07D0DF-4767-9A51-66C8-94B29AA14236";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  1 0 2 0 5 0 7 0 10 0 18 0 22 0 25 0;
	setAttr -s 8 ".kit[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 18;
	setAttr -s 8 ".kix[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".kiy[0:7]"  0 0 0 0 0 0 0 0;
	setAttr -s 8 ".kox[0:7]"  1 1 1 1 1 1 1 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA69";
	rename -uid "7A51B2B4-4EB4-1BC8-87F2-388FD62BCF15";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  1 0 2 9.0693994419545696 5 9.0693994419545696
		 7 9.0693994419545696 10 9.0693994419545696 18 9.0693994419545696 22 9.0693994419545696
		 25 9.0693994419545696 28 9.7944803298989171;
	setAttr -s 9 ".kit[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kot[0:8]"  1 18 18 18 18 18 18 18 
		18;
	setAttr -s 9 ".kix[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".kiy[0:8]"  0 0 0 0 0 0 0 0 0;
	setAttr -s 9 ".kox[0:8]"  1 1 1 1 1 1 1 1 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL79";
	rename -uid "9705A713-497E-A3E0-22AE-D4A867696778";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 3.4318373722171501e-005 2 3.4318373722171501e-005
		 5 3.4318373722171501e-005 7 3.4318373722171501e-005 10 3.4318373722171501e-005 13 0
		 18 3.4318373722171501e-005 22 3.4318373722171501e-005 24 3.4318373722171501e-005
		 26 3.4318373722171501e-005 28 3.4318373722171501e-005;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL80";
	rename -uid "829AA04E-41A3-F27F-2A76-F88B427BBFDE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 0.0023196588123321872 2 0.0023196588123321872
		 5 0.0023196588123321872 7 0.0023196588123321872 10 0.0023196588123321872 13 0 18 0.0023196588123321872
		 22 0.0023196588123321872 24 0.0023196588123321872 26 0.0023196588123321872 28 0.0023196588123321872;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "animCurveTL81";
	rename -uid "FD4BE85C-4177-D589-F057-86AD57962060";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  1 -0.041470254491809369 2 -0.041470254491809369
		 5 -0.041470254491809369 7 -0.041470254491809369 10 -0.041470254491809369 13 0 18 -0.041470254491809369
		 22 -0.041470254491809369 24 -0.041470254491809369 26 -0.041470254491809369 28 -0.041470254491809369;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "animCurveTA70";
	rename -uid "DF66C3CA-4438-C7F6-91F7-76AB45ABD999";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 15.17466618809649 13 6.3874691429953954
		 18 12.721785602096084 22 -18.715119733637966 24 -20.223354848625206 26 -5.2834095521150131
		 28 -4.3171491611678832 30 -3.9028600552476398;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 1 1 0.64506804943084717 1 0.79658442735671997 
		0.98406064510345459 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0 0 -0.76412516832351685 0 0.60452723503112793 
		0.17783306539058685 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 1 1 0.64506804943084717 1 0.79658442735671997 
		0.98406064510345459 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0 0 -0.76412516832351685 0 0.60452723503112793 
		0.17783306539058685 0;
createNode animCurveTA -n "animCurveTA71";
	rename -uid "DD24CC94-4011-0967-6D2E-E080FD22CC55";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 12.59695203755035 13 15.166030573494639
		 18 -7.9444436485598411 22 -0.47566647088324793 24 -2.8881198273715434 26 -7.2975707019714591
		 28 -11.220285086507319 30 -13.069735036338708;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 0.60284572839736938 1 1 1 0.74589020013809204 
		0.67580246925354004 0.79786002635955811 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0.79785776138305664 0 0 0 -0.6660689115524292 
		-0.73708277940750122 -0.60284274816513062 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 0.60284572839736938 1 1 1 0.74589020013809204 
		0.67580246925354004 0.79786002635955811 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0.79785776138305664 0 0 0 -0.6660689115524292 
		-0.73708277940750122 -0.60284274816513062 0;
createNode animCurveTA -n "animCurveTA72";
	rename -uid "88287996-432E-97D6-26D1-E5B6DFA129B6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 12 ".ktv[0:11]"  1 0 2 0 5 0 7 0 10 -6.8285582153982771 13 1.5814194107333728
		 18 7.0651299404618442 22 -9.039334620422613 24 -18.521556291657127 26 -14.341371281352462
		 28 -7.9065753322278463 30 -5.1003121262445967;
	setAttr -s 12 ".kit[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kot[0:11]"  1 18 18 18 18 18 18 18 
		18 18 18 18;
	setAttr -s 12 ".kix[0:11]"  1 1 1 1 1 0.73984849452972412 1 0.40873691439628601 
		1 0.58413606882095337 0.63715499639511108 1;
	setAttr -s 12 ".kiy[0:11]"  0 0 0 0 0 0.67277359962463379 0 -0.91265225410461426 
		0 0.81165575981140137 0.77073574066162109 0;
	setAttr -s 12 ".kox[0:11]"  1 1 1 1 1 0.73984843492507935 1 0.40873691439628601 
		1 0.58413606882095337 0.63715499639511108 1;
	setAttr -s 12 ".koy[0:11]"  0 0 0 0 0 0.67277359962463379 0 -0.91265225410461426 
		0 0.81165575981140137 0.77073574066162109 0;
createNode animCurveTU -n "animCurveTU28";
	rename -uid "6E68BB8C-4A1E-2D14-73DA-F89A25C2917A";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "67AF3904-4E76-B561-89CC-9292469B68DB";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n"
		+ "                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n"
		+ "            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n"
		+ "            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n"
		+ "            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"vPlanarDisplay\" 1 \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            -pluginObjects \"vRigWidget\" 1 \n            -pluginObjects \"vChainDisplay\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n"
		+ "                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"vPlanarDisplay\" 1 \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            -pluginObjects \"vRigWidget\" 1 \n            -pluginObjects \"vChainDisplay\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n"
		+ "                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n"
		+ "                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n"
		+ "                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n"
		+ "                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "        modelEditor -e \n            -pluginObjects \"vPlanarDisplay\" 1 \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            -pluginObjects \"vRigWidget\" 1 \n            -pluginObjects \"vChainDisplay\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n"
		+ "                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n"
		+ "                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 0\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n"
		+ "                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 2044\n                -height 1252\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n"
		+ "            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 0\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 2044\n            -height 1252\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"vPlanarDisplay\" 1 \n"
		+ "            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            -pluginObjects \"vRigWidget\" 1 \n            -pluginObjects \"vChainDisplay\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -renderFilterIndex 0\n                -selectionOrder \"chronological\" \n                -expandAttribute 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showReferenceNodes 0\n"
		+ "            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n"
		+ "            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 0\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n"
		+ "                -selectionOrder \"display\" \n                -expandAttribute 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 0\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -clipTime \"off\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n"
		+ "                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -outliner \"graphEditor1OutlineEd\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n                -showUpstreamCurves 0\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -selectionOrder \"display\" \n                -expandAttribute 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n"
		+ "                -showUpstreamCurves 0\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -clipTime \"off\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -outliner \"graphEditor1OutlineEd\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n"
		+ "                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -selectionOrder \"chronological\" \n                -expandAttribute 0\n                $editorName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 0\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n"
		+ "                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n"
		+ "                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -selectionOrder \"chronological\" \n                -expandAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 0\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n"
		+ "                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n"
		+ "                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tshapePanel -unParent -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tposePanel -unParent -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n"
		+ "\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"profilerPanel\" -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"contentBrowserPanel\" -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -editorChanged \"updateModelPanelBar\" \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n"
		+ "                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n"
		+ "                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n"
		+ "                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -editorChanged \"updateModelPanelBar\" \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n"
		+ "                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n"
		+ "                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"vPlanarDisplay\" 1 \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                -pluginObjects \"vRigWidget\" 1 \n                -pluginObjects \"vChainDisplay\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n"
		+ "                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n"
		+ "\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 4 4 \\n    -bumpResolution 4 4 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 0\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 2044\\n    -height 1252\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"vPlanarDisplay\\\" 1 \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    -pluginObjects \\\"vRigWidget\\\" 1 \\n    -pluginObjects \\\"vChainDisplay\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 4 4 \\n    -bumpResolution 4 4 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 0\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 2044\\n    -height 1252\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"vPlanarDisplay\\\" 1 \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    -pluginObjects \\\"vRigWidget\\\" 1 \\n    -pluginObjects \\\"vChainDisplay\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "025129D1-4801-9884-FB90-D79C17EEE947";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 30 -ast 1 -aet 192 ";
	setAttr ".st" 6;
createNode vstExportNode -n "penguin_idle_exportNode";
	rename -uid "27BA87B4-44E2-AA9B-9C68-E2AB9CFBFD11";
	setAttr ".ei[0].exportFile" -type "string" "penguin_death";
	setAttr ".ei[0].t" 2;
	setAttr ".ei[0].fs" 1;
	setAttr ".ei[0].fe" 30;
createNode animCurveTL -n "mirrorPlane_translateX";
	rename -uid "B1833674-4A45-51D3-25A2-B08E4E9F546A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "mirrorPlane_translateY";
	rename -uid "A3DB256E-462E-9A81-C446-EFAE8EF60703";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "mirrorPlane_translateZ";
	rename -uid "2DAE301E-42C9-0AC0-AB8D-95854C9FB4D3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.041535093624209374;
createNode animCurveTU -n "mirrorPlane_visibility";
	rename -uid "50852F4C-44AA-E53E-5D15-9484F3482CF7";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "mirrorPlane_rotateX";
	rename -uid "A92F7A9C-4285-EC58-BC95-AA922F0B39AA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "mirrorPlane_rotateY";
	rename -uid "54708BDA-44D4-D9AB-4D1B-D397405E1CF3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "mirrorPlane_rotateZ";
	rename -uid "0EE50BDB-4BF4-6CD8-E24A-22856FE125C6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "mirrorPlane_scaleX";
	rename -uid "3D1A53C1-46E9-ACF9-8D31-8788893B3162";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "mirrorPlane_scaleY";
	rename -uid "8E0FA9C8-4F7D-D177-2CDE-19876C154B54";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "mirrorPlane_scaleZ";
	rename -uid "4742B3B2-4C95-D236-B824-B38A79DCB078";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode polyPlane -n "polyPlane1";
	rename -uid "CBB775A8-4E6F-DA23-F661-8C81F123BDC8";
	setAttr ".cuv" 2;
createNode displayLayer -n "ground";
	rename -uid "13AA0E7B-4EC2-A0F1-708A-1A981A73B540";
	setAttr ".dt" 2;
	setAttr ".do" 1;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 26;
	setAttr ".unw" 26;
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
	setAttr -s 7 ".st";
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
	setAttr -s 9 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -s 40 ".u";
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
connectAttr "animCurveTL10.o" "penguin_rigRN.phl[2]";
connectAttr "animCurveTL11.o" "penguin_rigRN.phl[3]";
connectAttr "animCurveTL12.o" "penguin_rigRN.phl[4]";
connectAttr "animCurveTA7.o" "penguin_rigRN.phl[5]";
connectAttr "animCurveTA8.o" "penguin_rigRN.phl[6]";
connectAttr "animCurveTA9.o" "penguin_rigRN.phl[7]";
connectAttr "animCurveTU23.o" "penguin_rigRN.phl[8]";
connectAttr "animCurveTL25.o" "penguin_rigRN.phl[9]";
connectAttr "animCurveTL26.o" "penguin_rigRN.phl[10]";
connectAttr "animCurveTL27.o" "penguin_rigRN.phl[11]";
connectAttr "animCurveTA19.o" "penguin_rigRN.phl[12]";
connectAttr "animCurveTA20.o" "penguin_rigRN.phl[13]";
connectAttr "animCurveTA21.o" "penguin_rigRN.phl[14]";
connectAttr "animCurveTL64.o" "penguin_rigRN.phl[15]";
connectAttr "animCurveTL65.o" "penguin_rigRN.phl[16]";
connectAttr "animCurveTL66.o" "penguin_rigRN.phl[17]";
connectAttr "animCurveTA58.o" "penguin_rigRN.phl[18]";
connectAttr "animCurveTA59.o" "penguin_rigRN.phl[19]";
connectAttr "animCurveTA60.o" "penguin_rigRN.phl[20]";
connectAttr "animCurveTA13.o" "penguin_rigRN.phl[21]";
connectAttr "animCurveTA14.o" "penguin_rigRN.phl[22]";
connectAttr "animCurveTA15.o" "penguin_rigRN.phl[23]";
connectAttr "animCurveTU28.o" "penguin_rigRN.phl[24]";
connectAttr "animCurveTL55.o" "penguin_rigRN.phl[25]";
connectAttr "animCurveTL56.o" "penguin_rigRN.phl[26]";
connectAttr "animCurveTL57.o" "penguin_rigRN.phl[27]";
connectAttr "animCurveTA49.o" "penguin_rigRN.phl[28]";
connectAttr "animCurveTA50.o" "penguin_rigRN.phl[29]";
connectAttr "animCurveTA51.o" "penguin_rigRN.phl[30]";
connectAttr "animCurveTL67.o" "penguin_rigRN.phl[31]";
connectAttr "animCurveTL68.o" "penguin_rigRN.phl[32]";
connectAttr "animCurveTL69.o" "penguin_rigRN.phl[33]";
connectAttr "animCurveTA61.o" "penguin_rigRN.phl[34]";
connectAttr "animCurveTA62.o" "penguin_rigRN.phl[35]";
connectAttr "animCurveTA63.o" "penguin_rigRN.phl[36]";
connectAttr "animCurveTL40.o" "penguin_rigRN.phl[37]";
connectAttr "animCurveTL41.o" "penguin_rigRN.phl[38]";
connectAttr "animCurveTL42.o" "penguin_rigRN.phl[39]";
connectAttr "animCurveTA34.o" "penguin_rigRN.phl[40]";
connectAttr "animCurveTA35.o" "penguin_rigRN.phl[41]";
connectAttr "animCurveTA36.o" "penguin_rigRN.phl[42]";
connectAttr "animCurveTL34.o" "penguin_rigRN.phl[43]";
connectAttr "animCurveTL35.o" "penguin_rigRN.phl[44]";
connectAttr "animCurveTL36.o" "penguin_rigRN.phl[45]";
connectAttr "animCurveTA28.o" "penguin_rigRN.phl[46]";
connectAttr "animCurveTA29.o" "penguin_rigRN.phl[47]";
connectAttr "animCurveTA30.o" "penguin_rigRN.phl[48]";
connectAttr "animCurveTL22.o" "penguin_rigRN.phl[49]";
connectAttr "animCurveTL23.o" "penguin_rigRN.phl[50]";
connectAttr "animCurveTL24.o" "penguin_rigRN.phl[51]";
connectAttr "animCurveTA16.o" "penguin_rigRN.phl[52]";
connectAttr "animCurveTA17.o" "penguin_rigRN.phl[53]";
connectAttr "animCurveTA18.o" "penguin_rigRN.phl[54]";
connectAttr "animCurveTL61.o" "penguin_rigRN.phl[55]";
connectAttr "animCurveTL62.o" "penguin_rigRN.phl[56]";
connectAttr "animCurveTL63.o" "penguin_rigRN.phl[57]";
connectAttr "animCurveTA55.o" "penguin_rigRN.phl[58]";
connectAttr "animCurveTA56.o" "penguin_rigRN.phl[59]";
connectAttr "animCurveTA57.o" "penguin_rigRN.phl[60]";
connectAttr "animCurveTL76.o" "penguin_rigRN.phl[61]";
connectAttr "animCurveTL77.o" "penguin_rigRN.phl[62]";
connectAttr "animCurveTL78.o" "penguin_rigRN.phl[63]";
connectAttr "animCurveTA67.o" "penguin_rigRN.phl[64]";
connectAttr "animCurveTA68.o" "penguin_rigRN.phl[65]";
connectAttr "animCurveTA69.o" "penguin_rigRN.phl[66]";
connectAttr "animCurveTL4.o" "penguin_rigRN.phl[67]";
connectAttr "animCurveTL5.o" "penguin_rigRN.phl[68]";
connectAttr "animCurveTL6.o" "penguin_rigRN.phl[69]";
connectAttr "animCurveTU16.o" "penguin_rigRN.phl[70]";
connectAttr "animCurveTU18.o" "penguin_rigRN.phl[71]";
connectAttr "animCurveTU17.o" "penguin_rigRN.phl[72]";
connectAttr "animCurveTU21.o" "penguin_rigRN.phl[73]";
connectAttr "animCurveTU12.o" "penguin_rigRN.phl[74]";
connectAttr "animCurveTU22.o" "penguin_rigRN.phl[75]";
connectAttr "animCurveTU13.o" "penguin_rigRN.phl[76]";
connectAttr "animCurveTU14.o" "penguin_rigRN.phl[77]";
connectAttr "animCurveTU19.o" "penguin_rigRN.phl[78]";
connectAttr "animCurveTU20.o" "penguin_rigRN.phl[79]";
connectAttr "animCurveTU15.o" "penguin_rigRN.phl[80]";
connectAttr "animCurveTL52.o" "penguin_rigRN.phl[81]";
connectAttr "animCurveTL53.o" "penguin_rigRN.phl[82]";
connectAttr "animCurveTL54.o" "penguin_rigRN.phl[83]";
connectAttr "animCurveTA46.o" "penguin_rigRN.phl[84]";
connectAttr "animCurveTA47.o" "penguin_rigRN.phl[85]";
connectAttr "animCurveTA48.o" "penguin_rigRN.phl[86]";
connectAttr "animCurveTL58.o" "penguin_rigRN.phl[87]";
connectAttr "animCurveTL59.o" "penguin_rigRN.phl[88]";
connectAttr "animCurveTL60.o" "penguin_rigRN.phl[89]";
connectAttr "animCurveTA52.o" "penguin_rigRN.phl[90]";
connectAttr "animCurveTA53.o" "penguin_rigRN.phl[91]";
connectAttr "animCurveTA54.o" "penguin_rigRN.phl[92]";
connectAttr "animCurveTL19.o" "penguin_rigRN.phl[93]";
connectAttr "animCurveTL20.o" "penguin_rigRN.phl[94]";
connectAttr "animCurveTL21.o" "penguin_rigRN.phl[95]";
connectAttr "animCurveTU5.o" "penguin_rigRN.phl[96]";
connectAttr "animCurveTU7.o" "penguin_rigRN.phl[97]";
connectAttr "animCurveTU6.o" "penguin_rigRN.phl[98]";
connectAttr "animCurveTU10.o" "penguin_rigRN.phl[99]";
connectAttr "animCurveTU1.o" "penguin_rigRN.phl[100]";
connectAttr "animCurveTU11.o" "penguin_rigRN.phl[101]";
connectAttr "animCurveTU2.o" "penguin_rigRN.phl[102]";
connectAttr "animCurveTU3.o" "penguin_rigRN.phl[103]";
connectAttr "animCurveTU8.o" "penguin_rigRN.phl[104]";
connectAttr "animCurveTU9.o" "penguin_rigRN.phl[105]";
connectAttr "animCurveTU4.o" "penguin_rigRN.phl[106]";
connectAttr "animCurveTL31.o" "penguin_rigRN.phl[107]";
connectAttr "animCurveTL32.o" "penguin_rigRN.phl[108]";
connectAttr "animCurveTL33.o" "penguin_rigRN.phl[109]";
connectAttr "animCurveTA25.o" "penguin_rigRN.phl[110]";
connectAttr "animCurveTA26.o" "penguin_rigRN.phl[111]";
connectAttr "animCurveTA27.o" "penguin_rigRN.phl[112]";
connectAttr "animCurveTL43.o" "penguin_rigRN.phl[113]";
connectAttr "animCurveTL44.o" "penguin_rigRN.phl[114]";
connectAttr "animCurveTL45.o" "penguin_rigRN.phl[115]";
connectAttr "animCurveTA37.o" "penguin_rigRN.phl[116]";
connectAttr "animCurveTA38.o" "penguin_rigRN.phl[117]";
connectAttr "animCurveTA39.o" "penguin_rigRN.phl[118]";
connectAttr "animCurveTL37.o" "penguin_rigRN.phl[119]";
connectAttr "animCurveTL38.o" "penguin_rigRN.phl[120]";
connectAttr "animCurveTL39.o" "penguin_rigRN.phl[121]";
connectAttr "animCurveTA31.o" "penguin_rigRN.phl[122]";
connectAttr "animCurveTA32.o" "penguin_rigRN.phl[123]";
connectAttr "animCurveTA33.o" "penguin_rigRN.phl[124]";
connectAttr "animCurveTL7.o" "penguin_rigRN.phl[125]";
connectAttr "animCurveTL8.o" "penguin_rigRN.phl[126]";
connectAttr "animCurveTL9.o" "penguin_rigRN.phl[127]";
connectAttr "animCurveTA4.o" "penguin_rigRN.phl[128]";
connectAttr "animCurveTA5.o" "penguin_rigRN.phl[129]";
connectAttr "animCurveTA6.o" "penguin_rigRN.phl[130]";
connectAttr "animCurveTL49.o" "penguin_rigRN.phl[131]";
connectAttr "animCurveTL50.o" "penguin_rigRN.phl[132]";
connectAttr "animCurveTL51.o" "penguin_rigRN.phl[133]";
connectAttr "animCurveTA43.o" "penguin_rigRN.phl[134]";
connectAttr "animCurveTA44.o" "penguin_rigRN.phl[135]";
connectAttr "animCurveTA45.o" "penguin_rigRN.phl[136]";
connectAttr "animCurveTL79.o" "penguin_rigRN.phl[137]";
connectAttr "animCurveTL80.o" "penguin_rigRN.phl[138]";
connectAttr "animCurveTL81.o" "penguin_rigRN.phl[139]";
connectAttr "animCurveTA70.o" "penguin_rigRN.phl[140]";
connectAttr "animCurveTA71.o" "penguin_rigRN.phl[141]";
connectAttr "animCurveTA72.o" "penguin_rigRN.phl[142]";
connectAttr "animCurveTL1.o" "penguin_rigRN.phl[143]";
connectAttr "animCurveTL2.o" "penguin_rigRN.phl[144]";
connectAttr "animCurveTL3.o" "penguin_rigRN.phl[145]";
connectAttr "animCurveTA1.o" "penguin_rigRN.phl[146]";
connectAttr "animCurveTA2.o" "penguin_rigRN.phl[147]";
connectAttr "animCurveTA3.o" "penguin_rigRN.phl[148]";
connectAttr "animCurveTL16.o" "penguin_rigRN.phl[149]";
connectAttr "animCurveTL17.o" "penguin_rigRN.phl[150]";
connectAttr "animCurveTL18.o" "penguin_rigRN.phl[151]";
connectAttr "animCurveTA10.o" "penguin_rigRN.phl[152]";
connectAttr "animCurveTA11.o" "penguin_rigRN.phl[153]";
connectAttr "animCurveTA12.o" "penguin_rigRN.phl[154]";
connectAttr "animCurveTA22.o" "penguin_rigRN.phl[155]";
connectAttr "animCurveTA23.o" "penguin_rigRN.phl[156]";
connectAttr "animCurveTA24.o" "penguin_rigRN.phl[157]";
connectAttr "animCurveTL28.o" "penguin_rigRN.phl[158]";
connectAttr "animCurveTL29.o" "penguin_rigRN.phl[159]";
connectAttr "animCurveTL30.o" "penguin_rigRN.phl[160]";
connectAttr "animCurveTL13.o" "penguin_rigRN.phl[161]";
connectAttr "animCurveTL14.o" "penguin_rigRN.phl[162]";
connectAttr "animCurveTL15.o" "penguin_rigRN.phl[163]";
connectAttr "animCurveTA40.o" "penguin_rigRN.phl[164]";
connectAttr "animCurveTA41.o" "penguin_rigRN.phl[165]";
connectAttr "animCurveTA42.o" "penguin_rigRN.phl[166]";
connectAttr "animCurveTL46.o" "penguin_rigRN.phl[167]";
connectAttr "animCurveTL47.o" "penguin_rigRN.phl[168]";
connectAttr "animCurveTL48.o" "penguin_rigRN.phl[169]";
connectAttr "animCurveTL73.o" "penguin_rigRN.phl[170]";
connectAttr "animCurveTL74.o" "penguin_rigRN.phl[171]";
connectAttr "animCurveTL75.o" "penguin_rigRN.phl[172]";
connectAttr "animCurveTU24.o" "penguin_rigRN.phl[173]";
connectAttr "animCurveTU25.o" "penguin_rigRN.phl[174]";
connectAttr "animCurveTU26.o" "penguin_rigRN.phl[175]";
connectAttr "animCurveTU27.o" "penguin_rigRN.phl[176]";
connectAttr "animCurveTL70.o" "penguin_rigRN.phl[177]";
connectAttr "animCurveTL71.o" "penguin_rigRN.phl[178]";
connectAttr "animCurveTL72.o" "penguin_rigRN.phl[179]";
connectAttr "animCurveTA64.o" "penguin_rigRN.phl[180]";
connectAttr "animCurveTA65.o" "penguin_rigRN.phl[181]";
connectAttr "animCurveTA66.o" "penguin_rigRN.phl[182]";
connectAttr "mirrorPlane_translateX.o" "penguin_rigRN.phl[183]";
connectAttr "mirrorPlane_translateY.o" "penguin_rigRN.phl[184]";
connectAttr "mirrorPlane_translateZ.o" "penguin_rigRN.phl[185]";
connectAttr "mirrorPlane_visibility.o" "penguin_rigRN.phl[186]";
connectAttr "mirrorPlane_rotateX.o" "penguin_rigRN.phl[187]";
connectAttr "mirrorPlane_rotateY.o" "penguin_rigRN.phl[188]";
connectAttr "mirrorPlane_rotateZ.o" "penguin_rigRN.phl[189]";
connectAttr "mirrorPlane_scaleX.o" "penguin_rigRN.phl[190]";
connectAttr "mirrorPlane_scaleY.o" "penguin_rigRN.phl[191]";
connectAttr "mirrorPlane_scaleZ.o" "penguin_rigRN.phl[192]";
connectAttr "penguin_rigRN.phl[1]" "penguin_idle_exportNode.ei[0].objects[0]";
connectAttr "ground.di" "pPlane1.do";
connectAttr "polyPlane1.out" "pPlaneShape1.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "layerManager.dli[1]" "ground.id";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "pPlaneShape1.iog" ":initialShadingGroup.dsm" -na;
// End of penguin_death.ma
