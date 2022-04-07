package mna.homespital.dto;

import java.util.Date;

//소연 : 닥터 스케쥴

public class Doctor_schedule {
    int schedule_number;
    int doctor_number;
    int user_number;
    int schedule_time;
    Date create_date;
    Date update_date;
    int waitingNum;


    public Doctor_schedule() {
    }

    public Doctor_schedule(int schedule_number, int doctor_number, int user_number, int schedule_time, Date create_date, Date update_date) {
        this.schedule_number = schedule_number;
        this.doctor_number = doctor_number;
        this.user_number = user_number;
        this.schedule_time = schedule_time;
        this.create_date = create_date;
        this.update_date = update_date;
    }

    public int getSchedule_number() {
        return schedule_number;
    }

    public void setSchedule_number(int schedule_number) {
        this.schedule_number = schedule_number;
    }

    public int getDoctor_number() {
        return doctor_number;
    }

    public void setDoctor_number(int doctor_number) {
        this.doctor_number = doctor_number;
    }

    public int getUser_number() {
        return user_number;
    }

    public void setUser_number(int user_number) {
        this.user_number = user_number;
    }

    public int getSchedule_time() {
        return schedule_time;
    }

    public void setSchedule_time(int schedule_time) {
        this.schedule_time = schedule_time;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public int getWaitingNum() {
        return waitingNum;
    }

    public void setWaitingNum(int waitingNum) {
        this.waitingNum = waitingNum;
    }
}
