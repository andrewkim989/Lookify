package com.andrewkim.lookify.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.andrewkim.lookify.models.Lookify;
import com.andrewkim.lookify.services.LookifyService;

@Controller
public class LookifyController {
	private final LookifyService lookifyService;
	
	public LookifyController(LookifyService lookifyService) {
        this.lookifyService = lookifyService;
    }
	
	@RequestMapping("/")
	public String welcome() {
		return "welcome.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String table (Model model) {
        List<Lookify> lookify = lookifyService.allData();
        model.addAttribute("lookify", lookify);
        return "/home.jsp";
    }
	
	@RequestMapping("/songs/new")
	public String create (@ModelAttribute("lookify") Lookify lookify) {
        return "/new.jsp";
    }
	
	@RequestMapping(value = "/songs/new/process", method = RequestMethod.POST)
    public String create (@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result) {
        if (result.hasErrors()) {
            return "/new.jsp";
        }
        else {
        	lookifyService.createLookify(lookify);
            return "redirect:/dashboard";
        }
    }
	
	@RequestMapping("/songs/{id}")
    public String show (@PathVariable("id") Long id, HttpSession session) {
    	Lookify song = lookifyService.findSong(id);
    	session.setAttribute("song", song);
        return "song.jsp";
    }
	
	@RequestMapping(value = "/songs/{id}/delete", method = RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
        lookifyService.deleteLookify(id);
        return "redirect:/dashboard";
    }
	
	@RequestMapping("/search/artist")
	public String findArtist(HttpSession session, HttpServletRequest request) {
		String artist = request.getParameter("artist");
		List<Lookify> songs = lookifyService.allArtist(artist);
		session.setAttribute("songs", songs);
		session.setAttribute("artist", artist);
		return "redirect:/search/" + artist;
	}
	
	@RequestMapping("/search/{artist}")
	public String artistSongs(@PathVariable("artist") String artist) {
		return "/artistsongs.jsp";
	}
	
	@RequestMapping("/search/topTen")
	public String topTen(Model model) {
		List<Lookify> lookify = lookifyService.topTen();
		System.out.println(lookify);
        model.addAttribute("lookify", lookify);
		return "topten.jsp";
	}
}
