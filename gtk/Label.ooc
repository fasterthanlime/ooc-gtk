use gtk
import gtk/[Gtk, Widget]

Label: cover from GtkLabel* extends Widget {

	new: extern(gtk_label_new) static func (text: String) -> This
    
    setText: extern(gtk_label_set_text) func (text: String)
    
    getText: extern(gtk_label_get_text) func -> String

}
