package com.nagarro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nagarro.entities.Book;

@RestController
public class HomeController {

	@Bean
	public RestTemplate getRestTemplate() {
		return new RestTemplate();
	}

	@Autowired
	private RestTemplate restTemplate;

	static final String bookManagement_url = "http://localhost:3030/";

	@GetMapping("/display")
	public ModelAndView fetchAllBooks(Model model) throws JsonMappingException, JsonProcessingException {
		ModelAndView mv = new ModelAndView();
		String booksList = restTemplate.exchange(bookManagement_url + "books", HttpMethod.GET, null, String.class)
				.getBody();
		ObjectMapper objectMapper = new ObjectMapper();
		List<Book> bookList = objectMapper.readValue(booksList, new TypeReference<List<Book>>() {
		});

		model.addAttribute("booksList", bookList);
		mv.setViewName("bookListing");
		return mv;
	}

	@PostMapping("/addBooks")
	public String addBook(@RequestParam("bookCode") int bookCode, @RequestParam("bookName") String bookName,
			@RequestParam("author") String author, @RequestParam("addedon") String addedon, Model model) {
		Book book = new Book(bookCode, bookName, author, addedon);

		String url = "http://localhost:3030/books";
		restTemplate.postForObject(url, book, String.class);
		model.addAttribute("message", "Book added successfully");
		return "Book Added Succesfully ! ";
	}

	@GetMapping("/deleteBook")
	public String deleteBook(@RequestParam("id") int id) {
		RestTemplate restTemplate = new RestTemplate();
		String url = "http://localhost:3030/books/{id}";
		restTemplate.delete(url, id);
		return "Book Deleted Succesfully ! ";
	}
	
	@PostMapping("/editBook")
	public String editBook(@RequestParam("bookCode") int bookCode, @RequestParam("bookName") String bookName,
			@RequestParam("author") String author, @RequestParam("addedon") String addedon, Model model) {
		Book book = new Book(bookCode, bookName, author, addedon);

		String url = "http://localhost:3030/addBooks/{bookCode}";
		restTemplate.put(url, book, bookCode);
		model.addAttribute("message", "Book Updated and Added Succesfully !");
		return "Book Updated Succesfully ! ";
	}
	
}
