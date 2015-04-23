package com.tma.gbst.controller;

import com.tma.gbst.model.User;
import com.tma.gbst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Nghi Tran on 4/21/2015.
 */

@Controller
@RequestMapping(value = "/protected/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome () {
        return new ModelAndView("userList");
    }

    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public @ResponseBody
    List<User> userList() {
        return  userService.findAll();
    }
}
