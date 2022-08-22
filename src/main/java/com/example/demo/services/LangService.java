package com.example.demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.example.demo.models.*;
import com.example.demo.repositories.*;
@Service
public class LangService {
private final LangRepository langRepository;
    
    public LangService(LangRepository langRepository) {
        this.langRepository = langRepository;
    }
    
    public Optional<Language> getLangById(Long langId) {
    	return langRepository.findById(langId);
    }
    
    public List<Language> getAllLangs() {
    	return langRepository.findAll();
    }
    
    // creates a book
    public Language createLang(Language b) {
        return langRepository.save(b);
    }
    public Language updateLang(Long langId, String name, String creator, double version) {
    	Optional<Language> optionalLanguage = langRepository.findById(langId);
		if (optionalLanguage.isPresent()) {
			Language language = optionalLanguage.get();
			
			language.setName(name);
			language.setCreator(creator);
			language.setVersion(version);
			
			
			return langRepository.save(language);
		}
		else {
			return null;
		}
    }
    public void deleteLang(Long langId) {
		langRepository.deleteById(langId);
	}
}
