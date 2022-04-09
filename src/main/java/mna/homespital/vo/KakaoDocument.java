package mna.homespital.vo;

import lombok.Data;

import java.util.HashMap;

@Data
public class KakaoDocument {
  private HashMap<String, Object> address;
  private String address_type;
  private Double x;
  private Double y;
  private String address_name;
  private HashMap<String, Object> road_address;
}
