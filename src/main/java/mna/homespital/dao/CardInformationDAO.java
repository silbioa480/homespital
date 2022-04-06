package mna.homespital.dao;

import mna.homespital.dto.Card_Information;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface CardInformationDAO {
    List<Card_Information> queryMyCards(int card_owner_number) throws Exception;

    Card_Information queryMyCard(Map<String, String> params) throws Exception;

    void insertMyCard(Card_Information param) throws Exception;

    void deleteMyCard(String customer_uid) throws Exception;
}
