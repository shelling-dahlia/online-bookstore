/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sendmail;

/**
 *
 * @author NHULT
 */
public class ConfirmAccountEmail implements Email {

    private String code;
    private String receiver;

    public ConfirmAccountEmail(String code, String receiver) {
        this.code = code;
        this.receiver = receiver;
    }

    @Override
    public String getHtml() {
        return "";
    }

    @Override
    public String getSubject() {
        return "Hello, please confirm you account:";
    }

    @Override
    public String getReceiverEmail() {
        return receiver;
    }

    @Override
    public String getMessage() {
        return "Your verification code: " + code;
    }
}
