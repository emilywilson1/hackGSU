package com.example.emilywilson.hackgsuapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.amazonaws.mobile.client.AWSMobileClient;

public class ManagerPortal extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AWSMobileClient.getInstance().initialize(this).execute();
        setContentView(R.layout.activity_manager_portal);
    }
}
