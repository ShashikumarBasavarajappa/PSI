/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dev.psi;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author insbasavar
 */
@Remote
public interface OperationsSessionBeanRemote {
        float add(String first_name,String last_name,String goc,String username,String password,Double contact_no, String email);
         ArrayList<Employee> search(String first_name,String last_name);
         void delete(int delete_value);
         List<Employee> update_data_get(int update_data_value);
         void update_employee_form_data(String first_name,String last_name,String username,String password,String email,int employee_id);
}
