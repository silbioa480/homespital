package mna.homespital.controller;

import mna.homespital.dto.Doctor;
import mna.homespital.dto.User;
import mna.homespital.model.Room;
import mna.homespital.model.RoomService;
import mna.homespital.service.DoctorService;
import mna.homespital.service.MemberService;
import mna.homespital.util.Parser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;

@Controller
@ControllerAdvice
@RequestMapping("/meeting")
public class MeetingController {

    @Autowired
    HttpSession session;

    @Autowired
    MemberService memberService;

    @Autowired
    DoctorService doctorService;

    @Autowired
    RoomService roomService;

    @Autowired
    Parser parser;

    /**
     * home 접속시 실행
     */
    @GetMapping({"", "/", "/index", "/home"})
    public ModelAndView displayMainPage(final Long id, final String uuid) {
        ModelAndView mav = new ModelAndView("meeting/main");

        mav.addObject("id", id);
        mav.addObject("rooms", roomService.getRooms());
        mav.addObject("uuid", uuid);
        return mav;
    }

    /**
     * room 만들때 실행됨
     *
     * @param sid
     * @param uuid
     * @param binding
     * @return
     */
    @PostMapping(value = "/room", params = "action=create")
    public ModelAndView processRoomSelection(@ModelAttribute("id") final String sid,
                                             @ModelAttribute("uuid") final String uuid,
                                             final BindingResult binding) {
        ModelAndView mav = new ModelAndView();
        if (binding.hasErrors()) {
            // simplified version, no errors processing
            return new ModelAndView("redirect:/meeting/");
        }
        Optional<Long> optionalId = parser.parseId(sid);
        optionalId.ifPresent(id -> Optional.ofNullable(uuid).ifPresent(name -> roomService.addRoom(new Room(id))));

        mav = displayMainPage(optionalId.orElse(null), uuid);
        try {
            String username = null;
            Doctor doctor = (Doctor) session.getAttribute("doctor");
            User user = memberService.queryMember((String) session.getAttribute("email"));
            if (doctor != null) {
                username = doctor.getDoctor_name();
            } else if (user != null) {
                username = user.getUser_name();
            }

            if (username != null) mav.addObject("username", username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    @GetMapping("/room/{sid}")
    public void getUUIDandGoToRoom(@PathVariable("sid") final String sid, HttpServletResponse response, HttpServletRequest request) throws Exception {
        response.setContentType("text/html; charset=euc-kr");
        PrintWriter out = response.getWriter();
        out.println("<script>function guid() {\n" +
                "        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {\n" +
                "            let r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);\n" +
                "            return v.toString(16);\n" +
                "        });\n" +
                "    }\n" +
                "\n" +
                "    if (localStorage.getItem(\"uuid\") === null) {\n" +
                "        localStorage.setItem(\"uuid\", guid());\n" +
                "    }" +
                "var str ='/meeting/room/" + sid + "/user/' + localStorage.getItem(\"uuid\"); location.href=str;</script>");
        out.flush();
    }

    /**
     * 채팅방에 입장할때 실행됨 (채팅방 id 와 입장 uuid 필요)
     */
    @GetMapping("/room/{sid}/user/{uuid}")
    public ModelAndView displaySelectedRoom(@PathVariable("sid") final String sid, @PathVariable("uuid") final String uuid) {
        ModelAndView mav = new ModelAndView("redirect:/meeting/");
        if (parser.parseId(sid).isPresent()) {
            Room room = roomService.findRoomByStringId(sid).orElse(null);
            if (room != null && uuid != null && !uuid.isEmpty()) {
                System.out.println("User " + uuid + "is going to join Room #" + sid);
                // open the chat room
                mav = new ModelAndView("meeting/chat_room", "id", sid);
                mav.addObject("uuid", uuid);
            }
        }
        try {
            String username = null;
            Doctor doctor =
                    doctorService.getDocInfo(((Doctor) session.getAttribute("doctor")).getDoctor_number());
            User user = memberService.queryMember((String) session.getAttribute("email"));
            if (doctor != null) {
                username = doctor.getDoctor_name();
            } else if (user != null) {
                username = user.getUser_name();
            }

            if (username != null) mav.addObject("username", username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    /**
     * 채팅방에서 나갈때 실행됨
     */
    @GetMapping("/room/{sid}/user/{uuid}/exit")
    public ModelAndView processRoomExit(@PathVariable("sid") final String sid, @PathVariable("uuid") final String uuid) {
        ModelAndView mav = new ModelAndView("redirect:/meeting/");
        if (sid != null && uuid != null) {
            System.out.println("User " + uuid + "has left Room #" + sid);
            // implement any logic you need
        }
        return mav;
    }

    @GetMapping("/room/random")
    public ModelAndView requestRandomRoomNumber(@ModelAttribute("uuid") final String uuid) {
        return displayMainPage(ThreadLocalRandom.current().nextLong(0, 100), uuid);
    }

    /**
     * client에서 sdp offer 할때 실행되며
     * sdp_offer html 반환
     */
    @GetMapping("/offer")
    public ModelAndView displaySampleSdpOffer() {
        return new ModelAndView("meeting/sdp_offer");
    }


    @GetMapping("/stream")
    public ModelAndView displaySampleStreaming() {
        return new ModelAndView("meeting/streaming");
    }
}
