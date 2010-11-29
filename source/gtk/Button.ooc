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
	new: static func ~fromStock (stockId: String) -> This {
		gtk_button_new_from_stock(stockId)
	}
	
	/**
	 * Adjust the text shown on the button
	 */
	setLabel: func (label: String) { gtk_button_set_label(this, label) }
	
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

gtk_button_set_label: extern func (Button, CString)
gtk_button_new_from_stock: extern func (CString) -> Button
