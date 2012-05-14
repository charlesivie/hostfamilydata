package uk.co.hostfamilydata.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.Lob;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class HostFamily {

    private String firstName;
    private String lastName;
    private String firstName2;
    private String lastName2;
    private String address;
    private String address2;
    private String address3;
    private String postCode;
    private String phone;
    private String phone2;
    private int numberOfStudents;
    @Lob
    private String notes;
    private boolean confirmed;
    private String whatToShow;
    private String email;
    private String profession;
    private String profession2;
    @Lob
    private String childrenAndTheirDOBs;
    @Lob
    private String students;

}
