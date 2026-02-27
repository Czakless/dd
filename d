<TextView
android layout_width=" wrap_content" android: layout_height="wrap_content" android text="Hello World!" android:id="@+id/textView"/>
< Button
android:layout_width-"wrap_content" android layout_height="wrap_content" android:id="@+id/przycisk" android text= przycisk"/>
1-/4
Button przycisk = findViewByld(R.id.przycisk);
przycisk. setOnClickListener(v=> /
TextView textView = findViewByld(R.id.textView);
textiew.set Text( Kliknięcie zarejestrowane");
}):



<Spinner
android: layout_width-"wrap_content" android layout_height-"wrap_content" android id="@+id/spinnerPoryRoku* android entries-"@array/poryRoku"/>
< Button
android layout_width="wrap_content" android: layout_height="wrap_content" android:id="@+id/przyciskPoryRoku" android text="przyciskPoryRoku />
Button przyciskPoryRoku = findViewByld(R.id.przyciskPoryRoku);
Spinner spinnerPoryRoku = findViewByld(R.id.spinnerPoryRoku);
przyciskPoryRoku.setOnClickListener(v=> {
String poraRoku = spinnerPoryRoku.getSelecteditem() toString();
Toast.makeText(this, poraRoku, Toast. LENGTH_SHORT) show();
)):




<?xml version="1.0" encoding="utf-8"?>
<LinearLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp">

    <Spinner
        android:id="@+id/spinnerSeasons"
        android:layout_width="match_parent"
        android:layout_height="wrap_content" />

    <EditText
        android:id="@+id/editTextSeason"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="Wybrana pora roku"
        android:focusable="false"
        android:clickable="false"
        android:layout_marginTop="16dp"/>

</LinearLayout>


package com.example.zadanie3;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    Spinner spinner;
    EditText editText;

    String[] seasons = {"Wiosna", "Lato", "Jesień", "Zima"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        spinner = findViewById(R.id.spinnerSeasons);
        editText = findViewById(R.id.editTextSeason);

        // Adapter do Spinnera
        ArrayAdapter<String> adapter = new ArrayAdapter<>(
                this,
                android.R.layout.simple_spinner_item,
                seasons
        );

        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);

        // Listener (słuchacz)
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String selectedSeason = seasons[position];
                editText.setText(selectedSeason);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                editText.setText("");
            }
        });
    }
}
