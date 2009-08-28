import gtk.Gtk, gtk.Window

main: func {
	w := new Window("Hi")
	w setUSize(800, 600) <- showAll() ^ connect("delete_event", exit)
	Gtk main()
}

exit: extern func
