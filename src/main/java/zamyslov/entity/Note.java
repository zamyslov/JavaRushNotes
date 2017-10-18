package zamyslov.entity;


import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "notes")
public class Note implements Serializable {

    private static final long serialVersionUID = 35145776513L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;

    @NotEmpty(message = "Please enter your text.")
    @Column(name = "text")
    public String text;

    @Column(name = "isDone",columnDefinition = "TINYINT(1)")
    public boolean isDone;

    @NotNull(message = "Please enter your date.")
    @Column(name = "createdDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    public Date createdDate;

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

    public boolean isisDone() {
        return isDone;
    }

    public void setisDone(boolean done) {
        isDone = done;
    }

    public Date  getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "Note{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", isDone=" + isDone +
                ", createdDate=" + createdDate +
                '}';
    }
}
