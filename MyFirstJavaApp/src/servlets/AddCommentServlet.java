package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.Comment;
import model.User;

import java.io.IOException;

@WebServlet(value = "/addComment")
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String commentText = req.getParameter("commentText");
        String blogId = req.getParameter("blogId");
        User user = (User) req.getSession().getAttribute("ONLINE_USER");
        Blog blog = DBManager.getBlogById(Long.parseLong(blogId));
        Comment comment = new Comment();
        comment.setBlog(blog);
        comment.setUser(user);
        comment.setText(commentText);
        DBManager.addComment(comment);
        resp.sendRedirect("/home");
    }
}
