use gtk
import gtk/[Gtk, Widget]

Label: cover from GtkLabel* extends Widget {

	new: extern(gtk_label_new) static func (text: CString) -> This
    
    setText: extern(gtk_label_set_text) func (text: CString)
    
    setMarkup: extern(gtk_label_set_markup) func (text: CString)
    
    getText: func -> String { gtk_label_get_text(this) toString() }

}

gtk_label_get_text: extern func (Label) -> CString
