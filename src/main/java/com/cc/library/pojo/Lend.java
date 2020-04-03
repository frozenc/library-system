package com.cc.library.pojo;

import java.util.Date;

public class Lend {
    private int id;
    private int book_id;
    private int user_id;
    private Date lend_date;
    private Date back_date;
    private int state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getLend_date() {
        return lend_date;
    }

    public void setLend_date(Date lend_date) {
        this.lend_date = lend_date;
    }

    public Date getBack_date() {
        return back_date;
    }

    public void setBack_date(Date back_date) {
        this.back_date = back_date;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Lend{" +
                "id=" + id +
                ", book_id=" + book_id +
                ", user_id=" + user_id +
                ", lend_date=" + lend_date +
                ", back_date=" + back_date +
                ", state=" + state +
                '}';
    }
}
