/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Date.Datetime;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.Leave;
import model.Timesheet;

/**
 *
 * @author Namqd
 */
public class EmployeeDBContext extends DBContext {

    public ArrayList<Employee> getEmployees(Date begin, Date end) {
        ArrayList<Employee> employees = new ArrayList<>();
        try {
            String sql = "SELECT e.eid,e.ename,ISNULL(t.tid,-1) tid,t.checkin,t.checkout\n"
                    + "                                        FROM Employee e\n"
                    + "                                       	LEFT JOIN (SELECT * FROM Timesheet WHERE \n"
                    + "                                        checkin >= ?\n"
                    + "                                       	AND\n"
                    + "                                       	checkin < ?) t \n"
                    + "                                       	ON e.eid = t.eid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, Datetime.getTimeStamp(Datetime.removeTime(begin)));
            stm.setTimestamp(2, Datetime.getTimeStamp(Datetime.removeTime(end)));
            ResultSet rs = stm.executeQuery();
            Employee curEmp = new Employee();
            curEmp.setId(-1);
            while (rs.next()) {
                int eid = rs.getInt("eid");
                if (eid != curEmp.getId()) {
                    curEmp = new Employee();
                    curEmp.setId(eid);
                    curEmp.setName(rs.getString("ename"));
                    employees.add(curEmp);
                }
                int tid = rs.getInt("tid");
                if (tid != -1) {
                    Timesheet t = new Timesheet();
                    t.setEmployee(curEmp);
                    t.setId(tid);
                    t.setCheckin(Datetime.getDateFrom(rs.getTimestamp("checkin")));
                    t.setCheckout(Datetime.getDateFrom(rs.getTimestamp("checkout")));
                    curEmp.getTimesheets().add(t);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Leave leave = new Leave();
        leave.setId(1);
        leave.setId(2);
        leave.setId(3);
        leave.setId(4);
        leave.setReason(1);
        leave.setEmployee(employees.get(0));
        leave.setEmployee(employees.get(1));
        leave.setEmployee(employees.get(2));
        leave.setEmployee(employees.get(3));
        Date d = new Date();
        d = Datetime.removeTime(d);
        leave.setFrom(Datetime.addDays(d, 4));
        leave.setTo(Datetime.addDays(d, 5));
        employees.get(0).getLeaves().add(leave);
        employees.get(1).getLeaves().add(leave);
        employees.get(2).getLeaves().add(leave);
        employees.get(3).getLeaves().add(leave);
        return employees;
    }


}
