use gdk, gtk
import gtk/[Gtk, _GObject, Window]
import gdk/Drawable

WidgetStruct: cover from GtkWidget {
	window: extern GdkWindow*
	allocation: extern GtkAllocation
}

/**
 * A GTK widget, such as a Button, a Label, a Checkbox
 */
Widget: cover from WidgetStruct* extends _GObject {

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
	 * Sets whether the application intends to draw on the widget in
	 * an "expose-event" handler.
	 * This is a hint to the widget and does not affect the behavior of
	 * the GTK+ core; many widgets ignore this flag entirely. For widgets
	 * that do pay attention to the flag, such as GtkEventBox and
	 * GtkWindow, the effect is to suppress default themed drawing of
	 * the widget's background. (Children of the widget will still be drawn.)
	 * The application is then entirely responsible for drawing the
	 * widget background.
	 */
	setAppPaintable: extern(gtk_widget_set_app_paintable) func (Bool)

	getWindow: extern(gtk_widget_get_window) func -> Drawable

	/*
	 * Force the repaint of this widget
	 */
	forceRepaint: func (childrenToo: Bool) {

		while(Gtk eventsPending()) {
			Gtk mainIteration()
		}
		// ugly workaround
                ws := this@ as WidgetStruct
                window := ws window
		gdk_window_invalidate_rect(window, null, childrenToo)
		gdk_window_process_updates(window, childrenToo)

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
            // FIXME ugly workaround
            return this@ as WidgetStruct allocation width;
	}

	/**
	 * The height of this window
	 */
	getHeight: func -> Int {
            // FIXME ugly workaround
            return this@ as WidgetStruct  allocation height;
	}

	/*
	getStyle: func -> Style {
            return gtk_widget_get_style(this) as Style;
	}
	*/

        addEvents: extern(gtk_widget_add_events) func (events: GdkEventMask)
}

GdkEventMask: enum {
  EXPOSURE_MASK           = 1 << 1,
  POINTER_MOTION_MASK = 1 << 2,
  POINTER_MOTION_HINT_MASK = 1 << 3,
  BUTTON_MOTION_MASK = 1 << 4,
  BUTTON1_MOTION_MASK = 1 << 5,
  BUTTON2_MOTION_MASK = 1 << 6,
  BUTTON3_MOTION_MASK = 1 << 7,
  BUTTON_PRESS_MASK         = 1 << 8,
  BUTTON_RELEASE_MASK = 1 << 9,
  KEY_PRESS_MASK            = 1 << 10,
  KEY_RELEASE_MASK          = 1 << 11,
  ENTER_NOTIFY_MASK         = 1 << 12,
  LEAVE_NOTIFY_MASK         = 1 << 13,
  FOCUS_CHANGE_MASK         = 1 << 14,
  STRUCTURE_MASK            = 1 << 15,
  PROPERTY_CHANGE_MASK = 1 << 16,
  VISIBILITY_NOTIFY_MASK = 1 << 17,
  PROXIMITY_IN_MASK         = 1 << 18,
  PROXIMITY_OUT_MASK = 1 << 19,
  SUBSTRUCTURE_MASK         = 1 << 20,
  SCROLL_MASK               = 1 << 21,
  ALL_EVENTS_MASK           = 0x3FFFFE 
}

GTK_WIDGET_REALIZED: extern func (Widget) -> Bool

GdkWindow: extern cover
GdkRectangle: extern cover

GtkAllocation: extern cover {
    width, height: extern Int
}

gdk_window_invalidate_rect: extern func (Pointer, Pointer, Bool)
gdk_window_process_updates: extern func (Pointer, Bool)

