/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import Date.Datetime;
import java.util.Date;

/**
 *
 * @author Namqd
 */
public class Leave {
    private int id;
    private Employee employee;
    private Date from;
    private Date to;
    private int reason; //1 om, 2 con-om, 3 CT, 4 TS, 5 -TN, 6 DS,...
    
    public int getTotalDays()
    {
        return Datetime.getDates(from, to).size();
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Date getFrom() {
        return from;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public Date getTo() {
        return to;
    }

    public void setTo(Date to) {
        this.to = to;
    }

    public int getReason() {
        return reason;
    }

    public void setReason(int reason) {
        this.reason = reason;
    }
    
    
}
