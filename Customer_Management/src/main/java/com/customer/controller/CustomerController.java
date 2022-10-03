package com.customer.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.customer.model.Customer;
import com.customer.service.CustomerService;

/**
 * This is CustomerController.java class for  project It is maintain all request
 * @author Darshit Patel
 */

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;

	// This method is for maintain blank request
	@RequestMapping("/")
	public ModelAndView get() {
		ModelAndView model = new ModelAndView();
		model.addObject("customerList", customerService.getAllCustomer());
		model.setViewName("list");
		return model;
	}

	// This method is for show registration.jsp page
	@RequestMapping("/registration")
	public ModelAndView registration() {
		ModelAndView model = new ModelAndView();
		Customer customer = new Customer();
		model.addObject("customer", customer);
		model.setViewName("registration");
		return model;
	}

	/*
	* This method is for maintain save data request from registration.jsp page In
	* this method data add in database and all validation is check in this method
	*/
	@RequestMapping(value = "/savedata", method = RequestMethod.POST)
	public ModelAndView save(@Valid @ModelAttribute("customer") Customer customer, BindingResult bindingResult) {
		ModelAndView model = new ModelAndView();
		String number = customer.getMobileNumber();
		String mail = customer.getEmail();
		Integer id = customer.getId();
		boolean numberValue = customerService.mobileNumberIsExist(number, id);
		boolean mailValue = customerService.emailIsExist(mail, id);

		if (bindingResult.hasErrors()) {
			model.addObject("error", bindingResult.getAllErrors());
			model.setViewName("registration");
		} else if (numberValue != true) {
			model.addObject("numberError", "This mobile number is already used!");
			model.setViewName("registration");
		} else if (mailValue != true) {
			model.addObject("emailError", "This email address is already used!");
			model.setViewName("registration");
		} else {
			customerService.addData(customer);
			model.setViewName("redirect:/");
		}
		return model;
	}

	// This method is for maintain edit data request from list.jsp page
	@RequestMapping("/edit/{id}")
	public ModelAndView getCustomerById(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView();
		model.addObject("customer", customerService.getCustomerById(id));
		model.setViewName("registration");
		return model;
	}

	// This method is for maintain delete data request from list.jsp page
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id) {
		customerService.delete(id);
		return "redirect:/";
	}

}
