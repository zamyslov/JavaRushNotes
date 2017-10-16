package zamyslov.controller;

import com.sun.javafx.sg.prism.NGShape;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    public ModelAndView getAllNotes(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("notespage");
        List<Note> notesList = noteService.getAllNotes();
        PagedListHolder<Note> pagedListHolder = new PagedListHolder<>(notesList);
        pagedListHolder.setPageSize(ROWS_PER_PAGE);
        modelAndView.addObject("maxPages",pagedListHolder.getPageCount());
        modelAndView.addObject("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("notesList", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("notesList", pagedListHolder.getPageList());
        }

        return modelAndView;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView editNote(@RequestParam(value = "id", required = true) Integer id, Model model) {
        return new ModelAndView("editpage", "noteAttribute", noteService.get(id));
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addNote() {
//        model.addAttribute("noteAttribute", new Note());
        return new ModelAndView("editpage", "noteAttribute", new Note());
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView saveNote(@ModelAttribute("noteAttribute") Note note) {
        if (note.getId() == 0) {
            noteService.addNote(note);
        } else {
            noteService.updateNote(note);
        }
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView deleteNote(@RequestParam(value = "id", required = true) Integer id) {
        noteService.deleteNote(id);
        return new ModelAndView("redirect:/");
    }


}
