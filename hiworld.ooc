import gtk.[Gtk, Window, Button]

main: func {
	win := new Window("Hi")
	win setUSize(400, 200) .connect("delete_event", exit)
	
	button := new Button("Oh, really?")
	button connect("clicked", func g_print("What's so funny ?\n")) .setBorderWidth(50)
	
	win add(button) .showAll()
	Gtk main()
}

g_print: extern func (String, ...)
exit: extern func
