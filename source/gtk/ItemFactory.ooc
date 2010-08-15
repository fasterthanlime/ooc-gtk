use gtk
import structs/List
import gtk/[Gtk,Type,AccelGroup,Widget]

ItemFactoryEntry: cover from GtkItemFactoryEntry {

    path, accelerator : extern GChar*
    callback: extern Pointer
    callbackAction: extern(callback_action) GUInt
    itemType: extern(item_type) GChar*
    extraData: extern(extra_data) GPointer

    new: static func (.path, .accelerator, callback: Func, .callbackAction, .itemType) -> This {
        this : This
        this path = path
        this accelerator = accelerator
        this callback = callback as Closure thunk
        this callbackAction = callbackAction
        this itemType = itemType
        this extraData = callback as Closure context
        return this
    }

}

ItemFactory: cover from GtkItemFactory* {

	new: static extern(gtk_item_factory_new) func(type: Type,path: GChar*,accel_group: AccelGroup) -> This

	createItems: extern(gtk_item_factory_create_items) func(nEntries: GInt, entries: ItemFactoryEntry*, callbackData: GPointer)

    createItems: func ~arrayList (entries: List<ItemFactoryEntry>, callbackData: GPointer) {
        createItems(entries size(), entries toArray(), callbackData)
    }

    createItems: func ~arrayListNoCallback (entries: List<ItemFactoryEntry>) {
        createItems(entries, null)
    }

	getWidget: extern(gtk_item_factory_get_widget) func(widget: GChar*) -> Widget

}
