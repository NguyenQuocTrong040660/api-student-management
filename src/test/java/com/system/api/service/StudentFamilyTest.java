package com.system.api.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.modelmapper.ModelMapper;

import com.system.api.entity.StudentFamily;
import com.system.api.model.StudentDTO;
import com.system.api.model.StudentFamilyDTO;
import com.system.api.repository.StudentFamilyRepository;
import com.system.api.repository.StudentRepository;
import com.system.api.servicelmpl.StudentFamilyServicelmpl;

@ExtendWith(MockitoExtension.class)
public class StudentFamilyTest {

	@Mock
	private StudentFamilyRepository studentFamilyRepository;

	@Mock
	private ModelMapper modelMapper;

	@Mock
	private StudentFamilyDTO studentFamilyDTO;

	@Mock
	private StudentFamily studentFamily;
	
	
	@InjectMocks
	private StudentFamilyServicelmpl studentFamilyServicelmpl;
	
	

	@Captor
	ArgumentCaptor<StudentFamilyDTO> studentFamilyDTOA;

	@Test
	@DisplayName("Test Should Pass When Comment do not Contains Swear Words")
	public void shouldNotContainSwearWordsInsideComment() {
		StudentFamilyServicelmpl commentService = new StudentFamilyServicelmpl();
		assertThat(commentService.containsSwearWords("shit")).isFalse();
	}
	
	
	
	@Test
	 @DisplayName("Should Retrieve StudentFamyly by Id")
	public void testFindIdPost() {
		StudentFamilyServicelmpl studentFamilyServicelmpl = new StudentFamilyServicelmpl();
		
		StudentFamilyDTO studentFamilyDTO = new StudentFamilyDTO( "mother name JulyA", "Father name Jonh", "A@gmail.com","0917265227",null);
       given(studentFamilyRepository.save(studentFamilyServicelmpl.convertIntoEntity(studentFamilyDTO))).willReturn(studentFamilyServicelmpl.convertIntoEntity(studentFamilyDTO));
       
       StudentFamilyDTO studentF = studentFamilyServicelmpl.saveStudentFamily(studentFamilyDTO);
       assertThat(studentF).isNotNull();
       
       
       System.out.println("--Save product--");
       System.out.println(studentF);
       
      
 
	}

}
