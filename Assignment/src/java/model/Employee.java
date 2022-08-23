/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Namqd
 */
public class Employee {
    private int id;
    private String name;
    private ArrayList<Timesheet> timesheets = new ArrayList<>();
    private ArrayList<Leave> leaves = new ArrayList<>();

    public ArrayList<Leave> getLeaves() {
        return leaves;
    }
    public int getTotalLeaves()
    {
        int sum = 0;
        for (Leave leave : leaves) {
            sum+=leave.getTotalDays();
        }
        return sum;
    }

    public void setLeaves(ArrayList<Leave> leaves) {
        this.leaves = leaves;
    }
    
    
    public int getNumberOfWorkingDays()
    {
        return timesheets.size();
    }
    
    public float getNumberOfWorkingHours()
    {
        float sum = 0;
        for (Timesheet timesheet : timesheets) {
            sum+= timesheet.getWorkingHours();
        }
        return sum;
    }
    
    public ArrayList<Timesheet> getTimesheets() {
        return timesheets;
    }

    public void setTimesheets(ArrayList<Timesheet> timesheets) {
        this.timesheets = timesheets;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
