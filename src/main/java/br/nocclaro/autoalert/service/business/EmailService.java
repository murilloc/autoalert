package br.nocclaro.autoalert.service.business;

import br.nocclaro.autoalert.components.MailMessageModel;
import br.nocclaro.autoalert.domain.LogAgendamento;
import br.nocclaro.autoalert.domain.StatusLog;
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


    public EmailService(JavaMailSender emailSender) {
        this.emailSender = emailSender;

    }

    boolean sendMessage(MailMessageModel messageModel, LogAgendamento logAgendamento) {
        MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper helper;
        String info;
        try {
            helper = new MimeMessageHelper(message,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());
        } catch (MessagingException e) {
            info = "Não foi possível enviar a mensagem: Erro ao compor a mensagem (" + messageModel.getSubject() + ")" ;
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

        info = "Mensagem de alerta (" + messageModel.getSubject() + ") enviada com sucesso para o email " + messageModel.getTo();
            logger.error(info);
            logAgendamento.setInfo(info);
            logAgendamento.setStatus(StatusLog.OK);


        } catch (MessagingException e) {
            info = "Não foi possível enviar a mensagem: Erro no envio para o email " + messageModel.getTo();
            logger.error(info);
            logAgendamento.setInfo(info);
            logAgendamento.setStatus(StatusLog.FALHOU);
            return false;
        }

        return true;
    }


}