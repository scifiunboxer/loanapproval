package com.amar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.amar.model.Loanapprover;

@Repository
public class LoanearApproverImp implements LoanApproverCRUD{
	
	@Autowired
	private HibernateTemplate ht;
	
	
	public HibernateTemplate getHt() {
		return ht;
	}

	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	@Override
	@Transactional
	public HttpStatus addLoaner(Loanapprover loanapprover) {
	    try {
	        ht.save(loanapprover);
	        return HttpStatus.CREATED;
	    } catch (Exception e) {
	        System.out.println("Error at addLoaner: " + e.getMessage());
	        return HttpStatus.INTERNAL_SERVER_ERROR;
	    }
	}

	@Override
	public List<Loanapprover> getAllLoaner() {
		// TODO Auto-generated method stub
		try {
			return ht.loadAll(Loanapprover.class);
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error at getallloaners: "+ e.getMessage());
			return null;
		}
	}

	@Override
	public Loanapprover getSingleLoaner(String loanername) {
		// TODO Auto-generated method stub
		try {
			String hql = "from loaner where loanername = :loanername";
			
			List<Loanapprover> loaners = (List<Loanapprover>) ht.find(hql, "loanername", loanername);
			if(!loaners.isEmpty()) {
				return loaners.get(0);
			}
			else {
				return null;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error at getsingleloaners: "+ e.getMessage());
			return null;
		}
	}

	@Override
	public Loanapprover getSingleLoanerByEmail(String loaneremail) {
		try {
			String hql = "from loaner where loaneremail = :loaneremail";
			
			List<Loanapprover> loaners = (List<Loanapprover>) ht.find(hql, "loaneremail", loaneremail);
			if(!loaners.isEmpty()) {
				return loaners.get(0);
			}
			else {
				return null;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error at getsingleloanersbyemail: "+ e.getMessage());
			return null;
		}
	}

    @Override
    @Transactional
    public Loanapprover updateLoaner(Loanapprover loanapprover) {
        try {
            String hql = "from Loanapprover where loaneremail = :loaneremail";
            List<Loanapprover> loaners = (List<Loanapprover>) ht.findByNamedParam(hql, "loaneremail", loanapprover.getLoaneremail());
            if (!loaners.isEmpty()) {
                Loanapprover existingLoaner = loaners.get(0);
                existingLoaner.setLoanername(loanapprover.getLoanername());
                existingLoaner.setLoanerage(loanapprover.getLoanerage());
                existingLoaner.setLoaneremail(loanapprover.getLoaneremail());
                existingLoaner.setLoanernumber(loanapprover.getLoanernumber());
                existingLoaner.setPassword(loanapprover.getPassword());
                ht.update(existingLoaner);
                return existingLoaner;
            } else {
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error at updateloaner: " + e.getMessage());
            return null;
        }
    }

    @Override
    @Transactional
    public String deleteLoaner(String loaneremail) {
        try {
            String hql = "from Loanapprover where loaneremail = :loaneremail";
            
            @SuppressWarnings("unchecked")
            List<Loanapprover> loaners = (List<Loanapprover>) ht.findByNamedParam(hql, "loaneremail", loaneremail);
            
            if (!loaners.isEmpty()) {
                Loanapprover existingLoaner = loaners.get(0); 
                
                ht.delete(existingLoaner);
                
                return "Loaner successfully deleted.";
            } else {
                return "Error Loaner with email " + loaneremail + " not found.";
            }
        } catch (Exception e) {
            System.out.println("Error at deleteLoaner: " + e.getMessage());
            
            return "Error occurred while deleting the loaner.";
        }
    }


}
