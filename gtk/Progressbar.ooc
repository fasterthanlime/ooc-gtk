use gdk, gtk
import gtk/[Gtk, Widget]

ProgressbarStruct: cover from GtkProgressBar {
	window: extern GdkWindow*
	allocation: extern GtkAllocation	
}	

ProgressBar: cover from ProgressBarStruct*  extends Widget {
	
	new: extern(gtk_progress_bar_new) static func -> Widget
	pulse: extern(gtk_progress_bar_pulse) func
	
}
