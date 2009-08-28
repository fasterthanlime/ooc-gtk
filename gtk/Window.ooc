use gtk
include gtk/gtk

import gtk.GObject, gtk.Widget

WindowStruct: cover from GtkWindow

/**
 * A simple Gtk window
 */
Window: cover from WindowStruct* extends Widget {
	
	/**
	 * Create a new top-level window
	 */
	new: func -> Window {
		return gtk_window_new(GTK_WINDOW_TOPLEVEL) as Window
	}
	
	/**
	 * Create a new titled top-level window
	 */
	new: func ~with_title (title: String) -> Window {
		w := new Window
		w setTitle(title);
		return w
	}
	
	/**
	 * Change the title of this window
	 */
	setTitle: func (title: String) {
		gtk_window_set_title(GTK_WINDOW(this), title);
	}
	
}

GTK_WINDOW_TOPLEVEL: extern Int
GTK_WINDOW: extern func (Window) -> Window
gtk_window_new: extern func (Int) -> Window
gtk_window_set_title: extern func (Window, GChar*)
