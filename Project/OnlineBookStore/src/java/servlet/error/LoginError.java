/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.error;

/**
 *
 * @author NHULT
 */
public class LoginError implements PresentableError {

    private String incorrectMessage;

    public void setIncorrect() {
        this.incorrectMessage = "Incorrect user or password";
    }

    public String getIncorrectMessage() {
        return incorrectMessage;
    }

}
