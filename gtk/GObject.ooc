use gtk
include gtk/gtk
import gtk.Gtk

GObjectStruct: cover from GtkObject


/**
 * The base of the GObject hierarchy. Can send and receive signals
 */
GObject: cover from GObjectStruct* {

	connect: func ~nodata (signalName: GChar*, callback: Func) -> GULong {
		connect(signalName, callback, null)
	}

	connect: func (signalName: GChar*, callback: Func, data: GPointer) -> GULong {
		gtk_signal_connect(GTK_OBJECT(this), signalName,
			GTK_SIGNAL_FUNC(callback), data)
	}

}

GInt: cover from gint
GULong: cover from gulong
GPointer: cover from gpointer
GChar: cover from gchar
GTK_OBJECT: extern func (GObject) -> GObject
GTK_SIGNAL_FUNC: extern func (Func) -> Func
gtk_signal_connect: extern func (GObject, GChar*, Func, GPointer) -> GULong
