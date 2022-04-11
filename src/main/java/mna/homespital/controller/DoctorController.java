package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.service.DiagnosisService;
import mna.homespital.service.DoctorService;
import mna.homespital.service.PharService;
import mna.homespital.service.UserService;
import net.nurigo.java_sdk.api.Message;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
  @Autowired
  DoctorService doctorService;
  @Autowired
  HttpSession session;
  @Autowired
  UserService userService;
  @Autowired
  DiagnosisService diagnosisService;

  @Autowired
  PharService pharService;

  //의사 index(준근)
  @GetMapping("/")
  public String DoctorMain() {
    return "admin/doctor/doctorIndex";
  }

  //의사 로그인 폼(준근)
  @GetMapping("/docLogin")
  public String docLoginForm() {
    return "admin/doctor/loginForm";
  }

  //의사 로그인(준근)
  @PostMapping("/docLogin")
  public String docLogin(@RequestParam("email") String doctor_email, @RequestParam("password") String doctor_password, HttpServletResponse response, Model model) throws Exception {

    try {
      doctorService.docLogin(doctor_email, doctor_password);
      session.setAttribute("email", doctor_email);
      return "redirect:/doctor/";
    } catch (Exception e) {
      model.addAttribute("err", e.getMessage());
      try {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인 실패 : 아이디와 비밀번호를 다시 한 번 확인해주세요.');history.go(-1);</script>");
        out.flush();
      } catch (Exception ee) {
      }
      return "redirect:/doctor/docLogin";
    }
  }

  //나의진료내역 (인성)
  @GetMapping("/customerList")
  public String customerList(HttpSession session, Model m) throws Exception {
    try {
//            String email = (String) session.getAttribute("email");
//            String name = (String) session.getAttribute("name");
//            int searchNumber = pharService.getNumberByEmail(email);
      Diagnosis diagnosis = new Diagnosis();
//            diagnosis.setUser_number(searchNumber);
      m.addAttribute("diagnosis", diagnosis);
    } catch (Exception e) {
      System.out.println("Catch() join");
      e.printStackTrace();
      return "common/err";
    }
    return "admin/phar/customerList";
  }

  //가영:의사 회원가입
  @PostMapping("/doctorJoin.do")
  public ModelAndView doctorJoin(HttpServletRequest request) {
    Doctor doctor = new Doctor();
    doctor.setDoctor_email(request.getParameter("doctor_email"));
    doctor.setDoctor_password(request.getParameter("doctor_password"));
    doctor.setDoctor_phone(request.getParameter("doctor_phone"));
    doctor.setDoctor_name(request.getParameter("doctor_name"));
    doctor.setDoctor_valid_number(request.getParameter("doctor_valid_number"));
    doctor.setDoctor_profile_image_name(request.getParameter("doctor_profile_image_name"));
    doctor.setHospital_business_number(request.getParameter("hospital_business_number"));
    doctor.setZip_code(request.getParameter("zipNo"));
    doctor.setStreet_address(request.getParameter("roadFullAddr"));
    doctor.setDetail_address(request.getParameter("addrDetail"));
    String[] diag_types = request.getParameterValues("doctor_diagnosis_type");
    List<String> sortedDiag_types = new ArrayList<String>();
    for (String diag : diag_types) {
      if (!diag.equals("")) sortedDiag_types.add(diag);
    }
    String diag_type = sortedDiag_types.toString();
    System.out.println(diag_type);
    diag_type = diag_type.substring(1, diag_type.length() - 1).trim();
    doctor.setDoctor_diagnosis_type(diag_type);

    //오픈-마감시간 코드
    Integer openTime = Integer.parseInt(request.getParameter("open"));
    Integer closeTime = Integer.parseInt(request.getParameter("close"));
    List<Integer> openClose = new ArrayList<>();
    for (int i = openTime; i < closeTime; i++) {
      openClose.add(i);
    }
    String openCloseString = openClose.toString();
    doctor.setWorking_time(openCloseString.substring(1, openCloseString.length() - 1));

    // 점심시간 코드
    openTime = Integer.parseInt(request.getParameter("lunch-st"));
    closeTime = Integer.parseInt(request.getParameter("lunch-cl"));
    openClose = new ArrayList<>();
    for (int i = openTime; i < closeTime; i++) {
      openClose.add(i);
    }
    openCloseString = openClose.toString();
    doctor.setLunch_time(openCloseString.substring(1, openCloseString.length() - 1));

    String holiday = Arrays.toString(request.getParameterValues("holiday"));
    holiday = holiday.substring(1, holiday.length() - 1).trim();
    doctor.setHoliday(holiday);
    doctor.setHospital_fax(request.getParameter("hospital_fax"));
    doctor.setHospital_url(request.getParameter("hospital_url"));
    doctor.setDoctor_introduction(request.getParameter("doctor_introduction"));

    ModelAndView mv = new ModelAndView();
    try {
      System.out.println("여기들어오라ㅏ ㅇㅇㅇㅇㅇ");
      doctorService.join(doctor);
      mv.setViewName("redirect:/loginForm");
    } catch (Exception e) {
      e.printStackTrace();
      mv.setViewName("redirect:/doctorJoin");
    }

    return mv;
  }

  //가영: 의사 이메일 중복확인

  @PostMapping("/DoctorEmailoverlap")
  @ResponseBody
  public boolean emailOverLap(@RequestParam String email) {
    boolean result = false;
    try {
      result = doctorService.emailCheck(email);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return result;
  }

  //가영: 의사 비밀번호 확인
  //가영: 비밀번호확인
  @ResponseBody
  @RequestMapping(value = "/docPwCheck", method = RequestMethod.POST)
  public String submitPasswordMember(@RequestParam(value = "password") String password, RedirectAttributes rttr, HttpSession session) {
    try {
      String email = (String) session.getAttribute("email");
      Doctor doctor = doctorService.doctorQueryMember(email);
      if (doctor == null) {
        return "사용자없음";
      }
      String originPass = doctor.getDoctor_password();
      String inputPass = password;

      if (!(inputPass.equals(originPass))) {
        rttr.addFlashAttribute("msg", true);

        return "비밀번호틀림";
      } else {
        return "비밀번호일치";
      }
    } catch (Exception e) {
      e.printStackTrace();
      return "에러";
    }
  }

  //의사의 진료내역 (준근)
  @GetMapping("/docMedicalList")
  public String docMedicalList(HttpSession session, Model m) throws Exception {
    System.out.println("docMedicalList() Join");
    try {
      String email = (String) session.getAttribute("email");
      int serarchDocNum = doctorService.searchDocId(email);
      Diagnosis diagnosis = new Diagnosis();
      diagnosis.setDoctor_number(serarchDocNum);
      m.addAttribute("diagnosis", diagnosis);
    } catch (Exception e) {
      e.printStackTrace();
      return "common/err";
    }
    return "admin/doctor/doctorMedicalList";
  }

  //의사에게 들어온 진료내역 리스트 출력 (준근)
  @ResponseBody
  @GetMapping("/docMedicalRecords")
  public ArrayList<HashMap<String, Object>> docMedicalRecords(@RequestParam int doctor_number) {
    System.out.println("docMedicalRecords() Join");
    ArrayList<HashMap<String, Object>> docMedicalList = new ArrayList<>();
    try {
      docMedicalList = doctorService.docMedicalRecords(doctor_number);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return docMedicalList;
  }

  // 진료 시작하기 diagnoisis_status (0 -> 1)(준근)
  //의사번호를 통해 환자휴대번호 갖고오고 진료시작문자 및 카카오톡링크보내기 태영
  @ResponseBody
  @PostMapping("/startDiagnosis")
  public String startDiagnosis(int diagnosis_number) {
    String api_key = "NCSPV8YZMCKSQUYI";
    String api_secret = "NCONVJRYQOCGNWXZGDIXVEAMAMSYMC4W";

    try {
      doctorService.startDiagnosis(diagnosis_number);

//      String userphoneNumber=doctorService.getUserPhone(doctor_number);
      Message coolsms = new Message(api_key, api_secret);
      HashMap<String, String> params = new HashMap<String, String>();
      params.put("to", "01089303955");// 수신전화번호
      params.put("from", "01089303955");// 발신전화번호
      params.put("type", "SMS");
      params.put("text", "진료를 시작합니다"+"의사 일대일 진료채팅방\n" +
              "링크를 선택하면 카카오톡이 실행됩니다.\n" +
              "\n" +
              "https://open.kakao.com/o/sXJSPePd"); // 문자 내용 입력
      params.put("app_version", "test app 1.2"); // application name and version
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "success";
  }

  // 진료 완료하기 diagnoisis_status (1 -> 3)(준근)
  @ResponseBody
  @PostMapping("/finishDiagnosis")
  public String finishDiagnosis(int diagnosis_number) {
    try {
      doctorService.finishDiagnosis(diagnosis_number);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "success";
  }

//  //의사번호를 통해 환자휴대번호 갖고오고 진료시작문자 및 카카오톡링크보내기 태영
//  @ResponseBody
//  @PostMapping("/sendOpentalk")
//  public void sendOpentalk(int doctor_number){
//          String api_key = "NCSPV8YZMCKSQUYI";
//          String api_secret = "NCONVJRYQOCGNWXZGDIXVEAMAMSYMC4W";
//
//        try{
//          String userphoneNumber=doctorService.getUserPhone(doctor_number);
//          Message coolsms = new Message(api_key, api_secret);
//          HashMap<String, String> params = new HashMap<String, String>();
//          params.put("to", "01089303955");// 수신전화번호
//          params.put("from", "01089303955");// 발신전화번호
//          params.put("type", "SMS");
//          params.put("text", "진료를 시작합니다"+"의사 일대일 진료채팅방\n" +
//                  "링크를 선택하면 카카오톡이 실행됩니다.\n" +
//                  "\n" +
//                  "https://open.kakao.com/o/sXJSPePd"); // 문자 내용 입력
//          params.put("app_version", "test app 1.2"); // application name and version
//          JSONObject obj = (JSONObject) coolsms.send(params);
//          System.out.println(obj.toString());
//        }catch(Exception e){
//          e.printStackTrace();
//        }
//  }
}