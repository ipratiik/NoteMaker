package com.servlets;

import java.io.*;
import java.util.Date;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;

@WebServlet(name = "saveNoteServlet", value = "/saveNoteServlet")
public class saveNoteServlet extends HttpServlet {

    public saveNoteServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        try{
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            Note note = new Note(title, content, new Date());
//            Hibernate Starts From Here
            Session session = FactoryProvider.getFactory().openSession();
            session.beginTransaction();
            session.save(note);
            session.getTransaction().commit();
            session.close();

            request.setAttribute("status", "savedNotes");
            rd = request.getRequestDispatcher("show_notes.jsp");
            rd.forward(request, response);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}