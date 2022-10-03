package com.customer.dao;

import java.util.List;
import com.customer.model.Customer;

/**
 * This CustomerDao.java interface is implement in CustomerDaoImpl.java class
 * @author Darshit Patel
 */

public interface CustomerDao {

	public List<Customer> getAllCustomer();

	public void addData(Customer customer);

	public void delete(int id);

	public Customer getCustomerById(int id);

	public Boolean mobileNumberIsExist(String number, Integer id);

	public Boolean emailIsExist(String mail, Integer id);

}
