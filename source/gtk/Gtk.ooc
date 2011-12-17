use gtk
import gtk/_GObject

/* Module-load code */
Gtk init(null, null)

/**
 * Singleton GTK cover for initialization etc.
 */
Gtk: cover {

	/**
	 * Initialize Gtk, usually called from main, with Gtk.init(&argc, &argv)
	 * @param argc a pointer to the number of arguments passed to the program
	 * @param argv a pointer to the array of arguments as strings passed to the program
	 */
	init: extern(gtk_init) static func(Int*, String**)
	
	/**
	 * Start the Gtk main loop
	 */
	main: extern(gtk_main) static func
	
	/**
	 * @return true if the event queue is not empty
	 */
	eventsPending: extern(gtk_events_pending) static func -> Bool
	
	/**
	 * Iterate the gtk main loop
	 */
	mainIteration: extern(gtk_main_iteration) static func
	
	/**
	 * Quit the Gtk main loop
	 */
	mainQuit: extern(gtk_main_quit) static func
	
	/**
	 * Add an object to the list of objects to be destroyed at the end
	 * of the application
	 * @param object
	 */
	quitAddDestroy: static func (object: _GObject) {
		gtk_quit_add_destroy(1, GTK_OBJECT(object))
	}
	
	
	addTimeout: static func (interval: UInt, f: Func -> Bool) {
            c := f as Closure
            g_timeout_add(interval as GUInt, c thunk, c context)
        }

}

g_timeout_add: extern func (interval: GUInt, function: Pointer, data: Pointer)

gtk_quit_add_destroy: extern func (Int, _GObject)

gtk_get_current_event_time: extern func -> UInt

GBool: cover from gboolean extends Bool
GInt: cover from gint extends SSizeT
GUInt: cover from guint extends SizeT
GLong: cover from glong extends Long
GULong: cover from gulong extends ULong
GPointer: cover from gpointer extends Pointer
GChar: cover from gchar extends Char
GString: cover from gchar* extends String
