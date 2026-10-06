package com.aspflash.tools;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;
import com.google.android.material.tabs.TabLayout;

public class MainActivity extends Activity {
    private TextView contentViewText;
    private TextView connectionStatus;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        contentViewText = findViewById(R.id.contentViewText);
        connectionStatus = findViewById(R.id.connectionStatus);
        TabLayout tabLayout = findViewById(R.id.tabLayoutMenu);

        tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                switch (tab.getPosition()) {
                    case 0:
                        contentViewText.setText("--- Terminal Console Perintah Shell adb ---\n\nKetik perintah di baris input bawah.");
                        break;
                    case 1:
                        contentViewText.setText("--- Manajer Aplikasi Target (Packages) ---\n\nDaftar aplikasi terinstall akan muncul di sini.");
                        break;
                    case 2:
                        contentViewText.setText("--- Mode Interaksi Protokol Fastboot ---\n\nSiap mengeksekusi flashing script / boot.img target.");
                        break;
                }
            }
            @Override public void onTabUnselected(TabLayout.Tab tab) {}
            @Override public void onTabReselected(TabLayout.Tab tab) {}
        });
    }
}
