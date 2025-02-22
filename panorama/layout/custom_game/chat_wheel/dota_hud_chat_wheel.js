var favorites = new Array();
var sHeroName = Players.GetPlayerSelectedHero(Game.GetLocalPlayerID());

var rings = new Array(
    new Array(//20 Favourites
        new Array("","","","","","","","",""),
        new Array(false,false,false,false,false,false,false,false,false),
        new Array(0,0,0,0,0,0,0,0,0)
    ),
);

var nowselect = 0;

function StartFavWheel() {
    RebuildChatWheel();
    if ($("#PhrasesContainer").visible == false) {
        GatherCoordinates();

        GameEvents.SendEventClientSide("pf_wheel", {type:true});

        $("#PhrasesContainer").visible = true;
        GetMousePosition();
        FindDotaHudElement('ChatWheel').FindChild("PhrasesContainer").style.width = "0";
        FindDotaHudElement('ChatWheel').FindChild("PhrasesContainer").style.height = "0";
    } else if ($("#PhrasesContainer").visible == true) {
        StopWheel()
    }
}

let currentlySelected = -1;
let pauseSelection = 0;
let startPoint = new Array(0,0);
let radius = 25;
let vectorsArray = new Array();
let vPercentArray = new Array(
    new Array(new Array(2.0625,10.51112),       new Array(-2.0625,10.5111)),
    new Array(new Array(-2.0625,9.7777778),     new Array(-5.225,5.333334)),
    new Array(new Array(-5.3625,4.8888889),     new Array(-6.05,-1.711112)),
    new Array(new Array(-6.05,-1.9555556),      new Array(-3.9875001,-8.3111112)),
    new Array(new Array(-3.85,-8.3111112),      new Array(-0.1375,-10.7555556)),
    new Array(new Array(0,-10.7555556),         new Array(3.85,-8.311112)),
    new Array(new Array(3.9875001,-8.3111112),  new Array(6.05,-2.2)),
    new Array(new Array(6.1875,0),              new Array(5.5,5.622223)),
    new Array(new Array(5.3625,5.6222223),      new Array(2.2,10.511112))
);

function GetMousePosition() {
    let pos = GameUI.GetCursorPosition();
    let width = Game.GetScreenWidth()/2;
    let height = Game.GetScreenHeight()/2;
    pos[0] = width - pos[0];
    pos[1] = height - pos[1];
    //$.Msg(pos)
    if (pauseSelection != 1 && IsInSelectionArea(pos)) {
        if (IsInTriangle(pos, startPoint,vectorsArray[0][0],vectorsArray[0][1])) {
            ClearOut(0);
            OnMouseOver(0);
            currentlySelected = (0);
        }
        else if (IsInTriangle(pos, startPoint,vectorsArray[1][0],vectorsArray[1][1])) {
            ClearOut(1);
            OnMouseOver(1);
            currentlySelected = 1;
        }
        else if (IsInTriangle(pos, startPoint,vectorsArray[2][0],vectorsArray[2][1])) {
            ClearOut(2);
            OnMouseOver(2);
            currentlySelected = 2;
        }
        else if (IsInTriangle(pos, startPoint,vectorsArray[3][0],vectorsArray[3][1])) {
            ClearOut(3);
            OnMouseOver(3);
            currentlySelected = 3;
        }
        else if (IsInTriangle(pos, startPoint,vectorsArray[4][0],vectorsArray[4][1])) {
            ClearOut(4);
            OnMouseOver(4);
            currentlySelected = 4;
        }
        else if (IsInTriangle(pos, startPoint,vectorsArray[5][0],vectorsArray[5][1])) {
            ClearOut(5);
            OnMouseOver(5);
            currentlySelected = 5;
        }
        else if (IsInTriangle(pos, startPoint,vectorsArray[6][0],vectorsArray[6][1])) {
            ClearOut(6);
            OnMouseOver(6);
            currentlySelected = 6;
        }
        else if (IsInTriangle(pos, startPoint,vectorsArray[7][0],vectorsArray[7][1])) {
            ClearOut(7);
            OnMouseOver(7);
            currentlySelected = 7;
        }
        else if (IsInTriangle(pos, startPoint,vectorsArray[8][0],vectorsArray[8][1])) {
            ClearOut(8);
            OnMouseOver(8);
            currentlySelected = 8;
        }
        else {
            currentlySelected = -1;
            ClearOut(-1);
        }
    }
    else {
        currentlySelected = -1;
        ClearOut(-1);
    }
    if ($("#PhrasesContainer").visible == true) 
        $.Schedule(1/60, GetMousePosition)
}

function GatherCoordinates() {  // 95-99% accurate
    let width = Game.GetScreenWidth()/2;
    let height = Game.GetScreenHeight()/2;
    for (let i=0;i<9;i++) {
        vectorsArray[i] = new Array(
            new Array(vPercentArray[i][0][0]*width/100, vPercentArray[i][0][1]*height/100),
            new Array(vPercentArray[i][1][0]*width/100, vPercentArray[i][1][1]*height/100)
        );
    }
    radius = 5.555556*height/100;
}

if (typeof GameUI.MouseEvents === 'undefined') {
    GameUI.MouseEvents = {};
}

if (!Array.isArray(GameUI.MouseEvents.mouseEventHandlers)) {
    GameUI.MouseEvents.mouseEventHandlers = [];
}

function ClearOut(excluded) {
    for (let i = 0; i < 9; i++) {
        if (i!=excluded)
            OnMouseOut(i);
    }
}
function ResumeSelection() {
    pauseSelection = 0;
}

function StopWheel() {
    if (currentlySelected != -1) {
        if (rings[nowselect][1][currentlySelected]) {
            GameEvents.SendCustomGameEventToServer("SelectVO", {num: rings[nowselect][2][currentlySelected]});
        } else if (nowselect == 0) {
            GameEvents.SendCustomGameEventToServer("SelectVoiceLine", {id: rings[nowselect][2][currentlySelected]});
        }
    }
    currentlySelected = -1;

    GameEvents.SendEventClientSide("pf_wheel", {type:false});

    $("#PhrasesContainer").visible = false;
    $("#WHTooltip").visible = false;
    RebuildChatWheel();
}

function RebuildChatWheel() {
    FindDotaHudElement('ChatWheel').FindChild("PhrasesContainer").style.width = "100%";
    FindDotaHudElement('ChatWheel').FindChild("PhrasesContainer").style.height = "100%";
    $("#PhrasesContainer").RemoveAndDeleteChildren();
    for ( var i = 0; i < 9; i++ )
    {
        let sName = $.Localize(rings[0][0][i]);

        $.CreatePanel(`Button`, $("#PhrasesContainer"), 'Phrase'+i, {
            class: `MyPhrases`,
            onmouseactivate: 'OnSelect('+i+')',
            onmouseover: 'OnMouseOver('+i+')',
            onmouseout: 'OnMouseOut('+i+')',
        });

        $("#Phrase"+i).BLoadLayoutSnippet("Phrase");
        $("#Phrase"+i).GetChild(0).GetChild(0).visible = rings[0][1][i];
        $("#Phrase"+i).GetChild(0).GetChild(1).text = sName;
        $("#Phrase"+i).GetChild(0).GetChild(1).style.color = "white";
    }
    nowselect = 0;
}

function OnSelect(num) {    
    $.Msg("OnSelect")
    if (rings[nowselect][1][num])
    {
        $.Msg("Founnd")
        GameEvents.SendCustomGameEventToServer("SelectVO", {num: newnum});
        StopWheel();
    }
}

function SetupFavorites() {
    let msg = new Array();
    let numsb = new Array();
    let numsi = new Array();

    for ( let i = 0; i < 9; i++ )
    {
        msg[i] = "";
        numsi[i] = 0;
        numsb[i] = false;
    }
    rings[20] = new Array(msg,numsb,numsi);
}

function UpdateFavorite(position, line_info) {
    if (!rings[0][0]) rings[0][0] = new Array();
    //$.Msg("LINE INFO:")
    //$.Msg(line_info)
    //$.Msg("RING:")
    //$.Msg(rings)
    rings[0][0][position] = line_info[0];
    rings[0][2][position] = line_info[2];
}

function UpdateAllFavorites(event) {
    //$.Msg(rings)
    for (const id in event["active_lines"]) {
        //$.Msg(id)
        //$.Msg(event["active_lines"][id])
        UpdateFavorite(id, event["active_lines"][id]);
    }

    RebuildChatWheel();
}

function FindLabelByNum(num) {
    for (var key in rings) {
        var element = rings[key];
        for ( var i = 0; i < 9; i++ )
        {
            if (element[1][i] == true && element[2][i] == num)
            {
                return element[0][i];
            }
        }
    }
}

function OnMouseOver(num) {
    for ( var i = 0; i < 9; i++ )
    {
        if ($("#Wheel").BHasClass("ForWheel"+i))
            $( "#Wheel" ).RemoveClass( "ForWheel"+i );
    }
    $( "#Wheel" ).AddClass( "ForWheel"+num );
    $("#Phrase"+num).AddClass("MiniAraAra");
    $("#Phrase"+num).GetChild(0).AddClass("AraAra");
    $("#Phrase"+num).GetChild(0).GetChild(1).AddClass("ShineThisPlease");
}

function OnMouseOut(num) {
    $("#WHTooltip").visible = false;
    $("#Phrase"+num).RemoveClass("MiniAraAra");
    $("#Phrase"+num).GetChild(0).RemoveClass("AraAra");
    $("#Phrase"+num).GetChild(0).GetChild(1).RemoveClass("ShineThisPlease");
}

LocalDataLoaded()
function LocalDataLoaded() {
    let hero = Players.GetPlayerSelectedHero(Game.GetLocalPlayerID());

    $("#HeroImage").heroname = hero;
    
    for ( let i = 0; i < 9; i++ )
    {
        let sName = $.Localize(rings[0][0][i]);

        $.CreatePanel(`Button`, $("#PhrasesContainer"), 'Phrase'+i, {
            class: `MyPhrases`,
            onmouseactivate: 'OnSelect('+i+')',
            onmouseover: 'OnMouseOver('+i+')',
            onmouseout: 'OnMouseOut('+i+')',
        });
        $("#Phrase"+i).BLoadLayoutSnippet("Phrase");
        $("#Phrase"+i).GetChild(0).GetChild(0).visible = rings[0][1][i];
        $("#Phrase"+i).GetChild(0).GetChild(1).text = sName;
        $("#Phrase"+i).GetChild(0).GetChild(1).style.color = "white";
    }
    GatherCoordinates();
    RegisterChatWheel();
}

function RegisterChatWheel() {
    let sRandomString2 = Math.random().toString(36).substr(2, 5);
    var vanilla_keybind = GetKeyBind("HeroChatWheel").toLowerCase();

    if (vanilla_keybind == undefined || vanilla_keybind == "") {
        vanilla_keybind = "k";
    }

    Game.AddCommand("+" + sRandomString2, StartFavWheel, '', 0);
    Game.AddCommand("-" + sRandomString2, StopWheel, '', 0);

    if (vanilla_keybind == "k") {
        vanilla_keybind = "l";
    } else {
        vanilla_keybind = "k";
    }

    Game.CreateCustomKeyBind(vanilla_keybind, "+" + sRandomString2);
}


(function() {
    $("#Wheel").visible = false;
    $("#Bubble").visible = false;
    $("#PhrasesContainer").visible = false;
    $("#WHTooltip").visible = false;

    SetupFavorites();
    GameEvents.Subscribe("load_chatwheel", LocalDataLoaded);
    GameEvents.Subscribe("ChatWheel:UpdateAllFavorites", UpdateAllFavorites);
})(); 

var ChatWheelMouseCallback = function(eventName, arg, arg2, arg3) {
    if (arg == 0 && $("#PhrasesContainer").visible == true && currentlySelected != -1){
        /*pauseSelection = 1;
        let num = currentlySelected;
        currentlySelected = -1;
        OnSelect(num);
        $.Schedule(1/20, ResumeSelection)*/
        StopWheel();
    }
};

GameUI.MouseEvents.mouseEventHandlers.push(ChatWheelMouseCallback);