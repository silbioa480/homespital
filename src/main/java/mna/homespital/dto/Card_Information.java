package mna.homespital.dto;

import java.util.Date;

public class Card_Information {
    String customer_uid;
    int card_owner_number;
    Date card_exp;
    String card_nickname;
    String card_number;
    Date create_date;
    Date update_date;

    public Card_Information() {
    }

    public Card_Information(String customer_uid, int card_owner_number, Date card_exp, String card_nickname, String card_number) {
        this.customer_uid = customer_uid;
        this.card_owner_number = card_owner_number;
        this.card_exp = card_exp;
        this.card_nickname = card_nickname;
        this.card_number = card_number;
    }

    public Card_Information(String customer_uid, int card_owner_number, Date card_exp, String card_nickname, String card_number, Date create_date, Date update_date) {
        this.customer_uid = customer_uid;
        this.card_owner_number = card_owner_number;
        this.card_exp = card_exp;
        this.card_nickname = card_nickname;
        this.card_number = card_number;
        this.create_date = create_date;
        this.update_date = update_date;
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

    public Date getCard_exp() {
        return card_exp;
    }

    public void setCard_exp(Date card_exp) {
        this.card_exp = card_exp;
    }

    public String getCard_nickname() {
        return card_nickname;
    }

    public void setCard_nickname(String card_nickname) {
        this.card_nickname = card_nickname;
    }

    public String getCard_number() {
        return card_number;
    }

    public void setCard_number(String card_number) {
        this.card_number = card_number;
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
