use gtk
import gtk/[Gtk, Box]

HBox: cover from GtkHBox* extends Box {

	new: extern(gtk_hbox_new) static func (homogeneous: GBool, spacing: GInt) -> This

}
