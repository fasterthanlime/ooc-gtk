use gtk
import gtk/[Gtk,Container, Widget]

Box: cover from GtkBox* extends Container {
	
	packStart: extern(gtk_box_pack_start) func (child: Widget, expand: GBool, fill: GBool, padding: GInt)
	packStart: func ~defaults (child: Widget) { packStart(child, false, false, 0) }
	
	packEnd: extern(gtk_box_pack_end) func (child: Widget, expand: GBool, fill: GBool, padding: GInt)
	packEnd: func ~defaults (child: Widget) { packEnd(child, false, false, 0) }

}
