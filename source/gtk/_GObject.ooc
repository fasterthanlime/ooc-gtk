use gtk
import gtk/Gtk

_GObjectStruct: cover from GtkObject

/**
 * The base of the GObject hierarchy. Can send and receive signals
 */
_GObject: cover from _GObjectStruct* {

	connect: func ~nodata (signalName: String, callback: Func (...)) -> GULong {
        closure: Closure* = gc_malloc(Closure size)
        closure@ thunk   = callback as Closure thunk
        closure@ context = callback as Closure context
        g_signal_connect_swapped(this, signalName, GTK_SIGNAL_FUNC(thunk), closure)
	}
    
    connectNaked: func (signalName: String, context, callback: Pointer) -> GULong {
        closure: Closure* = gc_malloc(Closure size)
        closure@ thunk   = callback
        closure@ context = context
        g_signal_connect_swapped(this, signalName, GTK_SIGNAL_FUNC(nakedThunk), closure)
    }

}

thunk: func (userData: Closure*, object: _GObject, event: Pointer) -> Bool {
    realFunc := userData@ as Func ()
    realFunc()
}

nakedThunk: func (userData: Closure*, object: _GObject, event: Pointer) -> Bool {
    realFunc := userData@ as Func (Pointer)
    data := realFunc as Closure context
    realFunc as Closure context = event
    realFunc(data)
}

GTK_OBJECT: extern func (_GObject) -> _GObject
GTK_SIGNAL_FUNC: extern func (Pointer) -> Pointer
g_signal_connect: extern func (_GObject, CString, Pointer, Pointer) -> GULong
g_signal_connect_swapped: extern func (_GObject, CString, Pointer, Pointer) -> GULong
