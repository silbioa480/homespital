package mna.homespital.dto;

import java.util.Date;

public class Payment {
    int payment_number;
    String customer_uid;
    int card_owner_number;
    int payment_money;
    String status;
    Date create_date;
    Date update_date;

    public Payment() {
    }

    public Payment(int payment_number, String customer_uid, int card_owner_number, int payment_money, String status) {
        this.payment_number = payment_number;
        this.customer_uid = customer_uid;
        this.card_owner_number = card_owner_number;
        this.payment_money = payment_money;
        this.status = status;
    }

    public Payment(int payment_number, String customer_uid, int card_owner_number, int payment_money, String status, Date create_date, Date update_date) {
        this.payment_number = payment_number;
        this.customer_uid = customer_uid;
        this.card_owner_number = card_owner_number;
        this.payment_money = payment_money;
        this.status = status;
        this.create_date = create_date;
        this.update_date = update_date;
    }


    public int getPayment_number() {
        return payment_number;
    }

    public void setPayment_number(int payment_number) {
        this.payment_number = payment_number;
    }

    public String getCustomer_uid() {
        return customer_uid;
    }

    public void setCustomer_uid(String customer_uid) {
        this.customer_uid = customer_uid;
    }

    public int getCard_owner_number() {
        return card_owner_number;
    }

    public void setCard_owner_number(int card_owner_number) {
        this.card_owner_number = card_owner_number;
    }

    public int getPayment_money() {
        return payment_money;
    }

    public void setPayment_money(int payment_money) {
        this.payment_money = payment_money;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }
}
