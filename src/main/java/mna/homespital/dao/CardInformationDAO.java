package mna.homespital.dao;

import mna.homespital.dto.Card_Information;
import mna.homespital.dto.Payment;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface CardInformationDAO {
    List<Card_Information> queryMyCards(int card_owner_number) throws Exception;

    Card_Information queryMyCard(Map<String, Object> params) throws Exception;

    Card_Information queryMyCardWithCardNumber(Map<String, Object> params) throws Exception;

    void insertMyCard(Card_Information param) throws Exception;

    void deleteMyCard(String customer_uid) throws Exception;

    void setThisCardMain(Map<String, Object> param) throws Exception;

    Integer getLastPaymentReceiptNo() throws Exception;

    void issueReceipt(Payment payment) throws Exception;

    void changeDiagBKUsed(int diagnosis_number) throws Exception;
}
