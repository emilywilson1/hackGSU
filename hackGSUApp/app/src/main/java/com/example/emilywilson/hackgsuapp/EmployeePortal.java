package com.example.emilywilson.hackgsuapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.amazonaws.mobile.client.AWSMobileClient;

public class EmployeePortal extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_employee_portal);
        AWSMobileClient.getInstance().initialize(this).execute();
    }
}
