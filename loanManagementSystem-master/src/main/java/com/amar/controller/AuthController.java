package com.amar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amar.model.Loanapprover;
import com.amar.model.Student;
import com.amar.model.UserLoanDetails;

@Controller
public class AuthController {

    @Autowired
    private AuthDAO authdao;
    
    @Autowired
    private AuthDAOImp authdaoimp;

    
    @Autowired
    private LoanApproverCRUD loanerdao;

    @GetMapping("/*")
    public String redirectToIndex() {
        return "forward:/index.jsp";
    }

    @GetMapping("/")
    public ModelAndView home() {
        return new ModelAndView("index");
    }

    @GetMapping("/signup")
    public ModelAndView signup(Model model) {
        model.addAttribute("student", new Student());
        return new ModelAndView("signup");
    }
    
    @GetMapping("/login")
    public ModelAndView login(Model model) {
        model.addAttribute("student", new Student());
        return new ModelAndView("login");
    }
    
    @GetMapping("/admins")
    public ModelAndView admin(Model model, HttpSession session) {
    	boolean loggedInAdmin = (boolean) session.getAttribute("loggedInAdmin");
    	if(loggedInAdmin == true) {
    		return new ModelAndView("adminPage");
    	}
        return new ModelAndView("redirect:/login");
    }

    
    @GetMapping("/success")
    public ModelAndView success(HttpSession session) {
        ModelAndView mv = new ModelAndView("Sucess");
        if (session.getAttribute("loggedInStudent") != null && (boolean)session.getAttribute("Isloginuser") == true) {
        	return mv;
        }
        mv.setViewName("redirect:/login");
        return mv;
    }
    
    @GetMapping("/loaneradminoperations")
    public ModelAndView loaneradminoperations() {
    	return new ModelAndView("loaneradminoperations");
    }


    @PostMapping("/signup")
    public ModelAndView addsignup(@ModelAttribute Student student) {
        ModelAndView mv = new ModelAndView();
        String ur = student.getUsername();
        String em = student.getEmail();

        try {
            Student stdusername = authdao.getSingleStudent(ur);
            Student stdemail = authdao.getSingleStudentByEmail(em);

            if (stdusername == null && stdemail == null) {
                HttpStatus status = authdao.addStudent(student);
                if(status == HttpStatus.CREATED) {
	                mv.setViewName("login");
	                mv.addObject("message", "Student is added successfully");
                }
            } else {
                mv.setViewName("signup");
                mv.addObject("message", "Student already exists");
            }
        } catch (Exception e) {
            System.out.println("Error at adding student: " + e.getMessage());
        }

        return mv;
    }

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute Student student, HttpSession session, RedirectAttributes redirectAttributes, Model model) { //RedirectAttributes is used like model to store data for views when we redirect the data in the model will clear at that scope so we use the RedirectAttributes and FlashaddAttribute.
        ModelAndView mv = new ModelAndView(); 
        String em = student.getEmail();
        String pass = student.getPassword();

        try {
        	if("admin".equals(em) && "admin".equals(pass)) {
                session.setAttribute("loggedInAdmin", true);
                return new ModelAndView("redirect:/admins"); 
        	}
        	else if("devi@gmail.com".equals(em) && "devi9".equals(pass)) {
        		redirectAttributes.addFlashAttribute("loginmsg", "Logged in successfully");
            	session.setAttribute("username", student.getUsername());
                redirectAttributes.addFlashAttribute("data", student); 
                session.setAttribute("loggedInStudent", em);
                session.setAttribute("Isloginuser", true);
                mv.setViewName("redirect:/success");
        	}
        	else {
        		System.out.println("Attempting to log in with email: " + em);
                
                Student stdemail = authdao.getSingleStudentByEmail(em);
                
                if (stdemail != null) {
                    System.out.println("Email exists in the database.");
                    if (stdemail.getPassword().equals(pass)) { 
                    	redirectAttributes.addFlashAttribute("loginmsg", "Logged in successfully");
                    	session.setAttribute("username", stdemail.getUsername());
                        redirectAttributes.addFlashAttribute("data", stdemail); 
                        session.setAttribute("loggedInStudent", stdemail);
                        session.setAttribute("Isloginuser", true);
                        mv.setViewName("redirect:/success"); 
                    } else {
                        mv.addObject("loginmsg", "Invalid password");
                        mv.setViewName("login"); 
                    }
                } else {
                    mv.addObject("loginmsg", "Failed to login user or email has no account");
                    mv.setViewName("login");
                }
        	}
            
        } catch (Exception e) {
            System.out.println("Error at login student: " + e.getMessage());
            mv.addObject("loginmsg", "An error occurred during login. Please try again.");
            mv.setViewName("login");
        }

        return mv;
    }
    
    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session) {
    	session.setAttribute("loggedInAdmin", false);
    	return new ModelAndView("redirect:/login");
    }
    
    @GetMapping("/addloaner")
    public ModelAndView addLoaner(Model model) {
    	model.addAttribute("loaner", new Loanapprover());
    	return new ModelAndView("addLoaner");
    }
    
    @GetMapping("/updateloaner")
    public ModelAndView updateLoaner(Model model) {
    	model.addAttribute("loaner", new Loanapprover());
    	return new ModelAndView("updateLoaner");
    }
    
    @GetMapping("/getallloaners")
    public ModelAndView getAllLoaners() {
    	return new ModelAndView("GetAllLoaners");
    }
    
    @GetMapping("/deleteloaner")
    public ModelAndView deleteLoaner(Model model) {
    	model.addAttribute("loaner", new Loanapprover());
    	return new ModelAndView("deleteLoaner");
    }
    
    
    @PostMapping("/addloaner")
    public String postaddLoaner(@ModelAttribute Loanapprover loaner, RedirectAttributes redirectAttributes) {
        HttpStatus status = loanerdao.addLoaner(loaner);
        if (status == HttpStatus.CREATED) {
            redirectAttributes.addFlashAttribute("operation", "Loaner added successfully");
            return "redirect:/loaneradminoperations"; 
        } else {
            System.out.println("Loaner not added");
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to add loaner");
            return "redirect:/loaneradminoperations";  // Redirect to the same page to display error
        }
    }
    
    @PostMapping("/updateloaner")
    public ModelAndView postupdateLoaner(@ModelAttribute Loanapprover loanapprover) {
    	ModelAndView mv = new ModelAndView();
    	Loanapprover loaner = loanerdao.updateLoaner(loanapprover);
    	
    	if(loaner != null) {
    		mv.addObject("updateloaner", loaner);
    		mv.setViewName("loaneradminoperations");
    		return mv;
    	}
    	else {
    		System.out.println("no loaners to update");
    		return null;
    	}
    }
    
    @PostMapping("/getallloaners")
    public ModelAndView postgetAllLoaners(@ModelAttribute Loanapprover loaner, Model model) {
        ModelAndView mv = new ModelAndView("loaneradminoperations");
        List<Loanapprover> loaners = loanerdao.getAllLoaner();
        
        if (loaners != null) {
            model.addAttribute("alloaners", loaners); 
            return mv;
        } else {
            System.out.println("No loaners exist");
            return new ModelAndView("error");
        }
    }
    
    @PostMapping("/deleteloaner")
    public ModelAndView postdeleteLoaner(@ModelAttribute Loanapprover loaner, Model model, RedirectAttributes rda) {
        ModelAndView mv = new ModelAndView();
        String msg = loanerdao.deleteLoaner(loaner.getLoaneremail());
        
        if (msg != null) {
            mv.addObject("deletemsg", msg);
            model.addAttribute("deletemsg", msg);
            mv.setViewName("loaneradminoperations");
        } else {
            rda.addFlashAttribute("deletemsg", "Loaner could not be deleted or was not found.");
            mv.setViewName("redirect:/deleteloaner");
        }
        
        return mv;
    }
    
    @GetMapping("/loantypes")
    public ModelAndView loantypes() {
    	return new ModelAndView("LoanTypes");
    }
    
    @GetMapping("/userlogout")
    public ModelAndView userlogout(HttpSession session) {
//    	boolean Isloginuser = (boolean) session.getAttribute("Isloginuser");
    	session.setAttribute("Isloginuser", false);
    	return new ModelAndView("redirect:/login");
    }
    
    @GetMapping("/userdetailsform")
    public ModelAndView saveUserDetails(Model model) {
    	model.addAttribute("userloandetails", new UserLoanDetails());
    	return new ModelAndView("userloandetails");
    }
    
    @RequestMapping(value = "/saveuserdetail", method = RequestMethod.POST)
    public ModelAndView saveUserDetails(@ModelAttribute UserLoanDetails userLoanDetails,
                                         @RequestParam("document") MultipartFile file) {
        ModelAndView mv = new ModelAndView();
        
        System.out.println("Full Name: " + userLoanDetails.getFullname());
        System.out.println("Loan Type: " + userLoanDetails.getLoanType());
        System.out.println("Email: " + userLoanDetails.getEmail());
        System.out.println("Phone Number: " + userLoanDetails.getPhoneNumber());
        System.out.println("Document Size: " + (file != null ? file.getSize() : "No file uploaded"));

        if (file != null && !file.isEmpty()) {
            try {
                // Convert MultipartFile to byte[]
                userLoanDetails.setDocument(file.getBytes()); // This is the crucial part

                // Now save the userLoanDetails
                authdaoimp.saveImage(userLoanDetails);
                mv.addObject("userloandetails", "User details uploaded successfully");
                mv.setViewName("Success");
            } catch (Exception e) {
                mv.addObject("errorMessage", "Error at uploading document: " + e.getMessage());
                mv.setViewName("login");
            }
        } else {
            mv.addObject("errorMessage", "Error: Document file cannot be empty");
            mv.setViewName("login");
        }
        return mv;
    }

    @PostMapping("/submittemp")
    public ModelAndView submittemp() {
    	return new ModelAndView("submittemp");
    }

    
}
