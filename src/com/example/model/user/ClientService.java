package com.example.model.user;
import java.util.*;

import com.example.model.*;
import com.example.model.manager.ManagerService;
public class ClientService extends Service {
    public static User login(String userId, String password) {
        if(ManagerService.noOfUsers == 0) return null;
        for(User user : ManagerService.users) {
            if(userId.equals(user.getUserId()) && password.equals(user.getPassword())) return user;
        }
        return null;
    }
    public static User register(String fullName, String phoneNums, String userId, String password) {
        User user = new User(fullName, phoneNums, userId, password);
        // user.setActiveLoginState();
        ManagerService.users.add(user);
        ManagerService.noOfUsers++;
        return user;
    }
    public static boolean isExistedAccount(String phoneNums) {
        if(ManagerService.noOfUsers == 0) return false;
        for(User user : ManagerService.users) {
            if(phoneNums.equals(user.getPhoneNums())) return true;
        }
        return false;
    }
    public static boolean isExistedUserId(String userId) {
        if(ManagerService.noOfUsers == 0) return false;
        for(User user : ManagerService.users) {
            if(userId.equals(user.getUserId())) return true;
        }
        return false;
    }
}