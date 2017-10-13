package zamyslov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import zamyslov.dao.NoteDAOImpl;
import zamyslov.entity.Note;
import zamyslov.service.NoteService;
import zamyslov.service.NoteServiceImpl;

import java.util.List;

/**
 * Created by Oleg on 10.10.2017.
 */

@Controller
public class NoteController {

    private static final int ROWS_PER_PAGE = 10;

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getAllNotes(Model model) {
        List<Note> notes = noteService.getAllNotes();
//        List<Note> users = noteService.getAllPage(0, 3);
//        if (usersfull.size() < 3) {
//            count = 1;
//        }else if (usersfull.size() > 3 && usersfull.size() % 3 > 0){
//            count = usersfull.size()/3+1;
//        }else{
//            count = usersfull.size()/3;
//        }

//        model.addAttribute("count", count);
        model.addAttribute("notes", notes);
//        model.addAttribute("usersfull", usersfull);
        return "notes";
    }



}
