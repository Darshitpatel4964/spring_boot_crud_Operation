package com.customer.service;

import java.util.List;
import com.customer.model.Customer;

/**
 * This CustomerService.java interface is implement in CustomerServiceImpl.java class
 * @author Darshit Patel
 */

public interface CustomerService {

	public List<Customer> getAllCustomer();

	public void addData(Customer customer);

	public void delete(int id);

	public Customer getCustomerById(int id);

	public Boolean mobileNumberIsExist(String number, Integer id);

	public Boolean emailIsExist(String mail, Integer id);

}
