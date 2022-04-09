package mna.homespital.vo;

import com.sun.tools.javac.util.List;
import lombok.Data;

import java.util.HashMap;

@Data
public class KakaoGeoRes {
  private HashMap<String, Object> meta;
  private List<KakaoDocument> documents;
}
