/// Vector Targeting
const CONSUME_EVENT = true;
const CONTINUE_PROCESSING_EVENT = false;

GameUI.MouseEvents = {};

if (typeof GameUI.MouseEvents === 'undefined') {
    GameUI.MouseEvents = {};
}

if (!Array.isArray(GameUI.MouseEvents.mouseEventHandlers)) {
    GameUI.MouseEvents.mouseEventHandlers = [];
}


GameUI.MouseEvents.MouseCallback = function (eventName, arg, arg2, arg3) {
    // Call each registered event handler
    GameUI.MouseEvents.mouseEventHandlers.forEach(function(handler) {
        handler(eventName, arg, arg2, arg3);
    });

    return false;
};


GameUI.SetMouseCallback(GameUI.MouseEvents.MouseCallback);