import gtk.[Gtk, Window, Button]

main: func {
	w := new Window("Hi")
	w setUSize(400, 200) .connect("delete_event", exit)
	
	b := new Button("Oh, really?")
	b connect("pressed", func g_print("What's so funny ?\n")) .setBorderWidth(50)
	
	w add(b) .showAll()
	Gtk main()
}

g_print: extern func (String, ...)
exit: extern func
