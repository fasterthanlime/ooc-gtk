use gtk
import gtk/[Gtk,Box]

VBox: cover from GtkVBox* extends Box {

	new: extern(gtk_vbox_new) static func (homogeneous: GBool, spacing: GInt) -> This

}
