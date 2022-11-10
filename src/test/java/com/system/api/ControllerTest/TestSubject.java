package com.system.api.ControllerTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.springframework.http.MediaType;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.api.controller.SubjectController;
import com.system.api.entity.Subject;
import com.system.api.model.SubjectDTO;
import com.system.api.repository.SubjectRepository;
import com.system.api.service.SubjectService;
import com.system.api.servicelmpl.SubjectServicelmpl;

@ExtendWith(MockitoExtension.class)
public class TestSubject {

	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private MockMvc mockMvc;

	@Mock
	private ModelMapper modelMapper;

	@Mock
	private SubjectService subjectService;

	@InjectMocks
	private SubjectController subjectController;

	Subject subject;

	SubjectDTO subjectDTO;
	
	List<SubjectDTO> subjects = new ArrayList<>();
	
	@BeforeEach
	public void setup() {
		mockMvc = MockMvcBuilders.standaloneSetup(subjectController).build();
		
		subjectDTO = new SubjectDTO(1,"Test111",true);
		subject = new Subject(1,"Test111",true);
		
		for(int i = 2;i<=10;i++) {
			SubjectDTO sb= new SubjectDTO();
			sb.setId(i+1);
			sb.setSubjectName("Test"+i);
			sb.setSubjectStatus(true);
			subjects.add(sb);
		}
		
	}

	@DisplayName("Tess Add SubjectDTO")
	@Test
	public void test_Post_Subject_200() throws JsonProcessingException, Exception {
	
		MvcResult mvcResult = mockMvc
				.perform(MockMvcRequestBuilders.post("/api/v1/subject").contentType(MediaType.APPLICATION_JSON)
						.content(new ObjectMapper().writeValueAsString(subjectDTO)))
				.andReturn();
		System.out.println(subjectDTO);
		assertEquals(200, mvcResult.getResponse().getStatus());
		
		
	}	
	
	
	@DisplayName("Test Status get All Subject")
	@Test
	public void test_get_Subject_By_ID_200() throws JsonProcessingException, Exception {

		when(subjectService.getAllSubject()).thenReturn(subjects);
		MvcResult mvcResult = mockMvc
				.perform(MockMvcRequestBuilders.get("/api/v1/subjects").contentType(MediaType.APPLICATION_JSON)).andReturn();
				
		     assertEquals(200, mvcResult.getResponse().getStatus());
		
	}
	
	@DisplayName("Test Status get Subject by Id")
	@Test
	public void test_Status_When_get_Subject_By_Id() throws Exception {
	
		when(subjectService.getSubject(1)).thenReturn(Optional.of(subject));
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/subject/1").contentType(MediaType.APPLICATION_JSON))
				.andReturn();
		assertThat(mvcResult.getResponse().getStatus()).isEqualTo(200);
		
	}
	
	@DisplayName("Test Status get Subject by Id1")
	@Test
	public void test_Status_When_get_Subject_By_Id1() throws Exception {
	
		when(subjectService.getSubject(3)).thenReturn(Optional.of(new Subject(null,null,true)));
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/subject/3").contentType(MediaType.APPLICATION_JSON))
				.andReturn();
		assertThat(mvcResult.getResponse().getStatus()).isEqualTo(200);
		
	}
	
	
	
	
	

}
