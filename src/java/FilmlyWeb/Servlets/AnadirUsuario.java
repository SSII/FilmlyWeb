package FilmlyWeb.Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import FilmlyWeb.Controlador.Controlador;
import FilmlyWeb.Vista.MD5;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pedro
 */
@WebServlet(urlPatterns = {"/AnadirUsuario"})
public class AnadirUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
      
        if( !request.getParameter("name").equals("Nombre y apellidos") &&
            !request.getParameter("username").equals("Nombre de usuario")  &&
            !request.getParameter("password").equals("Contraseña") &&
            !request.getParameter("email").equals("Correo electrónico") ) {
            
            Controlador.getInstancia().anadirUsuario(request.getParameter("name"),request.getParameter("username"), MD5.cifrar( request.getParameter("password") ), request.getParameter("email"));
        
            RequestDispatcher rd = request.getRequestDispatcher( response.encodeURL("home.jsp"));
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher( response.encodeRedirectURL("registro.jsp") );                       
            rd.forward(request, response);
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
