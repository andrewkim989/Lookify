package com.andrewkim.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.andrewkim.lookify.models.Lookify;
import com.andrewkim.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	private final LookifyRepository lookifyRepository;
	
	public LookifyService (LookifyRepository lookifyRepository) {
		this.lookifyRepository = lookifyRepository;
	}
	
	public List<Lookify> allData() {
		return lookifyRepository.findAll();
	}
	
	public List<Lookify> allArtist(String artist) {
		return lookifyRepository.findByArtistContaining(artist);
	}
	
	public Lookify createLookify (Lookify lookify) {
		return lookifyRepository.save(lookify);
	}
	
	public Lookify findSong(Long id) {
        Optional<Lookify> optionalSong = lookifyRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        }
        else {
            return null;
        }
    }
	
	public List<Lookify> topTen() {
		return lookifyRepository.findTop10ByOrderByRatingDesc();
	}
	
	public Lookify updateLookify(Lookify lookify) {
    	return lookifyRepository.save(lookify);
    }
    
    public void deleteLookify(Long id) {
    	lookifyRepository.deleteById(id);
    }
}
