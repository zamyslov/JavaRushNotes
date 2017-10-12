package zamyslov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import zamyslov.dao.NoteDAOImpl;
import zamyslov.service.NoteServiceImpl;

/**
 * Created by Oleg on 10.10.2017.
 */

@Controller
public class NoteController {

    private static final int ROWS_PER_PAGE = 10;

    @Autowired
    private NoteServiceImpl noteService;





}
