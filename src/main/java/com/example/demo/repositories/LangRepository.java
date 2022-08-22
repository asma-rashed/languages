package com.example.demo.repositories;

import java.util.List;
import com.example.demo.models.*;

import org.springframework.data.repository.CrudRepository;

public interface LangRepository extends CrudRepository<Language, Long>{
	
    // this method retrieves all the books from the database
    List<Language> findAll();

	
}
