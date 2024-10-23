package com.servlets;

import java.io.*;
import java.util.Date;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;

@WebServlet(name = "updateServlet", value = "/updateServlet")
public class updateServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            try{
                RequestDispatcher rd = null;
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                int noteId = Integer.parseInt(request.getParameter("noteId").trim());
                Session session = FactoryProvider.getFactory().openSession();
                session.beginTransaction();
                session.get(Note.class, noteId);
                Note note = session.get(Note.class, noteId);
                note.setTitle(title);
                note.setContent(content);
                note.setAddeddate(new Date());
                session.update(note);
                session.getTransaction().commit();
                session.close();
                request.setAttribute("status", "editedNotes");
                rd = request.getRequestDispatcher("show_notes.jsp");
                rd.forward(request, response);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
    }

}