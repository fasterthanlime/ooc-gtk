use gtk
import gtk/[Gtk, Widget]

Image: cover from GtkImage* extends Widget {

	/**
	 * Create a new image from stock
	 * @param stockId the ID of the image, e.g. "gtk-media-play", etc
	 * @param the size of the image
	 */
	new: extern(gtk_image_new_from_stock) func (stockId: String, size: GtkIconSize) -> This

}

GtkIconSize: extern cover extends Int
