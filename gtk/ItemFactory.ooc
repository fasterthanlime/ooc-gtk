use gtk
import gtk/[Gtk,Type,AccelGroup,Widget]

ItemFactory: cover from GtkItemFactory* {
	
	new: static extern(gtk_item_factory_new) func(type: Type,path: GChar*,accel_group: AccelGroup) -> This	
	
	
	
	createItems: extern(gtk_item_factory_create_items) func(nitems: GInt,entry: ItemFactoryEntry )
	
	getWidget: extern(gtk_item_factory_get_widget) func(widget: GChar*) -> Widget
	
}

ItemFactoryEntry: cover from GtkItemFactoryEntry* {
	
	
}
