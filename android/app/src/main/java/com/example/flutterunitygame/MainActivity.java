package com.example.flutterunitygame;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    this.getWindow().setStatusBarColor(android.graphics.Color.TRANSPARENT); //para que la barra de estado sea transparente
  }
}
