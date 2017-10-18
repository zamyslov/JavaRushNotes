package zamyslov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import zamyslov.entity.Note;
import zamyslov.service.NoteService;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class NoteController {

    private static final int ROWS_PER_PAGE = 10;

    @Autowired
    private NoteService noteService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
    }

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
    public ModelAndView filterNote(@RequestParam(value = "id") Integer id) {
        //public ModelAndView filterNote(Model model) {
        List<Note> notesList = noteService.filterByExecuted(id);
        ModelAndView modelAndView = new ModelAndView("notespage");
        pagination(notesList, modelAndView);
        return modelAndView;
    }

    @RequestMapping(value = "/sortnotes", method = RequestMethod.GET)
    public ModelAndView sortNote(@RequestParam(value = "id") Integer id) {
        List<Note> notesList = noteService.sortNotes(id);
        ModelAndView modelAndView = new ModelAndView("notespage");
        pagination(notesList, modelAndView);
        return modelAndView;
    }

    private void pagination(List<Note> notesList, ModelAndView modelAndView) {
        PagedListHolder<Note> pagedListHolder = new PagedListHolder<>(notesList);
        pagedListHolder.setPageSize(ROWS_PER_PAGE);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        pagedListHolder.setPage(0);
        modelAndView.addObject("notesList", pagedListHolder.getPageList());
        modelAndView.addObject("page", 0);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView saveNote(@Valid @ModelAttribute("noteAttribute") Note note, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("editpage", "noteAttribute", note);
        } else {
            if (note.getId() == 0) {
                noteService.addNote(note);
            } else {
                noteService.updateNote(note);
            }
        }
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView deleteNote(@RequestParam(value = "id", required = true) Integer id) {
        noteService.deleteNote(id);
        return new ModelAndView("redirect:/");
    }


}
