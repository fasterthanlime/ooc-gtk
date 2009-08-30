use gtk
import gtk.Box

VBox from GtkVBox* extends Box {

	new: extern(gtk_vbox_new) func (homogeneous: GBool, spacing: GInt)

}
