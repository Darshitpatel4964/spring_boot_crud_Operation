$(document).ready(function() {
  $("#register-form").validate({
        rules: {
          'firstName': {
           required: true,
           minlength: 2
           },
           'lastName': {
           required: true,
           minlength: 2
           },
           'dateOfBirth': {
           required: true         
           },
          'mobileNumber': {
           required: true,
           number: true,
		   minlength: 10,
		   maxlength: 10
           },
           'address1': {
           required: true
           },
           'address2': {
           required: true
           },
           'age': {
           required: true,
           digits:true
           },
           'gender': {
           required: true,
           },
           'email': {
           required: true
           },
           
        },
        messages: {
           firstName: {
          required:"Please Enter your first name!."
          },
           lastName: {
          required:"Please Enter your last name!."
          },
           dateOfBirth: {
          required:"Please Enter your date of birth!."
          },
           mobileNumber: {
          required:"Please Enter your mobile number!."
          },
           address1: {
          required:"Please Enter your address1!."
          },
            address2: {
          required:"Please Enter your address2!."
          },
            age: {
          required:"Please Enter your age!."
          },
            gender: {
          required:"Please select a gender!."
          },
             email: {
          required:"Please Enter your Email address!."
          },
          
        }
      });
 });
 
 
 
