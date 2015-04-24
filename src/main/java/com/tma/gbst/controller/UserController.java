package com.tma.gbst.controller;

import com.sun.tracing.dtrace.ModuleAttributes;
import com.tma.gbst.model.Role;
import com.tma.gbst.model.User;
import com.tma.gbst.service.UserService;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.json.JSONArray;
import org.json.JSONObject;

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

    @RequestMapping(value = "/userList", method = RequestMethod.GET, headers = "Accept=application/json")
    public @ResponseBody
    String listUsersJson() throws JSONException {
        JSONArray userArray = new JSONArray();
        for (User user : userService.findAll()) {
            JSONObject userJSON = new JSONObject();
            userJSON.put("id", user.getId());
            userJSON.put("name", user.getName());
            userJSON.put("email", user.getEmail());
            userArray.put(userJSON);
        }
        return userArray.toString();
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@RequestBody String newUser) {
        // System.out.println(newUser);
        try {
            JSONObject userJSON = new JSONObject(newUser);
            User user = new User();
            user.setEmail(userJSON.getString("email"));
            user.setName(userJSON.getString("name"));
            user.setEnabled("YES");
            user.setPassword("123");
            user.setRole(Role.ROLE_USER);
            User check = userService.save(user);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return "redirect:/protected/user";
    }

    @RequestMapping("/deleteUser/{userId}")
    public String deleteUser(@PathVariable("userId") int userId) {
        System.out.println(userId);
/*        try {
            System.out.println(deleteUser);
            JSONObject userJSON = new JSONObject(deleteUser);
            userService.delete(userJSON.getInt("id"));
        } catch (JSONException e) {
            e.printStackTrace();
        }*/
        return "redirect:/protected/user";
    }
}
