package zamyslov.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import zamyslov.dao.NoteDAO;
import zamyslov.entity.Note;

import java.util.List;


@Service
@Transactional
public class NoteServiceImpl implements NoteService {

    @Autowired
    private NoteDAO noteDAO;

    @Override
    public int addNote(Note note) {
        return noteDAO.addNote(note);
    }

    @Override
    public Note updateNote(Note note) {
        return noteDAO.updateNote(note);
    }

    @Override
    public void deleteNote(int id) {
        noteDAO.deleteNote(id);
    }

    @Override
    public List<Note> getAllNotes() {
        return noteDAO.getAllNotes();
    }

    @Override
    public List<Note> filterByExecuted(Integer id) {
        return noteDAO.filterByExecuted(id);
    }

    @Override
    public Note get(Integer id ) {
        return noteDAO.get(id);
    }

    @Override
    public List<Note> sortNotes(Integer id) {
        return noteDAO.sortNotes(id);
    }
}
