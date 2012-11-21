package uk.co.hostfamilydata.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString
@EqualsAndHashCode(exclude = {"id"})
@Getter
@Setter
public class HostFamily {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
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
	@Column(columnDefinition = "BIT")
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
