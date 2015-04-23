package com.tma.gbst.controller;

import com.tma.gbst.model.User;
import com.tma.gbst.repository.UserRepository;
import com.tma.gbst.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/protected/home")
public class IndexController {

    UserService userService;
    UserRepository userRepository;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("welcomePage");
    }

    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public @ResponseBody List<String> userList() {
        List<String> r = new ArrayList<String>();
        r.add("dsfdsfdsf");
        r.add("dsfdsfdsfdsf");
        r.add("sdfsdfdfdsf");
        return  r;
    }
}
