//
//package utils;
//
//import java.util.Date;
//import java.util.Properties;
//import javax.mail.Authenticator;
//import javax.mail.Message;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
///**
// *
// * @author dell
// */
//public class Mail {
//    public static void send(String toEmail, String subject, String body) {
//        try {
//            final String fromEmail = "tungtran120403@gmail.com";
//            final String password = "cantfindthepassword";
//
//            Properties props = new Properties();
//            props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//            props.put("mail.smtp.port", "587"); //TLS Port
//            props.put("mail.smtp.auth", "true"); //enable authentication
//            props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//
//            Authenticator auth = new Authenticator() {
//                @Override
//                protected PasswordAuthentication getPasswordAuthentication() {
//                    return new PasswordAuthentication(fromEmail, password);
//                }
//            };
//            Session session = Session.getInstance(props, auth);
//            MimeMessage msg = new MimeMessage(session);
//            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
//            msg.addHeader("format", "flowed");
//            msg.addHeader("Content-Transfer-Encoding", "8bit");
//            msg.setFrom(new InternetAddress(fromEmail, "LaptopHub"));
//            msg.setReplyTo(InternetAddress.parse(fromEmail, false));
//            msg.setSubject(subject, "UTF-8");
//            msg.setText(body, "UTF-8");
//            msg.setSentDate(new Date());
//            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
//            Transport.send(msg);
//        } catch (Exception ex) {
//            System.out.println(ex);
//        }
//    }
//}
