use gtk
import gtk/[Gtk, Widget]

/**
 * Display an icon in the system tray
 */
StatusIcon: cover from GtkStatusIcon* extends Widget {

	/**
	 * Creates an empty status icon object.
	 */
	new: static extern(gtk_status_icon_new) func -> This
	
	/**
	 * Creates a status icon displaying the file filename.
     * The image will be scaled down to fit in the available
     * space in the notification area, if necessary.
	 */
	new: static func ~fromFile (filename: String) -> This {
		gtk_status_icon_new_from_file(filename)
	}

}

gtk_status_icon_new_from_file: extern func (CString) -> StatusIcon
