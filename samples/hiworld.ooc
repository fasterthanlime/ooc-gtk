use gtk

import gtk/[Gtk, Window, Button]

main: func {
    win := Window new("GTK Hello World")
    win setUSize(400, 200) .connect("delete_event", exit)
    
    button := Button new("Click me!")
    button connect("clicked", func {
        "You tricked me!" println()
    }) .setBorderWidth(50)
    
    win add(button) .showAll()
    Gtk main()
}

g_print: extern func (String, ...)
exit: extern func
