package com.example.demo.controllers;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.models.*;
import com.example.demo.services.*;
@Controller
@RequestMapping("/languages")
public class LangController {
	private final LangService langService;
	public LangController(LangService langService) {
		this.langService = langService;
	}
	
	@RequestMapping("")
	public String getAllLangs(Model model,@Valid @ModelAttribute("lang") Language lang,
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {
		List<Language> langs = langService.getAllLangs();
		model.addAttribute("langs", langs);
		return "languages.jsp";
	}
	
	@RequestMapping("/{bookId}")
	public String viewBook(@PathVariable("langId") Long langId, Model model) throws Exception {
		Optional<Language> bookOptional = langService.getLangById(langId);
		if(!bookOptional.isPresent()) {
			throw new Exception("Book not found with id:"+ langId);
		}
		
		Language lang = bookOptional.get();
		model.addAttribute("lang", lang);
		return "show.jsp";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String createlang(@ModelAttribute("lang") Language lang) {
		return "languages.jsp";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String storeLang(
			@Valid @ModelAttribute("lang") Language lang,
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes
			) {
		if(bindingResult.hasErrors()) {
			return "languages.jsp";
		}
		langService.createLang(lang);
		redirectAttributes.addFlashAttribute("success", "Your book has been created");
		return "redirect:/languages";
	}
	@RequestMapping("{langId}/edit")
    public String edit(@PathVariable("langId") Long langId, Model model) {
        Optional<Language> lang = langService.getLangById(langId);
        model.addAttribute("lang", lang);
        return "/edit.jsp";
    }
    
	
	@RequestMapping(value="/{langId}", method=RequestMethod.PUT)
	public Language updateLang(@Valid@ModelAttribute("lang") Language language,
			BindingResult bindingResult,
			@PathVariable("langId") Long langId, 
			@PathVariable("name") String name,
			@PathVariable("creator") String creator,
			@PathVariable("version") Double version) {
		return langService.updateLang(langId, name,  creator, version);
	}
	@RequestMapping(value="expenses/{langId}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("langId") Long langId) 
	{
		langService.deleteLang(langId);
		return "redirect:/expenses";
	}
}
