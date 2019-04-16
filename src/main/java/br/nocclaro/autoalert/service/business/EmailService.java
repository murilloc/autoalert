package br.nocclaro.autoalert.service.business;

import br.nocclaro.autoalert.components.MailMessageModel;
import br.nocclaro.autoalert.domain.LogAgendamento;
import br.nocclaro.autoalert.domain.StatusLog;
import br.nocclaro.autoalert.service.business.freemarker.FreeMarkerTemplateWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.nio.charset.StandardCharsets;

@Service
public class EmailService {

    private static final Logger logger = LoggerFactory.getLogger(EmailService.class);

    private JavaMailSender emailSender;
    private MailMessageModel mailMessageBody;

    private FreeMarkerTemplateWriter templateWriter;

    public EmailService(JavaMailSender emailSender, FreeMarkerTemplateWriter templateWriter) {
        this.emailSender = emailSender;
        this.templateWriter = templateWriter;
    }

    public boolean sendMessage(MailMessageModel messageModel, LogAgendamento logAgendamento) {
        MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper helper = null;
        String info= "";
        try {
            helper = new MimeMessageHelper(message,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());
        } catch (MessagingException e) {
            info = "Não foi possível enviar a mensagem: Erro ao compor a mensagem";
            logger.error(info);
            logAgendamento.setInfo(info);
            logAgendamento.setStatus(StatusLog.FALHOU);
            return false;
        }


        try {
            helper.setTo(messageModel.getTo());
            helper.setText(messageModel.getMessage(), true);
            helper.setSubject(messageModel.getSubject());
            helper.setFrom(messageModel.getFrom());
            emailSender.send(message);

            info = "Mensagem enviada com sucesso";
            logger.error(info);
            logAgendamento.setInfo(info);
            logAgendamento.setStatus(StatusLog.OK);


        } catch (MessagingException e) {
            info = "Não foi possível enviar a mensagem: Erro no envio";
            logger.error(info);
            logAgendamento.setInfo(info);
            logAgendamento.setStatus(StatusLog.FALHOU);
            return false;
        }


        return true;
    }


}