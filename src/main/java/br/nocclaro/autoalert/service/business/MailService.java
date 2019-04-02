package br.nocclaro.autoalert.service.business;

import freemarker.template.Configuration;
import org.springframework.mail.javamail.JavaMailSender;

public class MailService {


    private JavaMailSender emailSender;
    private Configuration freemarkerConfig;

    public MailService(JavaMailSender emailSender, Configuration freemarkerConfig) {
        this.emailSender = emailSender;
        this.freemarkerConfig = freemarkerConfig;
    }


//    public void sendSimpleMessage(Mail mail) throws MessagingException, IOException, TemplateException {
//        MimeMessage message = emailSender.createMimeMessage();
//        MimeMessageHelper helper = new MimeMessageHelper(message,
//                MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
//                StandardCharsets.UTF_8.name());
//
//        Template template = freemarkerConfig.getTemplate("email_template.ftl");
//        String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, mail.getModel());
//
//        helper.setTo(mail.getTo());
//        helper.setText(html, true);
//        helper.setSubject(mail.getSubject());
//        helper.setFrom(mail.getFrom());
//        emailSender.send(message);
//    }
}
