package zamyslov.entity;


import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "notes")
public class Note implements Serializable {

    private static final long serialVersionUID = 35145776513L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;

    @Column(name = "text")
    public String text;

    @Column(name = "isExecuted", columnDefinition = "BIT")
    public boolean isExecuted;

    @Column(name = "createdDate")
    public Timestamp createdDate;

    public Note() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isExecuted() {
        return isExecuted;
    }

    public void setExecuted(boolean done) {
        isExecuted = done;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "Note{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", isDone=" + isExecuted +
                ", createdDate=" + createdDate +
                '}';
    }
}
