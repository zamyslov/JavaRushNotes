package zamyslov.service;


import zamyslov.entity.Note;

import java.util.List;

/**
 * Created by Oleg on 10.10.2017.
 */

public interface NoteService {
    int addNote(Note note);
    Note updateNote(Note note);
    void deleteNote(int id);
    List<Note> getAllNotes();
    List<Note> sortByExecuted();

}
