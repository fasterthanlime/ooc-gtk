use gtk
import gtk.Widget

ContainerStruct: cover from GtkContainer

/**
 * A container is a widget that can contain other widgets
 */
Container: cover from ContainerStruct* extends Widget {

	/**
	 * Add a widget to this container
	 * @param widget the widget to add
	 */
	add: extern(gtk_container_add) func (widget: Widget)
	
	/**
	 * Remove a widget from this container
	 * @param widget the widget to remove
	 */
	remove: extern(gtk_container_remove) func (widget: Widget)
	
	/**
	 * Change the width of the border of this container
	 * @param width
	 */
	setBorderWidth: extern(gtk_container_set_border_width) func (width: Int)

}
