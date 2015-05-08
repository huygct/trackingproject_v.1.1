package com.tma.gbst.controller;

import com.tma.gbst.model.Role;
import com.tma.gbst.model.User;
import com.tma.gbst.model.UserProfile;
import com.tma.gbst.service.UserProfileService;
import com.tma.gbst.service.UserService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by thuynghi on 5/4/2015.
 */
@Controller
@RequestMapping(value = "/protected/report")
public class ReportController {
    @Autowired
    UserService userService;
    @Autowired
    UserProfileService userProfileService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome () {
        return new ModelAndView("report");
    }

    @RequestMapping(value = "/viewInformation", method = RequestMethod.GET)
    public @ResponseBody String processUsers (HttpSession session) throws JSONException {
        List<User> userList = userService.findByRole(Role.ROLE_USER);
        // year experience
        int yearExperiences[] = {0, 0, 0, 0, 0, 0};
        JSONObject json = new JSONObject();

        int numberSize = userList.size();
        int numberIn = 0;
        int numberOut = 0;
        int numberMale = 0;
        int numberFemale = 0;

        for (int i = 0; i < numberSize; i++) {
            if(userList.get(i).getEnabled().equals("YES")) {
                numberIn++;
            }
            else {
                numberOut++;
            }

            UserProfile userProfile= userList.get(i).getUserProfile();
            if (userProfile != null ) {
                if (userProfile.isGender()) {
                    numberMale++;
                } else {
                    numberFemale++;
                }
                if(userProfile.getExperienceYears() > 5) {
                    yearExperiences[5]++;
                } else if(userProfile.getExperienceYears() >3) {
                    yearExperiences[4]++;
                } else if(userProfile.getExperienceYears() > 2) {
                    yearExperiences[3]++;
                } else if(userProfile.getExperienceYears() > 1) {
                    yearExperiences[2]++;
                } else if(userProfile.getExperienceYears() > 0.5) {
                    yearExperiences[1]++;
                } else {
                    yearExperiences[0]++;
                }
            }
        }

        json.put("size", numberSize);
        json.put("in", numberIn);
        json.put("out", numberOut);
        json.put("male", numberMale);
        json.put("female", numberFemale);
        for (int i = 0; i < 6; i++) {
            json.put("yearExperiences_" + i, yearExperiences[i]);
        }
//        System.out.println(userList);
        return json.toString();
    }

    @RequestMapping(value = "/getInformationByMonth", params = {"month", "year"})
    public @ResponseBody String getInformationByMonth (@RequestParam("month") String month, @RequestParam("year") String year) throws JSONException {

        String searchData = year + "-" + month;
        List<User> userList = userService.findByRole(Role.ROLE_USER);

        JSONObject json = new JSONObject();
        int inByMonth = 0;
        int numberMaleByMonth = 0;
        int numberFemaleByMonth = 0;
        int outByMonth = 0;
        for (int i = 0; i < userList.size(); i++) {
            UserProfile userProfile = userList.get(i).getUserProfile();
            if (userProfile.getJoinDate().startsWith(searchData)) {
                inByMonth++;
                if (userProfile.isGender()) {
                    numberMaleByMonth++;
                } else {
                    numberFemaleByMonth ++;
                }
            }
        }

        json.put("inByMonth", inByMonth);
        json.put("outByMonth", outByMonth);
        json.put("numberMaleByMonth", numberMaleByMonth);
        json.put("numberFemaleByMonth", numberFemaleByMonth);

        return json.toString();

//        in out male female
    }


}
