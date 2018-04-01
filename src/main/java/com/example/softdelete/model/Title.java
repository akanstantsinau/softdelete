package com.example.softdelete.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDate;

@Entity
public class Title {
    @Id
    Integer id;
    String title;
    LocalDate fromDate;
    LocalDate toDate;
}
