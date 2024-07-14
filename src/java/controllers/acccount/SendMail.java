///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controllers.acccount;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.Properties;
//import jakarta.mail.Authenticator;
//import jakarta.mail.PasswordAuthentication;
//import jakarta.mail.Session;
//import utils.Mail;
//
///**
// *
// * @author legion
// */
//@WebServlet(name = "SendMail", urlPatterns = {"/sendmail"})
//public class SendMail extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
////        final String fromEmail = "techtropicalshop@gmail.com";
////        final String password = "cantfindthepassword";
////
////        Properties props = new Properties();
////        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
////        props.put("mail.smtp.port", "587"); //TLS Port
////        props.put("mail.smtp.auth", "true"); //enable authentication
////        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//
////        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
////            @Override
////            protected PasswordAuthentication getPasswordAuthentication() {
////                return new PasswordAuthentication(fromEmail, password);
////            }
////        });
//
//        String to = request.getParameter("to");
//        String subject = request.getParameter("subject");
//        String content = request.getParameter("content");
//        
//        Mail.send(to, subject, content);
//
//       
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
