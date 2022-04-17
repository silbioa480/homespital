package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.User;
import mna.homespital.service.*;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.PhoneCheckService;

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
    PaymentService paymentService;
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
            System.out.println(3);
            session.setAttribute("doctor", doctor);
            return "redirect:/doctor/docMedicalList";
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

    //용식: 로그아웃
    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/doctor/";
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
    public ModelAndView doctorJoin(HttpServletRequest request, MultipartFile doctorImgNames, MultipartFile hospitalImgNames, HttpServletResponse response) {
        Doctor doctor = new Doctor();
        doctor.setDoctor_email(request.getParameter("doctor_email"));
        doctor.setDoctor_password(request.getParameter("doctor_password"));
        doctor.setDoctor_phone(request.getParameter("doctor_phone"));
        doctor.setDoctor_name(request.getParameter("doctor_name"));
        doctor.setDoctor_valid_number(request.getParameter("doctor_valid_number"));
//        doctor.setDoctor_url(request.getParameter("doctor_url"));
        doctor.setHospital_name(request.getParameter("hospital_name"));
        doctor.setHospital_telephone(request.getParameter("hospital_telephone"));

        //의사프로필업로드
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
        doctor.setLunch_time(request.getParameter("lunch-time"));
//        openTime = Integer.parseInt(request.getParameter("lunch-st"));
//        closeTime = Integer.parseInt(request.getParameter("lunch-cl"));
//        openClose = new ArrayList<>();
//        for (int i = openTime; i < closeTime; i++) {
//            openClose.add(i);
//        }
//        openCloseString = openClose.toString();
//        doctor.setLunch_time(openCloseString.substring(1, openCloseString.length() - 1));

        String holiday = Arrays.toString(request.getParameterValues("holiday"));
        holiday = holiday.substring(1, holiday.length() - 1).trim();
        doctor.setHoliday(holiday);
        doctor.setHospital_fax(request.getParameter("hospital_fax"));
        doctor.setHospital_url(request.getParameter("hospital_url"));

        //병원소개 파일 업로드
        doctor.setDoctor_introduction(request.getParameter("doctor_introduction"));

        ModelAndView mv = new ModelAndView();
        try {
            System.out.println(hospitalImgNames != null);
            System.out.println(hospitalImgNames.isEmpty());
            // 의사 프로필 업로드
            String fileNameArr = "";
            String doctorImg = doctorImgNames.getOriginalFilename();
            String path = servletContext.getRealPath("/resources/img/doctorImg/");
            String filename = UUID.randomUUID().toString() + "." + doctorImg.substring(doctorImg.lastIndexOf('.') + 1);
            File destFile = new File(path + filename);
            doctorImgNames.transferTo(destFile);
            doctorImg = filename;
            fileNameArr = doctorImg;
            doctor.setDoctor_profile_image_name(fileNameArr.toString());
            //병원 이미지 업로드
            if (!hospitalImgNames.isEmpty()) {
                String hospitalfileName = "";
                String hospitalImg = hospitalImgNames.getOriginalFilename();
                System.out.println(hospitalImg);
                String hpath = servletContext.getRealPath("/resources/img/hospitalImg/");
                String hospitalfilename = UUID.randomUUID().toString() + "." + hospitalImg.substring(hospitalImg.lastIndexOf('.') + 1);
                File hdestFile = new File(hpath + hospitalfilename);
                System.out.println(hdestFile.getAbsolutePath());
                hospitalImgNames.transferTo(hdestFile);
                hospitalImg = hospitalfilename;
                hospitalfileName = hospitalImg;
                System.out.println(hospitalfileName);
                doctor.setHospital_file_name(hospitalfileName.toString());
            }


            System.out.println("여기들어오라ㅏ ㅇㅇㅇㅇㅇ");
            doctorService.join(doctor);
            mv.setViewName("redirect:/doctor/docLogin");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("redirect:/doctor/join");
        }

        return mv;
    }

    //용식: 회원가입 문자전송API
    public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);//난수 생성
        PhoneCheckService phoneCheckService = new PhoneCheckService();
        phoneCheckService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
        System.out.println(randomNumber);
        return Integer.toString(randomNumber);
    }

//    가영: 의사 이메일 중복확인

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
        try {
            Doctor doctor = (Doctor) session.getAttribute("doctor");
            int doctor_number = doctor.getDoctor_number();
            m.addAttribute("doctor_number", doctor_number);


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

            // 진료 시간 코드
            String work_time = (String) diagnosis.get("working_time");
            String[] work_timeArr = work_time.split(",");


            int start_time = Integer.parseInt(work_timeArr[0]);
            int end_time = Integer.parseInt(work_timeArr[work_timeArr.length - 1]) + 1;

            if (end_time >= 13) {
                if (start_time >= 13) {
                    start_time -= 12;
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                } else if (start_time == 12) {
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                } else if (start_time < 12) {
                    end_time -= 12;
                    work_time = "오전 " + start_time + "시 ~ 오후 " + end_time + "시";
                }
            } else if (end_time <= 12) {
                work_time = "오전 " + start_time + "시 ~ 오전 " + end_time + "시";

            }
            diagnosis.replace("working_time", work_time);

            String lunch_time_str = "";
            int lunch_time = Integer.parseInt((String) diagnosis.get("lunch_time"));
            //13시 이후 일 때  =>  오후 1시 ~ 오후 2시, 오후 2시 ~ 오후 3시 ... 로 출력
            if (lunch_time >= 13) {
                lunch_time -= 12;
                lunch_time_str = ("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time == 12) { // 12시 일 때, 오후 12시 ~ 오후 1시
                lunch_time_str = ("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time - 11) + "시");
            } else if (lunch_time == 11) { //11시 일 때, 오전 11시 ~ 오후 12시
                lunch_time_str = ("오전 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time < 11) { // 10시 이전 일 때, 오전 10시 ~ 오전 11시, 오전 9시 ~ 오전 10시 ...로 출력
                lunch_time_str = ("오전 " + lunch_time + "시 ~ 오전 " + (lunch_time + 1) + "시");
            }
            diagnosis.replace("lunch_time", lunch_time_str);

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
            params.put("to", user.getUser_phone());// 수신전화번호
            params.put("from", "01089303955");// 발신전화번호
            params.put("type", "LMS");
            params.put("text", "진료를 시작합니다.\n" +
                    "1대1 전용화상진료실\n" +
                    "\n" +
                    "https://homespital.herokuapp.com/meeting\n" +
                    "\n" +
                    dig.getDiagnosis_wait_number() + "번 방으로 들어가주세요.\n" +
                    "\n" +
                    "의사명:" + dtcName + "\n" +
                    "환자명:" + userName + "\n"); // 문자 내용 입력 ,담당의사 이름,환자이름
            params.put("app_version", "test app 1.2"); // application name and version
            org.json.simple.JSONObject obj = coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
            System.out.println("params = " + params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    // 진료 완료하기 diagnoisis_status (1 -> 3)(준근)
    // 진료 완료하기 할 때 유효성 검사(is_diagnosis_upload가 2가 아니면 진료완료 실패하고 alert띄움
    //진료완료시  진료완료되었다고  문자전송(처방전없을경우에만) 있을시 문자전송x 약국에서 보냄 태영
    @ResponseBody
    @PostMapping("/finishDiagnosis")
    public String finishDiagnosis(int diagnosis_number) {
        String api_key = "NCSK1Q8DMWF4EQYK";
        String api_secret = "9KEMFM30PPC8NTBR62L9WECLHIRXQJTO";
        Message coolsms = new Message(api_key, api_secret);
        HashMap<String, String> params = new HashMap<String, String>();
        try {
            Diagnosis diag = diagnosisService.getDiaInfo(diagnosis_number);
            Doctor dtc = doctorService.getDocInfo(diag.getDoctor_number());
            User user = userService.getUserInfo(diag.getUser_number());
            String dtcName = dtc.getDoctor_name();
            String userName = user.getUser_name();
            String dtcPhone = dtc.getDoctor_phone();
            String userPhone = user.getUser_phone();
            //is_diagnosis_upload가 2(업로드완료) 인지 확인
            Diagnosis diagnosis = doctorService.checkDiagnosisUpload(diagnosis_number);
            if (diagnosis.getIs_diagnosis_upload() != 2) {
                return "failed";
            }
            // 진료완료 하면서 is_prescription_upload=1(처방전업로드X상태)이면
            // is_prescription_upload = 3(처방전없음) and diagnosis_status = 7 (처방전 없이 진료 완료) 처리
            if (diagnosis.getIs_prescription_upload() == 1) {
                doctorService.changePrescription(diagnosis_number);
                params.put("to", "01089303955");
                params.put("from", "01089303955");
                params.put("type", "LMS");
                params.put("text", "진료가 완료되었습니다. 좋은 하루 보내시길 바랍니다.");
                org.json.simple.JSONObject obj = coolsms.send(params);
                System.out.println(obj.toString());
                return "success";
            }
            //훈 - 결제 처리
            System.out.println("STARTING GET TOKEN");
            JSONObject authToken = paymentService.getAuthToken();
            System.out.println("STARTING PAYING");
            JSONObject payResult = paymentService.pay(authToken.getString("access_token"),
                    diagnosis.getDiagnosis_number(),
                    diagnosis.getBilling_key(),
                    diagnosis.getUser_number(),
                    diagnosis.getDiagnosis_money(),
                    "멀캠진료테스팅");
            System.out.println("PAY END");
            if (!payResult.getString("status").equals("paid")) {
                System.out.println("결제 실패");
            }

            //진료완료 처리
            doctorService.finishDiagnosis(diagnosis_number);
        } catch (CoolsmsException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
            System.out.println("params = " + params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    @ResponseBody
    @PostMapping("/writeOpinion")
    public ResponseEntity<String> writeOpinion(@RequestParam int diagnosis_number,
                                               @RequestParam String doctor_opinion,
                                               @RequestParam int diagnosis_money) {
        ResponseEntity<String> result = null;
        try {
            diagnosisService.writeDoctorOpinionAndMoney(diagnosis_number, doctor_opinion, diagnosis_money);
            result = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            result = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
        }
        return result;
    }


    //진료영수증 업로드 (준근)
    //receipt(진료영수증) == diagnosis_file_name
    @PostMapping("/receiptUpload")
    public String receiptUpload(MultipartFile receiptFile, int diagnosis_number, HttpServletResponse response) throws Exception {
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

        return "redirect:/doctor/customerDetail/" + String.valueOf(diagnosis_number);
    }

    // 처방전 업로드(준근)
    @PostMapping("/prescriptionUpload")
    public String prescriptionUpload(MultipartFile prescriptionFile, int diagnosis_number, HttpServletResponse response) throws Exception {
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

        return "redirect:/doctor/customerDetail/" + String.valueOf(diagnosis_number);
    }
}