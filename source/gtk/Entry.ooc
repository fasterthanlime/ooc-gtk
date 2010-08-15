// GtkEntry - singleline textbox
// see http://library.gnome.org/devel/gtk/stable/GtkEntry.html

use gtk
import gtk/[Gtk, Widget]

Entry: cover from GtkEntry* extends Widget {

    new: extern(gtk_entry_new) static func () -> This
    //new: extern(gtk_entry_new_with_buffer) static func~withBuffer (buffer: EntryBuffer) -> This
    new: extern(gtk_entry_new_with_max_length) static func~withMaxLength (max: GInt) -> This
    
    activatesDefault: GBool {
        get: extern(gtk_entry_get_activates_default)
        set: extern(gtk_entry_set_activates_default)
    }
    
    /*
    buffer: EntryBuffer {
        get: extern(gtk_entry_get_buffer)
        set: extern(gtk_entry_set_buffer)
    }
    */
    
    // Used to hide the capslock warning in password boxes.
    capsLockWarning: GBool {
        get: extern(gtk_entry_get_caps_lock_warning)
        set: extern(gtk_entry_set_caps_lock_warning)
    }
    
    cursorPosition: Int {
        get: extern(gtk_entry_get_cursor_position)
    }
    
    // Enable editing by the user
    editable: GBool {
        get: extern(gtk_entry_get_editable)
        set: extern(gtk_entry_set_editable)
    }
    
    hasFrame?: GBool {
        get: extern(gtk_entry_get_has_frame)
        set: extern(gtk_entry_set_has_frame)
    }
    
    /*
    innerBorder: Border {
        get: extern(gtk_entry_get_inner_border)
        set: extern(gtk_entry_set_inner_border)
    }
    */
    
    // Set the "password char". Use `unsetInvisibleChar` to use the
    // default. Defaults to the "best" choice.
    invisibleChar: GChar {
        get: extern(gtk_entry_get_invisible_char)
        set: extern(gtk_entry_set_invisible_char)
    }
    
    // Enable/disable "password char"
    invisibleCharSet: GBool {
        get: extern(gtk_entry_get_invisible_char_set)
        set: extern(gtk_entry_set_invisible_char_set)
    }
    
    // Maximum amount of chars the entry can hold
    maxLength: GInt {
        get: extern(gtk_entry_get_max_length)
        set: extern(gtk_entry_set_max_length)
    }
    
    // Insert/replace modes(?)
    overwriteMode: GBool {
        get: extern(gtk_entry_get_overwrite_mode)
        set: extern(gtk_entry_set_overwrite_mode)
    }
    
    position: GInt {
        get: extern(gtk_entry_get_position)
        set: extern(gtk_entry_set_position)
    }
    
    // Where the selection starts
    scrollOffset: GInt {
        get: extern(gtk_entry_get_scroll_offset)
    }
    
    // Selection length(?)
    selectionBound: GInt {
        get: extern(gtk_entry_get_selection_bound)
    }
    
    /*
    shadowType: ShadowType {
        get: extern(gtk_entry_get_shadow_type)
        set: extern(gtk_entry_set_shadow_type)
    }
    */
    
    text: GString {
        get: extern(gtk_entry_get_text)
        set: extern(gtk_entry_set_text)
    }
    
    // Get the text length (does this need covering?)
    textLength: GUInt {
        get: extern(gtk_entry_get_text_length)
    }
    
    // Width in chars; -1 to reset.
    widthChars: GInt {
        get: extern(gtk_entry_get_width_chars)
        set: extern(gtk_entry_set_width_chars)
    }
    
    
    appendText: extern(gtk_entry_append_text) func (text: String)
    prependText: extern(gtk_entry_prepend_text) func (text: String)
    
    // Set the selection
    selectRegion: extern(gtk_entry_select_region) func (start, end: GInt)
    
    // Reset the password char to default
    unsetInvisibleChar: extern(gtk_entry_unset_invisible_char) func
}
