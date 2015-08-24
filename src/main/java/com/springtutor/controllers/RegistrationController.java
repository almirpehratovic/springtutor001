package com.springtutor.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springtutor.model.Status;

@Controller
@RequestMapping("/register")
public class RegistrationController {
	private static final String[] reservedUsernames = { "spring", "tutor",
			"java" };

	@RequestMapping(method = RequestMethod.POST)
	public String register(@RequestParam("username") String username,
			@RequestParam("password") String password, Model model) {

		String message = "User " + username + " successfully registered.";
		for (String reserved : reservedUsernames) {
			if (reserved.equals(username)) {
				message = "Sorry, username " + username + " is reserved";
				break;
			}
		}

		model.addAttribute("message", message);
		System.out.println("registration success");
		return "showMessage";
	}

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	@ResponseBody
	public Status checkIsAvailable(String username) {
		boolean isOk = true;

		if (username.length() < 5) {
			isOk = false;
		} else {
			for (String reserved : reservedUsernames) {
				if (reserved.equals(username)) {
					isOk = false;
					break;
				}
			}
		}
		Status status = new Status();
		status.setOk(isOk);

		if (isOk) {
			status.setMessage("Username is available");
		} else {
			status.setMessage("Sorry, username is not available or not accepted");
		}
		return status;
	}
}
