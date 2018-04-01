package com.example.softdelete.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDate;

@Entity
public class Salary {
    @Id
    Integer id;
    Integer salary;
    LocalDate fromDate;
    LocalDate toDate;
}
