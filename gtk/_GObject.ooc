use gtk
import gtk.Gtk

_GObjectStruct: cover from GtkObject

/**
 * The base of the GObject hierarchy. Can send and receive signals
 */
_GObject: cover from _GObjectStruct* {

	connect: func ~nodata (signalName: GChar*, callback: Func) -> GULong {
		connect(signalName, callback, null)
	}

	connect: func (signalName: GChar*, callback: Func, data: GPointer) -> GULong {
		gtk_signal_connect(GTK_OBJECT(this), signalName,
			GTK_SIGNAL_FUNC(callback), data)
	}

}

GTK_OBJECT: extern func (_GObject) -> _GObject
GTK_SIGNAL_FUNC: extern func (Func) -> Func
gtk_signal_connect: extern func (_GObject, GChar*, Func, GPointer) -> GULong
