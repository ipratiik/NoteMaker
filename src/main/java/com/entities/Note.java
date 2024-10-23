package com.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;
import java.util.Random;

@Entity
@Table(name = "Notes")
public class Note {
    @Id
    private int id;
    private String title;
    @Column(length = 1500)
    private String content;
    private Date addeddate;

    public Note(){
        super();
    }

    public Note(String title, String content, Date addeddate) {
        super();
        this.id = new Random().nextInt(100000);
        this.title = title;
        this.content = content;
        this.addeddate = addeddate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddeddate() {
        return addeddate;
    }

    public void setAddeddate(Date addeddate) {
        this.addeddate = addeddate;
    }
}
