package com.customer.model;

import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Getter;
import lombok.Setter;

/**
 * This class is declare all Customer data  entity
 * and getter and setter method to set and get data using Lombok.
 * @author Darshit Patel
 */

// Annotation for table
@Entity
@Table(name = "customer_data")

// Annotation for Getter and setter for all entity using Lombok
@Getter
@Setter

public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@NotEmpty(message = "First Name is required!")
	@Pattern(regexp = "[a-zA-Z]*", 
	message = "First name only contain characters!")
	@Column(name = "first_name")
	private String firstName;

	@NotEmpty(message = "Last Name is required!")
	@Pattern(regexp = "[a-zA-Z]*", 
	message = "Last name only contain characters!")
	@Column(name = "last_name")
	private String lastName;

	@NotNull(message = "Date Of Birth is required!")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "date_of_birth")
	private Date dateOfBirth;

	@NotEmpty(message = "Mobile Number is required, and can not accept alphabetic character!")
	@Column(name = "mobile_number")
	private String mobileNumber;

	@NotEmpty(message = "Address1 is required!")
	@Column(name = "address_1")
	private String address1;

	@NotEmpty(message = "Address2 is required!")
	@Column(name = "address_2")
	private String address2;

	@NotEmpty(message = "Age is required!")
	@Pattern(regexp = "[0-9]|[0-9][0-9]|[1][0-9][0-9]|200", 
	message = "Age only contain number , and it should not be more than 200!")
	@Column(name = "age")
	private String age;

	@NotNull(message = "Gender is required!")
	@Column(name = "gender")
	private Integer gender;

	@NotEmpty(message = "Email is required!")
	@Email(message = "Enter email in proper format!")
	@Column(name = "email")
	private String email;

}