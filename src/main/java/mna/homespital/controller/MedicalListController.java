package mna.homespital.controller;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import mna.homespital.dto.AllMedical;
import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.PageInfo;
import mna.homespital.service.*;
import mna.homespital.vo.KakaoGeoRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@RestController
public class MedicalListController {

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;

    @Autowired
    AllMedicalListService allmedListService;

    @Autowired
    MedicalListService mls;

    @Autowired
    DiagnosisService diagnosisService;

    @Autowired
    DoctorService doctorService;

    @Autowired
    MemberService memberService;

    @Autowired
    UserService userService;

    @Autowired(required = false) // 매개변수 없어도 OK. 나중에 고쳐야?
    Diagnosis diagnosis;


    // 진료항목출력 태영
    @RequestMapping("/medicalSearch")
    public ModelAndView medicalSearch(@RequestParam(required = false) String mediSearch) {
        ModelAndView mv = new ModelAndView();
        try {
            List<AllMedical> searchmd = allmedListService.searchMed(mediSearch);
            mv.addObject("list", searchmd);
            mv.setViewName("user/userside/medicalList");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

//    //autocomplete controller 태영
//    @ResponseBody
//    @PostMapping("/mediSearch")
//    public String mediSearch(Model model){
//      try{
//          List<AllMedical> schmd=allmedListService.allMedList();
//
//          String dataMd=String.valueOf(schmd);
//          JSONArray jsa=new JSONArray();
//          JSONObject jso=new JSONObject();
//          jso.put("data",dataMd);
//
//      }catch(Exception e){
//          e.printStackTrace();
//      }
//      return ;
//    }


    //원하는 의사명 및 병원명 찾기 태영
    @PostMapping("/dohSearch")
    public ModelAndView dohSearch(@RequestParam(value = "dhSearch") String dhSearch) {
        ModelAndView mv = new ModelAndView();
        try {
            List<Doctor> doc = doctorService.getSearchDoh(dhSearch);
//            List<Doctor> docList = doctorService.getDocList(page, pageInfo);
            mv.addObject("doctorList", doc);
            mv.setViewName("user/userside/doctorList");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    //
    //의료진 찾기(의사 리스트)
    @GetMapping("/doctorList")
    public ModelAndView doctorList(@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false) String doctor_diagnosis_type, @RequestParam(required = false, defaultValue = "0") double longitude, @RequestParam(required = false, defaultValue = "0") double latitude) throws Exception {
        ModelAndView mv = new ModelAndView("user/userside/doctorList");
        PageInfo pageInfo = new PageInfo();
        List<Doctor> doctorList = doctorService.getDocList(doctor_diagnosis_type, page, pageInfo);

        for (Doctor d : doctorList) {
            System.out.println(d.getDoctor_diagnosis_type());
        }

        // 종호: 현재 좌표 입력받으면 나와 의사의 거리순으로 정렬하기
        if (longitude != 0 && latitude != 0) {
            List<List<Integer>> distanceList = new ArrayList<>();
            List<Doctor> newDoctorList = new ArrayList<>();
            int size = doctorList.size();
            int distance;

            String APIKey = "ec3f88c0be25b53b799db6b9849751aa";

            for (int i = 0; i < size; i++) {
                distance = Integer.MAX_VALUE;

                try {
                    String apiURL = "https://dapi.kakao.com/v2/local/search/address.json?query="
                            + URLEncoder.encode(doctorList.get(i).getStreet_address(), "UTF-8");

                    HttpResponse<JsonNode> response = Unirest.get(apiURL)
                            .header("Authorization", "KakaoAK " + APIKey)
                            .asJson();

                    ObjectMapper objectMapper = new ObjectMapper();
                    objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);

                    KakaoGeoRes bodyJson = objectMapper.readValue(response.getBody().toString(), KakaoGeoRes.class);

                    double doctorLongitude = bodyJson.getDocuments().get(0).getX();
                    double doctorLatitude = bodyJson.getDocuments().get(0).getY();

                    distance = (int) (Math.sqrt(Math.pow(longitude - doctorLongitude, 2) + Math.pow(latitude - doctorLatitude, 2)) * 1000000);

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    int finalI = i;
                    int finalDistance = distance;

                    System.out.println(finalI + ", " + finalDistance);

                    distanceList.add(new ArrayList<Integer>() {{
                        add(finalI);
                        add(finalDistance);
                    }});
                }
            }

            distanceList.sort(Comparator.comparingInt((List<Integer> a) -> a.get(1)));

            for (List<Integer> d : distanceList) {
                newDoctorList.add(doctorList.get(d.get(0)));
            }

            doctorList.clear();
            doctorList.addAll(newDoctorList);
        }

        doctorList.forEach(doctor -> {
            String work_time = doctor.getWorking_time();
            System.out.println(work_time + "-------------------------------");
            String[] work_timeArr = work_time.split(",");

            for (int i = 0; i < work_timeArr.length; i++) {
                System.out.println("work_timeArr = " + work_timeArr[i]); //9~17까지 콘솔에 뜸 [0], [work_timeArr.length-1]
            }

            int start_time = Integer.parseInt(work_timeArr[0]);
            int end_time = Integer.parseInt(work_timeArr[work_timeArr.length - 1]) + 1;

            if (end_time >= 13) {
                if (start_time >= 13) {
                    start_time -= 12;
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                } else if (start_time == 12) {
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                    System.out.println("work_time else if() = " + work_time);
                } else if (start_time < 12) {
                    end_time -= 12;
                    work_time = "오전 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                    System.out.println("work_time else if() = " + work_time);
                }

            } else if (end_time <= 12) {
                work_time = "오전 " + start_time + "시 ~ 오전 " + end_time + "시";
                doctor.setWorking_time(work_time);
            }
            int lunch_time = Integer.parseInt(doctor.getLunch_time());
            //13시 이후 일 때  =>  오후 1시 ~ 오후 2시, 오후 2시 ~ 오후 3시 ... 로 출력
            if (lunch_time >= 13) {
                lunch_time -= 12;
                doctor.setLunch_time("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time == 12) { // 12시 일 때, 오후 12시 ~ 오후 1시
                doctor.setLunch_time("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time - 11) + "시");
            } else if (lunch_time == 11) { //11시 일 때, 오전 11시 ~ 오후 12시
                doctor.setLunch_time("오전 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time < 11) { // 10시 이전 일 때, 오전 10시 ~ 오전 11시, 오전 9시 ~ 오전 10시 ...로 출력
                doctor.setLunch_time("오전 " + lunch_time + "시 ~ 오전 " + (lunch_time + 1) + "시");
            }
        });
        mv.addObject("latitude", latitude);
        mv.addObject("longitude", longitude);
        mv.addObject("doctor_diagnosis_type", doctor_diagnosis_type);
        mv.addObject("doctorList", doctorList);
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    //훈 : 의료진 상세보기(doctor Detail) by 4/7
    @GetMapping("/doctorDetail/{doctor_number}")
    public ModelAndView doctorDetail(@PathVariable int doctor_number) {
        ModelAndView mv = new ModelAndView();
        try {
            Doctor doctor = doctorService.getDocInfo(doctor_number);
            String work_time = doctor.getWorking_time();
            String[] work_timeArr = work_time.split(",");

            for (int i = 0; i < work_timeArr.length; i++) {
                System.out.println("work_timeArr = " + work_timeArr[i]); //9~17까지 콘솔에 뜸 [0], [work_timeArr.length-1]
            }

            int start_time = Integer.parseInt(work_timeArr[0]);
            int end_time = Integer.parseInt(work_timeArr[work_timeArr.length - 1]) + 1;

            if (end_time >= 13) {
                if (start_time >= 13) {
                    start_time -= 12;
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                } else if (start_time == 12) {
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                    System.out.println("work_time else if() = " + work_time);
                } else if (start_time < 12) {
                    end_time -= 12;
                    work_time = "오전 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                    System.out.println("work_time else if() = " + work_time);
                }

            } else if (end_time <= 12) {
                work_time = "오전 " + start_time + "시 ~ 오전 " + end_time + "시";
                doctor.setWorking_time(work_time);
            }
            int lunch_time = Integer.parseInt(doctor.getLunch_time());
            //13시 이후 일 때  =>  오후 1시 ~ 오후 2시, 오후 2시 ~ 오후 3시 ... 로 출력
            if (lunch_time >= 13) {
                lunch_time -= 12;
                doctor.setLunch_time("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time == 12) { // 12시 일 때, 오후 12시 ~ 오후 1시
                doctor.setLunch_time("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time - 11) + "시");
            } else if (lunch_time == 11) { //11시 일 때, 오전 11시 ~ 오후 12시
                doctor.setLunch_time("오전 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time < 11) { // 10시 이전 일 때, 오전 10시 ~ 오전 11시, 오전 9시 ~ 오전 10시 ...로 출력
                doctor.setLunch_time("오전 " + lunch_time + "시 ~ 오전 " + (lunch_time + 1) + "시");
            }

            mv.addObject("doctor", doctor);
            mv.setViewName("/user/userside/doctorDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("/common/err");
        }
        return mv;
    }

}
