import gtk.[Gtk, Window, Button]

main: func {
	w := new Window("Hi")
	w setUSize(800, 600) <- connect("delete_event", exit) <- showAll()
	b := new Button("Oh, really?")
	b connect("pressed", haha)
	w add(b)
	Gtk main()
}

haha: func {
	"What's so funny ?" println()
}

exit: extern func
