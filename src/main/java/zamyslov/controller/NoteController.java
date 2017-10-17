package zamyslov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import zamyslov.entity.Note;
import zamyslov.service.NoteService;

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
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            page = 1;
            modelAndView.addObject("notesList", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("notesList", pagedListHolder.getPageList());
        }
        modelAndView.addObject("page", page);

        return modelAndView;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView editNote(@RequestParam(value = "id", required = true) Integer id) {
        return new ModelAndView("editpage", "noteAttribute", noteService.get(id));
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addNote() {
        return new ModelAndView("editpage", "noteAttribute", new Note());
    }

    @RequestMapping(value = "/filternotes", method = RequestMethod.GET)
    //public ModelAndView filterNote(@RequestParam(value = "filter") String filter) {
    public ModelAndView filterNote(Model model) {
        String filter = "";
        List<Note> notesList = noteService.filterByExecuted(filter);
        ModelAndView modelAndView = new ModelAndView("notespage");
        PagedListHolder<Note> pagedListHolder = new PagedListHolder<>(notesList);
        pagedListHolder.setPageSize(ROWS_PER_PAGE);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        pagedListHolder.setPage(0);
        modelAndView.addObject("notesList", pagedListHolder.getPageList());
        modelAndView.addObject("page", 0);
        return modelAndView;
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
