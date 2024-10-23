package com.servlets;

import java.io.*;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import java.lang.Integer;

@WebServlet(name = "deleteServlet", value = "/deleteServlet")
public class deleteServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try{
            int noteId = Integer.parseInt(request.getParameter("note_id").trim());
            Session session = FactoryProvider.getFactory().openSession();
            session.beginTransaction();
            Note note = session.get(Note.class, noteId);
            session.delete(note);
            session.getTransaction().commit();
            session.close();
            response.sendRedirect("show_notes.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

}