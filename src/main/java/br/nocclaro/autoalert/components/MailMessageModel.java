package br.nocclaro.autoalert.components;

import lombok.Data;

@Data
public class MailMessageModel {

    private String from;
    private String to;
    private String subject;
    private String message;


}
