package zamyslov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import zamyslov.dao.NoteDAOImpl;

/**
 * Created by Oleg on 10.10.2017.
 */

@Controller
public class NoteController {

    @Autowired
    private NoteDAOImpl noteDAO;



}
