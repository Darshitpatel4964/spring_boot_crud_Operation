package com.customer.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.customer.dao.CustomerDao;
import com.customer.model.Customer;

/**
 * This is CustomerServiceImpl.java class
 * This class access all method of CustomerDao.java class
 * All method of this class is implemented by CustomerService.java class
 * @author Darshit Patel
 */

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

	// This is declaration of CustomerDao.java class
	@Autowired
	CustomerDao customerDao;

	@Override
	public List<Customer> getAllCustomer() {
		return customerDao.getAllCustomer();
	}

	@Override
	public void addData(Customer customer) {
		customerDao.addData(customer);
	}

	@Override
	public void delete(int id) {
		customerDao.delete(id);
	}

	@Override
	public Customer getCustomerById(int id) {
		return customerDao.getCustomerById(id);
	}

	@Override
	public Boolean mobileNumberIsExist(String number, Integer id) {
		return customerDao.mobileNumberIsExist(number, id);
	}

	@Override
	public Boolean emailIsExist(String mail, Integer id) {
		return customerDao.emailIsExist(mail, id);
	}

}
