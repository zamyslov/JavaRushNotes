package zamyslov.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import zamyslov.entity.Note;

import java.util.List;

@Repository
public class NoteDAOImpl implements NoteDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public int addNote(Note note) {
        return (int) sessionFactory.getCurrentSession().save(note);
    }

    @Override
    public Note updateNote(Note note) {
        sessionFactory.getCurrentSession().update(note);
        return note;
    }

    @Override
    public void deleteNote(int id) {
        Note note = sessionFactory.getCurrentSession().get(Note.class,id);
        sessionFactory.getCurrentSession().delete(note);
    }

    @Override
    public List<Note> getAllNotes() {
        return sessionFactory.getCurrentSession().createQuery("FROM "+Note.class.getName()).list();
    }

    @Override
    public List<Note> sortByExecuted() {
        return null;
    }
}
