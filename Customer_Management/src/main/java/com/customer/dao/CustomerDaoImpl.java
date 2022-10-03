package com.customer.dao;

import java.util.List;
import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.customer.model.Customer;

/**
 * This is CustomerDaoImpl.java class for add data, edit data, delete and get data from database all
 * method of this class is implemented by CustomerDao.java class
 * @author Darshit Patel
 */

@Repository
public class CustomerDaoImpl implements CustomerDao {

	// This entity manager class for get session
	@Autowired
	EntityManager entityManager;

	// This method is for get all customer data from database
	@Override
	public List<Customer> getAllCustomer() {
		Session session = entityManager.unwrap(Session.class);
		Query<Customer> query = session.createQuery("from Customer c ORDER BY c.id DESC", Customer.class);
		List<Customer> list = query.getResultList();
		return list;
	}

	// This method is for add or update customer data in database
	@Override
	public void addData(Customer customer) {
		Session session = entityManager.unwrap(Session.class);
		session.saveOrUpdate(customer);
	}

	// This method is for delete data of selected id from database
	@Override
	public void delete(int id) {
		Session session = entityManager.unwrap(Session.class);
		Customer customer = session.get(Customer.class, id);
		session.delete(customer);
	}

	// This method is for find all data of selected id from database
	@Override
	public Customer getCustomerById(int id) {
		Session session = entityManager.unwrap(Session.class);
		Customer customer = session.get(Customer.class, id);
		return customer;
	}

	// This method is for validate mobile number
	@Override
	public Boolean mobileNumberIsExist(String number, Integer id) {
		boolean value = false;
		Session session = entityManager.unwrap(Session.class);
		Query<Customer> query = session.createQuery("From Customer c where" 
				+ " c.mobileNumber = :mobileNumber "
				+ " and (c.id <> " + id + " or " + id + " < 1)", Customer.class);
		query.setParameter("mobileNumber", number);
		List<Customer> list = query.getResultList();
		if (list.isEmpty()) {
			value = true;
		}
		return value;
	}

	// This method is for validate email address.
	@Override
	public Boolean emailIsExist(String mail, Integer id) {
		boolean value = false;
		Session session = entityManager.unwrap(Session.class);
		Query<Customer> query = session.createQuery(
				"From Customer c where" + " c.email = :email"
				+ " and (c.id <> " + id + " or " + id + " < 1)",
				Customer.class);
		query.setParameter("email", mail);
		List<Customer> list = query.getResultList();
		if (list.isEmpty()) {
			value = true;
		}
		return value;
	}

}
