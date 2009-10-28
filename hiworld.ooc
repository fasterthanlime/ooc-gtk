use gtk

import gtk/[Gtk, Window, Button]

main: func {
	win := Window new("Hi")
	win setUSize(400, 200) .connect("delete_event", exit)
	
	button := Button new("Oh, really?")
	button connect("clicked", func {
        g_print("What's so funny ?\n")
        //Exception new("Oh it's the end of the world") throw()
    }) .setBorderWidth(50)
	
	win add(button) .showAll()
	Gtk main()
}

g_print: extern func (String, ...)
exit: extern func
