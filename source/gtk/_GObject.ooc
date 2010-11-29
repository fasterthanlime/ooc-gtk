use gtk
import gtk/Gtk

_GObjectStruct: cover from GtkObject

/**
 * The base of the GObject hierarchy. Can send and receive signals
 */
_GObject: cover from _GObjectStruct* {

<<<<<<< HEAD
	connect: func ~nodata (signalName: String, callback: Func (...)) -> GULong {
        closure: Closure* = gc_malloc(Closure size)
        closure@ thunk   = callback as Closure thunk
        closure@ context = callback as Closure context
        gtk_signal_connect(GTK_OBJECT(this), signalName, GTK_SIGNAL_FUNC(thunk), closure)
	}
    
    connectNaked: func (signalName: String, context, callback: Pointer) -> GULong {
        closure: Closure* = gc_malloc(Closure size)
        closure@ thunk   = callback
        closure@ context = context
        gtk_signal_connect(GTK_OBJECT(this), signalName, GTK_SIGNAL_FUNC(nakedThunk), closure)
    }

}

thunk: func (object: _GObject, event: Pointer, userData: Closure*) -> Bool {
    realFunc := userData@ as Func ()
    realFunc()
}

nakedThunk: func (object: _GObject, event: Pointer, userData: Closure*) -> Bool {
    realFunc := userData@ as Func (Pointer)
    data := realFunc as Closure context
    realFunc as Closure context = event
    realFunc(data)
}

GTK_OBJECT: extern func (_GObject) -> _GObject
GTK_SIGNAL_FUNC: extern func (Pointer) -> Pointer
gtk_signal_connect: extern func (_GObject, CString, Pointer, Pointer) -> GULong
