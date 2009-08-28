use gtk
import gtk.[Gtk, GObject, Window]

WidgetStruct: cover from GtkWidget {
	window: extern GdkWindow*
	allocation: extern GtkAllocation	
}	

/**
 * A GTK widget, such as a Button, a Label, a Checkbox
 */
Widget: cover from WidgetStruct* extends GObject {
	
	/**
	 * Set the sensitivity of this widget
	 * @param sensitive if true, the widget will react to the user
	 * input, and send/receive signals as usual. If false, thewidget
	 * will be "grayed out" and won't react to anything
	 */
	setSensitive: extern(gtk_widget_set_sensitive) func (sensitive: Bool)

	/**
	 * @see realize
	 */
	isRealized: extern(GTK_WIDGET_REALIZED) func -> Bool
	
	/**
	 * Realize this component on-screen, e.g. allocate resources, etc.
	 * It's often not needed to call it directly, use show() instead.
	 */
	realize: extern(gtk_widget_realize) func
	
	/**
	 * Force the repaint of this widget
	 */
	forceRepaint: func (childrenToo: Bool) {
		
		while(Gtk eventsPending()) {
			Gtk mainIteration()
		}
		gdk_window_invalidate_rect(this@ window, null, childrenToo)
		gdk_window_process_updates(this@ window, childrenToo)
		
	}
	
	/**
	 * Shows this widget on-screen.
	 */
	show: extern(gtk_widget_show) func
	
	/**
	 * Shows this widget on-screen and all its children.
	 */
	showAll: extern(gtk_widget_show_all) func
	
	/**
	 * Hides this widget
	 */
	hide: extern(gtk_widget_hide) func
	
	/**
	 * Destroys this widget
	 */
	destroy: extern(gtk_widget_destroy) func
	
	/**
	 * set the position of this wdiget
	 * @param x the x coordinate of the desired position for this widget, or
	 * -1 for default position
	 * @param y the y coordinate of the desired position for this widget, or
	 * -1 for default position
	 */
	setPosition: extern(gtk_widget_set_uposition) func (x, y : GInt)
	
	/**
	 * set the size of this widget
	 * @param width the desired width for this widget, or -1 for the default
	 * @param height the desired height for this widget, or -1 for the default
	 */
	setUSize: extern(gtk_widget_set_usize) func (width, height : GInt)
	
	/**
	 * The height of this window
	 */
	getWidth: func -> Int {
		return this@ allocation width;
	}
	
	/**
	 * The height of this window
	 */
	getHeight: func -> Int {
		return this@ allocation height;
	}
	
	/*
	getStyle: func -> Style {
		return gtk_widget_get_style(this) as Style;
	}
	*/

}

GTK_WIDGET_REALIZED: extern func (Widget) -> Bool

GdkWindow: extern cover
GdkRectangle: extern cover

GtkAllocation: extern cover {
	width, height: extern Int
}

gdk_window_invalidate_rect: extern func (GdkWindow*, GdkRectangle, Bool)
gdk_window_process_updates: extern func (GdkWindow*, Bool)
