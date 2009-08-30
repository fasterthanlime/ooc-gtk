use gtk
import gtk.Box

HBox from GtkHBox* extends Box {

	new: extern(gtk_hbox_new) func (homogeneous: GBool, spacing: GInt)

}
