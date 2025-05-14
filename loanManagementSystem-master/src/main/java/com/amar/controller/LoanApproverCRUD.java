package com.amar.controller;
import java.util.List;

import org.springframework.http.HttpStatus;

import com.amar.model.Loanapprover;

public interface LoanApproverCRUD {
	
	public HttpStatus addLoaner(Loanapprover loanapprover);
	
	public List<Loanapprover> getAllLoaner();
	
	public Loanapprover getSingleLoaner(String loanername);
	
	public Loanapprover getSingleLoanerByEmail(String loaneremail);
	
	public Loanapprover updateLoaner(Loanapprover loanapprover);
	
 	public String deleteLoaner(String loaneremail);
}
