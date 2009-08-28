use gtk
include gtk/gtk, gdk/gdk
import gtk.Gtk, gtk.GObject, gtk.Window

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
	setSensitive: func (sensitive: Bool) {
		gtk_widget_set_sensitive(this, sensitive)
	}

	/**
	 * @see realize
	 */
	isRealized: func -> Bool {
		return GTK_WIDGET_REALIZED(this)
	}
	
	/**
	 * Realize this component on-screen, e.g. allocate resources, etc.
	 * It's often not needed to call it directly, use show() instead.
	 */
	realize: func {
		gtk_widget_realize(this)
	}
	
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
	show: func {
		gtk_widget_show(this)
	}
	
	/**
	 * Shows this widget on-screen and all its children.
	 */
	showAll: func {
		gtk_widget_show_all(this)
	}
	
	/**
	 * Hides this widget
	 */
	hide: func {
		gtk_widget_hide(this)
	}
	
	/**
	 * Destroys this widget
	 */
	destroy: func {
		gtk_widget_destroy(this)
	}
	
	/**
	 * set the position of this wdiget
	 * @param x the x coordinate of the desired position for this widget, or
	 * -1 for default position
	 * @param y the y coordinate of the desired position for this widget, or
	 * -1 for default position
	 */
	setPosition: func (x, y : GInt) {
		gtk_widget_set_uposition(this, x, y)
	}
	
	/**
	 * set the size of this widget
	 * @param width the desired width for this widget, or -1 for the default
	 * @param height the desired height for this widget, or -1 for the default
	 */
	setUSize: func (width, height : GInt) {
		gtk_widget_set_usize(this, width, height)
	}
	
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
		return new Style(gtk_widget_get_style(getWidget()));
	}
	*/

	
}

GTK_WIDGET_REALIZED: extern func (Widget) -> Bool

GdkWindow: extern cover
GdkRectangle: extern cover

GtkAllocation: extern cover {
	width, height: extern Int
}

gtk_widget_set_sensitive: extern func (Widget, Bool)
gtk_widget_realize: extern func (Widget)
gtk_widget_show: extern func (Widget)
gtk_widget_show_all: extern func (Widget)
gtk_widget_hide: extern func (Widget)
gtk_widget_destroy: extern func (Widget)
gtk_widget_set_uposition: extern func (Widget, GInt, GInt)
gtk_widget_set_usize: extern func (Widget, GInt, GInt)
gdk_window_invalidate_rect: extern func (GdkWindow*, GdkRectangle, Bool)
gdk_window_process_updates: extern func (GdkWindow*, Bool)
