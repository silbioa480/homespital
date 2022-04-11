package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.User;
import mna.homespital.service.*;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

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
    AllMedicalListService allMedicalListService;
    @Autowired
    PharService pharService;

    @Autowired
    ServletContext servletContext;

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
    public String docLogin(@RequestParam("email") String doctor_email, @RequestParam("password") String doctor_password, HttpServletResponse response, Model model) {

        try {
            doctorService.docLogin(doctor_email, doctor_password);
            Doctor doctor = doctorService.searchDocId(doctor_email);
            doctor.setDoctor_password("");
            session.setAttribute("doctor", doctor);
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

    //가영: 의사 회원가입
    @GetMapping("/join")
    public ModelAndView doctorJoin() {
        ModelAndView mv = new ModelAndView("admin/doctorside/joinForm");
        try {
            mv.addObject("medicalList", allMedicalListService.allMedList());
        } catch (Exception e) {
            System.out.println("CANNOT GET LIST");
        }
        return mv;
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
            mv.setViewName("redirect:/doctor/docLogin");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("redirect:/doctorJoin");
        }

        return mv;
    }

    //가영: 의사 이메일 중복확인

    @PostMapping("/Emailoverlap")
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
            Doctor doctor = (Doctor) session.getAttribute("doctor");
            Diagnosis diagnosis = new Diagnosis();
            diagnosis.setDoctor_number(doctor.getDoctor_number());
            //      이부분 준근님에게 물어보기
            m.addAttribute("diagnosis", diagnosis);


        } catch (Exception e) {
            e.printStackTrace();
            return "common/err";
        }
        return "admin/doctor/doctorMedicalList";
    }

    // 소연&훈 해당 환자에 대한 진료 내역
    @GetMapping("/customerDetail/{diagnosis_number}")
    public ModelAndView customerDetail(@PathVariable int diagnosis_number) {
        ModelAndView mv = new ModelAndView("admin/doctor/customerDetail");
        try {
            if (session.getAttribute("doctor") == null) throw new Exception("로그인 되어있지 않음");
            Doctor doctor = (Doctor) session.getAttribute("doctor");
            HashMap<String, Object> diagnosis = diagnosisService.getDiagnosisDetail(diagnosis_number);
            if (diagnosis == null || !((Integer) diagnosis.get("doctor_number")).equals(doctor.getDoctor_number()))
                throw new Exception("올바르지 않은 진단기록");
            LocalDateTime create_date = (LocalDateTime) diagnosis.get("create_date");
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String create_date_str = create_date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            diagnosis.replace("create_date", create_date_str);
            mv.addObject("diagnosis", diagnosis);
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("common/err");
        }
        return mv;
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
    //카톡링크문자 보내기 태영
    @ResponseBody
    @PostMapping("/startDiagnosis")
    public String startDiagnosis(int diagnosis_number) {
        String api_key = "NCSK1Q8DMWF4EQYK";
        String api_secret = "9KEMFM30PPC8NTBR62L9WECLHIRXQJTO";
        Message coolsms = new Message(api_key, api_secret);
        HashMap<String, String> params = new HashMap<String, String>();
        try {
            doctorService.startDiagnosis(diagnosis_number);
            Diagnosis dig = diagnosisService.getDiaInfo(diagnosis_number);
            Doctor dtc = doctorService.getDocInfo(dig.getDoctor_number());
            User user = userService.getUserInfo(dig.getUser_number());
            String dtcName = dtc.getDoctor_name();
            String userName = user.getUser_name();
            String dtcPhone = dtc.getDoctor_phone();
            params.put("to", "01089303955");// 수신전화번호
            params.put("from", "01089303955");// 발신전화번호
            params.put("type", "LMS");
            params.put("text", "진료를 시작합니다.\n" +
                    "1대1 진료카카오톡\n" + "https://open.kakao.com/o/sXJSPePd" + "\n" +
                    "의사명:" + dtcName + "\n" +
                    "환자명:" + userName + "\n"); // 문자 내용 입력 ,담당의사 이름,환자이름
            params.put("app_version", "test app 1.2"); // application name and version
            org.json.simple.JSONObject obj = coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    // 진료 완료하기 diagnoisis_status (1 -> 3)(준근)
    // 진료 완료하기 할 때 유효성 검사(is_diagnosis_upload가 2가 아니면 진료완료 실패하고 alert띄움
    @ResponseBody
    @PostMapping("/finishDiagnosis")
    public String finishDiagnosis(int diagnosis_number, HttpServletResponse response) {

        try {
            //is_diagnosis_upload가 2(업로드완료) 인지 확인
            Diagnosis diagnosis = doctorService.checkDiagnosisUpload(diagnosis_number);
            if (diagnosis.getIs_diagnosis_upload() != 2) {
                return "failed";
            }
            // 진료완료 하면서 is_prescription_upload=1(처방전업로드X상태)이면
            // is_prescription_upload = 3(처방전없음) and diagnosis_status = 7 (처방전 없이 진료 완료) 처리
            if (diagnosis.getIs_prescription_upload() == 1) {
                doctorService.changePrescription(diagnosis_number);
                return "success";
            }
            //진료완료 처리
            doctorService.finishDiagnosis(diagnosis_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }


    //진료영수증 업로드 (준근)
    //receipt(진료영수증) == diagnosis_file_name
    @PostMapping("/receiptUpload")
    public String receiptUpload(MultipartFile receiptFile, int diagnosis_number, HttpServletResponse response) throws Exception {
        System.out.println("receiptUpload() join" + diagnosis_number);
        //넘어온 파일의 이름
        String receiptFileName = receiptFile.getOriginalFilename();
        try {
            String path = servletContext.getRealPath("/resources/img/uploadReceipt/");
            String filename = UUID.randomUUID().toString() + "." + receiptFileName.substring(receiptFileName.lastIndexOf('.') + 1);
            File destFile = new File(path + filename);

            PrintWriter writer = null;
            JSONObject json = new JSONObject();

            receiptFile.transferTo(destFile);

            receiptFileName = filename;
            System.out.println(receiptFileName);
            writer = response.getWriter();
            response.setContentType("text/html;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            json.append("uploaded", 1);
            json.append("filename", filename);
            json.append("url", "/resources/img/uploadReceipt/" + filename);
            writer.println(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
        doctorService.uploadReceipt(diagnosis_number, receiptFileName);

        return "redirect:/doctor/docMedicalList";
    }

    // 처방전 업로드(준근)
    @PostMapping("/prescriptionUpload")
    public String prescriptionUpload(MultipartFile prescriptionFile, int diagnosis_number, HttpServletResponse response) throws Exception {
        System.out.println("prescriptionUpload() join" + diagnosis_number);
        //넘어온 파일의 이름
        String prescriptionFileName = prescriptionFile.getOriginalFilename();
        try {
            String path = servletContext.getRealPath("/resources/img/uploadPrescription/");
            String filename = UUID.randomUUID().toString() + "." + prescriptionFileName.substring(prescriptionFileName.lastIndexOf('.') + 1);
            File destFile = new File(path + filename);

            PrintWriter writer = null;
            JSONObject json = new JSONObject();

            prescriptionFile.transferTo(destFile);

            prescriptionFileName = filename;
            System.out.println(prescriptionFileName);
            writer = response.getWriter();
            response.setContentType("text/html;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            json.append("uploaded", 1);
            json.append("filename", filename);
            json.append("url", "/resources/img/uploadPrescription/" + filename);
            writer.println(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
        doctorService.uploadPrescription(diagnosis_number, prescriptionFileName);

        return "redirect:/doctor/docMedicalList";
    }
//    //카톡링크문자 보내기 태영
//    @ResponseBody
//    @PostMapping("/sendOpenTalk")
//    public String sendOpenTalk(int doctor_number){
//
//        try{
//            Doctor dtc =doctorService.getDocInfo(doctor_number);
//            String userPhoneNumber=dtc.getDoctor_phone();
//
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//
//        return "success";
//    }
}