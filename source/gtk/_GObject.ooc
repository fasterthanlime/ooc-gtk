use gtk
import gtk/Gtk

import structs/ArrayList 

// FIXME: right now we have no way to remove event handlers
// to clean up

// retain references to context struct to avoid them to be collected
gcHack := ArrayList<Pointer> new()

_GObjectStruct: cover from GtkObject

/**
 * The base of the GObject hierarchy. Can send and receive signals
 */
_GObject: cover from _GObjectStruct* {

    connect: func ~nodata (signalName: String, callback: Func) -> GULong {
        c: Closure = callback as Closure
        // FIXME: this will leak, we haven't added a way to remove callbacks
        gcHack add(c context)
        g_signal_connect_swapped(this, signalName, GTK_SIGNAL_FUNC(c thunk), c context)
    }

    /**
     * usage:
     *
     * object connectNaked("some-signal", this, doStuff)
     * 
     * Hopefully the first pointer argument of doStuff will be event
     * except if it's a keyboard event in which case you want the function below
     */
    connectNaked: func (signalName: String, context, callback: Pointer) -> GULong {
        closure: Closure* = gc_malloc(Closure size)
        closure@ thunk   = callback
        closure@ context = context
        // FIXME: this will leaaaaak
        gcHack add(closure)

        g_signal_connect_swapped(this, signalName, GTK_SIGNAL_FUNC(nakedThunk), closure)
    }

    /**
     * usage:
     * 
     * object connectKeyEvent("key-press-event", |event| doStuff())
     *
     * Yes this is horrible. Blame gobject for having a kajillion different
     * callback types.
     */
    connectKeyEvent: func (signalName: String, callback: Func (Pointer)) -> GULong {
        closure: Closure* = gc_malloc(Closure size)
        // FIXME: this will leaaaaak
        gcHack add(closure)
        memcpy(closure, callback&, Closure size)

        g_signal_connect_swapped(this, signalName, GTK_SIGNAL_FUNC(keyEventsThunk), closure)
    }

}

keyEventsThunk: func (userData: Closure*, event: Pointer, object: _GObject) -> Bool {
    realFunc := userData@ as Func (Pointer)
    realFunc(event)
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
