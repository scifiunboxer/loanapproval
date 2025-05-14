//package com.amar.controller;
//
//import org.hibernate.HibernateException;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.orm.hibernate5.HibernateTemplate;
//import org.springframework.stereotype.Component;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.amar.model.Student;
//
//import java.util.List;
//
//@Component
//@Repository
//public class AuthDAOImp implements AuthDAO {
//
//	@Autowired
//    private HibernateTemplate ht;
//
//	public HibernateTemplate getHt() {
//		return ht;
//	}
//
//	public void setHt(HibernateTemplate ht) {
//		this.ht = ht;
//	}
//	
//	@Transactional
//	@Override
//    public HttpStatus addStudent(Student student) {
//        try {
//            ht.save(student);
//            return HttpStatus.CREATED;
//        } catch (Exception e) {
//            System.out.println("Error at student adding: " + e.getMessage());
//            return HttpStatus.INTERNAL_SERVER_ERROR;
//        }
//    }
//
//    @Override
//    public List<Student> getAllStudents() {
//        try {
//            return ht.loadAll(Student.class);
//        } catch (Exception e) {
//            System.out.println("Error at getting all students: " + e.getMessage());
//            return null;
//        }
//    }
//
//    @Override
//    public Student getSingleStudent(String username) {
//        try {
//            String query = "from Student where username = :username";
//            List<Student> students = (List<Student>) ht.findByNamedParam(query, "username", username);
//            if (!students.isEmpty()) {
//                return students.get(0);  // Return the first result if found
//            }
//            return null;  // Return null if no student found
//        } catch (Exception e) {
//            System.out.println("Error at getting single student: " + e.getMessage());
//            return null;
//        }
//    }
//
//
//    @Override
//    public Student getSingleStudentByEmail(String email) {
//        try {
//            // Get the current session
//        	 	@Autowired
//        	    private SessionFactory sessionFactory;
//            Session session = sessionFactory.getCurrentSession(); // Assuming sessionFactory is properly initialized
//            // Use HQL to query the Student entity by email
//            Student student = session.createQuery("FROM Student WHERE email = :email", Student.class)
//                                     .setParameter("email", email)
//                                     .uniqueResult();
//            
//            // Check if a student was found
//            if (student != null) {
//                return student; 
//            } else {
//                System.out.println("No student found with email: " + email);
//                return null; 
//            }
//        } catch (Exception e) {
//            System.out.println("Error at getting single student by email: " + e.getMessage());
//            return null; // Return null in case of an exception
//        }
//    }
//
//
//
//
//
//    @Override
//    public Student updateStudent(Student student) {
//        try {
//            ht.saveOrUpdate(student);
//            return student; 
//        } catch (Exception e) {
//            System.out.println("Error at updating student: " + e.getMessage());
//            return null;
//        }
//    }
//
//    @Override
//    public String deleteStudent(Student student) {
//        try {
//            String username = student.getUsername();
//            ht.delete(student);
//            return "Student " + username + " is deleted.";
//        } catch (Exception e) {
//            System.out.println("Error at deleting student: " + e.getMessage());
//            return "Error deleting student.";
//        }
//    }
//
//}



package com.amar.controller;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.amar.model.Student;
import com.amar.model.UserLoanDetails;

import java.util.List;

@Repository
public class AuthDAOImp implements AuthDAO {

    @Autowired
    private HibernateTemplate ht;

    @Autowired
    private SessionFactory sessionFactory; // Move this outside of the method

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    @Override
    public HttpStatus addStudent(Student student) {
        try {
            ht.save(student);
            return HttpStatus.CREATED;
        } catch (Exception e) {
            System.out.println("Error at student adding: " + e.getMessage());
            return HttpStatus.INTERNAL_SERVER_ERROR;
        }
    }

    @Override
    public List<Student> getAllStudents() {
        try {
            return ht.loadAll(Student.class);
        } catch (Exception e) {
            System.out.println("Error at getting all students: " + e.getMessage());
            return null;
        }
    }

    @Override
    public Student getSingleStudent(String username) {
        try {
            String query = "from Student where username = :username";
            List<Student> students = (List<Student>) ht.findByNamedParam(query, "username", username);
            if (!students.isEmpty()) {
                return students.get(0); 
            }
            return null;  
        } catch (Exception e) {
            System.out.println("Error at getting single student: " + e.getMessage());
            return null;
        }
    }

    @Override
    @Transactional
    public Student getSingleStudentByEmail(String email) {
        try {
        	String query = "from Student where email = :email";
        	List<Student> stds = (List<Student>)ht.findByNamedParam(query, "email", email);
        	
        	if(!stds.isEmpty()) {
        		return stds.get(0);
        	}
        	return null;
          
        } catch (Exception e) {
            System.out.println("Error at getting single student by email: " + e.getMessage());
            return null; 
        }
    }

    @Override
    public Student updateStudent(Student student) {
        try {
            ht.saveOrUpdate(student);
            return student;
        } catch (Exception e) {
            System.out.println("Error at updating student: " + e.getMessage());
            return null;
        }
    }

    @Override
    public String deleteStudent(Student student) {
        try {
            String username = student.getUsername();
            ht.delete(student);
            return "Student " + username + " is deleted.";
        } catch (Exception e) {
            System.out.println("Error at deleting student: " + e.getMessage());
            return "Error deleting student.";
        }
    }
    
    @Transactional
    public void saveImage(UserLoanDetails userloandetails) {
        ht.save(userloandetails);
    }




}

