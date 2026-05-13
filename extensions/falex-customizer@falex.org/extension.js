const { GObject, St, Clutter, Gio, GLib } = imports.gi;
const Main = imports.ui.main;
const PanelMenu = imports.ui.panelMenu;
const PopupMenu = imports.ui.popupMenu;

const Extension = GObject.registerClass(
class Extension extends GObject.Object {
    _init() {
        super._init();
        this._settings = null;
    }

    enable() {
        this._settings = ExtensionUtils.getSettings();
        // Add customization logic here
        log('Falex Customizer enabled');
    }

    disable() {
        this._settings = null;
        log('Falex Customizer disabled');
    }
});

function init() {
    return new Extension();
}