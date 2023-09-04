/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import database.DBConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class addreplay extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username=null;
        try{
         javax.servlet.http.HttpSession hs=request.getSession();
         username=hs.getAttribute("username").toString();
         String password=hs.getAttribute("password").toString();
         
         if(username.equals("") || username.equals(null) || password.equals("") || password.equals(null))
         {
              response.sendRedirect("adminlogout");
         }
         else{
             
         }
     }
     catch(Exception e){
         response.sendRedirect("adminlogout");
     }
        try  {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addamount</title>");            
            out.println("</head>");
            out.println("<body>");
             String id=request.getParameter("id");
             String replay=request.getParameter("replay");
             
             Class.forName("com.mysql.jdbc.Driver");
            Connection con=new DBConfig().getConnection();
            Statement sta=con.createStatement();
            sta.executeUpdate("UPDATE `request` SET `status` = 'Answered',`answer`='"+replay+"'  WHERE `id` ='"+id+"';");
            out.println("<script>alert('Replay Added Succesfully')</script>");
                out.println("<meta http-equiv='refresh' content='0;requests.jsp'/>");
            out.println("</body>");
            out.println("</html>");
        }
        catch(Exception e)
                {
                    //out.println(e);
                     out.println("<script>alert('Error Adding Replay')</script>");
                out.println("<meta http-equiv='refresh' content='0;requests.jsp'/>");
                }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
