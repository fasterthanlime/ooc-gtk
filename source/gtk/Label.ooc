use gtk
import gtk/[Gtk, Widget]

Label: cover from GtkLabel* extends Widget {

	new: extern(gtk_label_new) static func (text: String) -> This
    
    setText: func (text: String) { gtk_label_set_text(this, text) }
    
    getText: func -> String { gtk_label_get_text() toString() }

}

gtk_label_set_text: extern func (Label, CString)
gtk_label_get_text: extern func (Label) -> CString
