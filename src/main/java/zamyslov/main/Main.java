package zamyslov.main;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import zamyslov.entity.Note;

/**
 * Created by Oleg on 08.10.2017.
 */
public class Main {
    public static void main(String[] args) {
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Note note = session.get(Note.class,2);
        System.out.println(note);

        transaction.commit();
        session.close();
        sessionFactory.close();
    }
}
