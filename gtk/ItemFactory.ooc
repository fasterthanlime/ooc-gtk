use gtk
import gtk/[Gtk,Type,AccelGroup,Widget]

GtkItemFactoryEntry: extern cover

ItemFactory: cover from GtkItemFactory* {
	
	new: static extern(gtk_item_factory_new) func(type: Type,path: GChar*,accel_group: AccelGroup) -> This	
	
	createItems: extern(gtk_item_factory_create_items) func(nEntries: GInt, entries: GtkItemFactoryEntry*, callbackData: GPointer)
	
	getWidget: extern(gtk_item_factory_get_widget) func(widget: GChar*) -> Widget
	
}

ItemFactoryEntry: cover from GtkItemFactoryEntry {
	
    path, accelerator : extern GChar*
    callback: extern Func
    callbackAction: extern(callback_action) GUInt
    itemType: extern(item_type) GChar*
    extraData: extern(extra_data) GPointer
    
    new: static func (.path, .accelerator, .callback, .callbackAction, .itemType) -> This {
        this : This
        this path = path
        this accelerator = accelerator
        this callback = callback
        this callbackAction = callbackAction
        this itemType = itemType
        return this
    }
	
}
