package zamyslov.controller;

import com.sun.javafx.sg.prism.NGShape;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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
        List<Note> notesList = noteService.getAllNotes();
//        List<Note> users = noteService.getAllPage(0, 3);
//        if (usersfull.size() < 3) {
//            count = 1;
//        }else if (usersfull.size() > 3 && usersfull.size() % 3 > 0){
//            count = usersfull.size()/3+1;
//        }else{
//            count = usersfull.size()/3;
//        }

//        model.addAttribute("count", count);
        model.addAttribute("notesList", notesList);
//        model.addAttribute("usersfull", usersfull);
        //return new ModelAndView("notes", "notes", notesList);
        return "notes";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value="id", required=true) Integer id, Model model) {
        model.addAttribute("userAttribute", noteService.get(id));
        return "editpage";
    }



}
