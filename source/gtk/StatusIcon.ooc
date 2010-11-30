use gtk
import gtk/[Gtk, Widget, _GObject]

/**
 * Display an icon in the system tray
 */
StatusIcon: cover from GtkStatusIcon* extends _GObject {

	/**
	 * Creates an empty status icon object.
	 */
	new: static extern(gtk_status_icon_new) func -> This
	
	/**
	 * Creates a status icon displaying the file filename.
     * The image will be scaled down to fit in the available
     * space in the notification area, if necessary.
	 */
    new: static extern(gtk_status_icon_new_from_file) func ~fromFile (filename: CString) -> This
    
}

gtk_status_icon_position_menu: extern func
