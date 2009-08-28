use gtk
import gtk.[Gtk, GObject, Container]

WindowStruct: cover from GtkWindow

/**
 * A simple Gtk window
 */
Window: cover from WindowStruct* extends Container {
	
	/**
	 * Create a new top-level window
	 */
	new: func -> This {
		return gtk_window_new(GTK_WINDOW_TOPLEVEL) as This
	}
	
	/**
	 * Create a new titled top-level window
	 */
	new: func ~with_title (title: String) -> This {
		w := this()
		w setTitle(title);
		return w
	}
	
	/**
	 * Change the title of this window
	 */
	setTitle: extern(gtk_window_set_title) func (String)
	
}

GTK_WINDOW_TOPLEVEL: extern Int
gtk_window_new: extern func (Int) -> Window
