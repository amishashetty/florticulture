/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author USER
 */
public class DBConfig {
  public Connection getConnection()
    {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/floralfascination","root","");
            return con;
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println(e);
        }
        return null;
    }  
}
