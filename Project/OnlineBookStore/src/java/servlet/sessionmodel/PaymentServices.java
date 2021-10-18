/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.sessionmodel;

/**
 *
 * @author NHULT
 */
import java.util.*;
 
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;
import data.dto.OrderDetailDto;
 
public class PaymentServices {
    private static final String CLIENT_ID = "AQ7h6qupeUAOjgQMEhqBSjULO_XSbgPbPvjpcJwdiT64ZpuS1_a_FVUYa-vE99HkfE9mDuiiFdK46FJa";
    private static final String CLIENT_SECRET = "EN8hnnbaAPVqYLQmcqnTjNPbfsJiEGnsUiGWqANwOpYMr8Rab-4-wstO1Wge2anAzQWD6kC4mQDlFrky";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(OrderDetailDto orderDetail)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }

    public static String getCLIENT_ID() {
        return CLIENT_ID;
    }

    public static String getCLIENT_SECRET() {
        return CLIENT_SECRET;
    }

    public static String getMODE() {
        return MODE;
    }
     
private Payer getPayerInformation() {
        return null;
    }
     
    private RedirectUrls getRedirectURLs() {
        return null;
    }
     
    private List<Transaction> getTransactionInformation(OrderDetailDto orderDetail) {
        return null;
    }
     
    private String getApprovalLink(Payment approvedPayment) {
        return null;
    }
}