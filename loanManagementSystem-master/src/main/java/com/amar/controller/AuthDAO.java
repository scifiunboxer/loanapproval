package com.amar.controller;

import java.util.List;

import org.springframework.http.HttpStatus;

import com.amar.model.Student;

public interface AuthDAO {
	
	public HttpStatus addStudent(Student student);
	
	public List<Student> getAllStudents();
	
	public Student getSingleStudent(String username);
	
	public Student getSingleStudentByEmail(String email);
	
	public Student updateStudent(Student student);
	
 	public String deleteStudent(Student student);
 	
}
