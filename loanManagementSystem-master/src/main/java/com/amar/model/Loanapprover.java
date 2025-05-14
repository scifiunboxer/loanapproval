package com.amar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="loanapprovers")
public class Loanapprover {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int loanerid;
    
    private String loanername;
    private String loaneremail;
    private long loanernumber;
    private int loanerage;

    @Column(name="password", nullable=false)
    private String password;

    // Default constructor
    public Loanapprover() {
    }

    // Getters and Setters
    public int getLoanerid() {
        return loanerid;
    }

    public void setLoanerid(int loanerid) {
        this.loanerid = loanerid;
    }

    public String getLoanername() {
        return loanername;
    }

    public void setLoanername(String loanername) {
        this.loanername = loanername;
    }

    public String getLoaneremail() {
        return loaneremail;
    }

    public void setLoaneremail(String loaneremail) {
        this.loaneremail = loaneremail;
    }

    public long getLoanernumber() {
        return loanernumber;
    }

    public void setLoanernumber(long loanernumber) {
        this.loanernumber = loanernumber;
    }

    public int getLoanerage() {
        return loanerage;
    }

    public void setLoanerage(int loanerage) {
        this.loanerage = loanerage;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
