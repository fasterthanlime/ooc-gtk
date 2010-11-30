use gtk
import gtk/[Widget, Container]

/**
 * A bin is a widget that contains just one child widgets
 */
Bin: cover from struct GtkBin* extends Container {

    getChild: extern(gtk_bin_get_child) func -> Widget

}
