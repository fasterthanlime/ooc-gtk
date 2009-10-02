use gtk
import gtk/[Gtk, Container, Image]

/**
 * A widget that creates a signal when clicked on
 */
Button: cover from GtkButton* extends Container {

	/**
	 * Create a new, empty, button.
	 */
	new: static extern(gtk_button_new) func -> This
	
	/**
	 * Create a new button from stock.
	 * @param stockId the stock identifier, e.g. "gtk-media-play" or "gtk-ok"
	 */
	new: static extern(gtk_button_new_from_stock) func ~fromStock (stockId: String) -> This
	
	/**
	 * Adjust the text shown on the button
	 */
	setLabel: extern(gtk_button_set_label) func (label : GChar*)
	
	/**
	 * Enable/disable the use of stock icons based of the button's text
	 */
	setUseStock: extern(gtk_button_set_use_stock) func (useStock: GBool)
	
	/**
	 * Change the image displayed on this button
	 */
	setImage: extern(gtk_button_set_image) func (image: Image)
	
	/**
	 * Act as if this button has been pressed
	 */
	pressed: extern(gtk_button_pressed) func

}
