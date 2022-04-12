package mna.homespital.vo;

import lombok.Data;

import java.util.HashMap;
import java.util.List;

@Data
public class KakaoGeoRes {
    private HashMap<String, Object> meta;
    private List<Documents> documents;
}
