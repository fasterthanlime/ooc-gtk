use gtk
import gtk/[Gtk, Container, AccelGroup]

WindowStruct: cover from GtkWindow

/**
 * A simple Gtk window
 */
Window: cover from WindowStruct* extends Container {
	
	/**
	 * Create a new top-level window
	 */
	new: static func -> This {
		return gtk_window_new(GTK_WINDOW_TOPLEVEL) as This
	}
	
	/**
	 * Create a new titled top-level window
	 */
	new: static func ~with_title (title: String) -> This {
		w := new()
		w setTitle(title);
		return w
	}
	
	/**
	 * Change the title of this window
	 */
	setTitle: extern(gtk_window_set_title) func (String)
	

	
	addAccelGroup: extern(gtk_window_add_accel_group) func (accelGroup: AccelGroup)
	
}

GTK_WINDOW_TOPLEVEL: extern Int
gtk_window_new: extern func (Int) -> Window
