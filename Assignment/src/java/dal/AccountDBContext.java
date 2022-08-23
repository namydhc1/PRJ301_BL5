/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Namqd
 */
public class AccountDBContext extends DBContext {

    PreparedStatement stm = null;
    ResultSet rs = null;

    public Account getAccount(String username, String password) {
        String sql = "select * from Account\n"
                + "where username = ?\n"
                + "and [password] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while(rs.next()){
                Account account = new Account();
                account.setUsername(username);
                return account;
            }
        } catch (SQLException e) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
}
