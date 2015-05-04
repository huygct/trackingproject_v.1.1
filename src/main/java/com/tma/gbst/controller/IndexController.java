package com.tma.gbst.controller;

import com.tma.gbst.model.Role;
import com.tma.gbst.model.User;
import com.tma.gbst.model.UserProfile;
import com.tma.gbst.repository.UserRepository;
import com.tma.gbst.service.UserProfileService;
import com.tma.gbst.service.UserService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/protected/home")
public class IndexController {

    @Autowired
    UserProfileService userProfileService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("home");
    }

    @RequestMapping(value = "/userProfileList", method = RequestMethod.GET, headers = "Accept=application/json")
    public @ResponseBody
    String userProfileJson() throws JSONException {
        JSONArray userArray = new JSONArray();
        for (UserProfile userProfile : userProfileService.findAll()) {
            JSONObject userJSON = new JSONObject();

            userJSON.put("id", userProfile.getId());
            userJSON.put("badgeId", userProfile.getBadgeId());
            userJSON.put("badgeIdMentor", userProfile.getBadgeIdMentor());
            userJSON.put("school", userProfile.getSchool());
            userJSON.put("graduateDate", userProfile.getGraduateDate());
            userJSON.put("finalStudyResult", userProfile.getFinalStudyResult());
            userJSON.put("toeic", userProfile.getToeic());
            userJSON.put("joinDate", userProfile.getJoinDate());

            userJSON.put("workRole", userProfile.getWorkRole());
            userJSON.put("experienceYears", userProfile.getExperienceYears());
            userJSON.put("experienceYearsInCurrentRole", userProfile.getExperienceYearsInCurrentRole());
            userJSON.put("professionalCertification", userProfile.getPoliceClearanceStatus());
            userJSON.put("overseaWorkingExperience", userProfile.isOverseaWorkingExperience());
            userJSON.put("policeClearanceStatus", userProfile.getPoliceClearanceStatus());
            userJSON.put("cvUrl", userProfile.getCvUrl());
            userJSON.put("imageUser", userProfile.getImageUser());

            userJSON.put("place", userProfile.getPlace());
            userJSON.put("gender", userProfile.isGender());
            userJSON.put("needTracking", userProfile.isNeedTracking());
            userJSON.put("skypeId", userProfile.getSkypeId());
            userJSON.put("ipAddress", userProfile.getIpAddress());
            userJSON.put("generalStatus", userProfile.getGeneralStatus());

            userArray.put(userJSON);
        }
        System.out.println(userArray.toString());
        return userArray.toString();
    }

    @RequestMapping(value = "/addUserProfile", method = RequestMethod.POST)
    public String addUserProfile(@RequestBody String newUserProfile) {
        try {
            JSONObject userJSON = new JSONObject(newUserProfile);
            UserProfile userProfile = new UserProfile();

            userProfile.setId(Integer.parseInt(userJSON.getString("id")));
            userProfile.setBadgeId(Integer.parseInt(userJSON.getString("badgeId")));
            userProfile.setBadgeIdMentor(Integer.parseInt(userJSON.getString("badgeIdMentor")));
            userProfile.setSchool(userJSON.getString("school"));
            userProfile.setDegree(userJSON.getString("degree"));
            userProfile.setGraduateDate(Timestamp.valueOf(userJSON.getString("graduateDate")));
            userProfile.setFinalStudyResult(Double.valueOf(userJSON.getString("finalStudyResult")));
            userProfile.setToeic(Integer.valueOf(userJSON.getString("toeic")));
            userProfile.setJoinDate(Timestamp.valueOf(userJSON.getString("joinDate")));
            userProfile.setWorkRole(userJSON.getString("workRole"));
            userProfile.setExperienceYears(Double.valueOf(userJSON.getString("experienceYears")));
            userProfile.setExperienceYearsInCurrentRole(Double.valueOf(userJSON.getString("experienceYearsInCurrentRole")));
            userProfile.setProfessionalCertification(Boolean.valueOf(userJSON.getString("professionalCertification")));
            userProfile.setOverseaWorkingExperience(Boolean.valueOf(userJSON.getString("overseaWorkingExperience")));
            userProfile.setPoliceClearanceStatus(userJSON.getString("policeClearanceStatus"));
            userProfile.setCvUrl(userJSON.getString("cvUrl"));
            userProfile.setImageUser(userJSON.getString("imageUser"));
            userProfile.setPlace(userJSON.getString("place"));
            userProfile.setGender(Boolean.valueOf(userJSON.getString("gender")));
            userProfile.setNeedTracking(Boolean.valueOf(userJSON.getString("needTracking")));
            userProfile.setSkypeId(userJSON.getString("skypeId"));
            userProfile.setIpAddress(userJSON.getString("ipAddress"));
            userProfile.setGeneralStatus(userJSON.getString("generalStatus"));


            UserProfile check = userProfileService.save(userProfile);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return "redirect:/protected/home";
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
