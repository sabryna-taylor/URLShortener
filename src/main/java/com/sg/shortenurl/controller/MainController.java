/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.shortenurl.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.net.URL;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Sabryna
 */
@Controller
public class MainController {

    public static final String GOOGLE_URL_SHORTENER = "https://www.googleapis.com/urlshortener/v1/url?key=";
    public static final String API_KEY = "AIzaSyB83it73_y1Igt3nSU7Twga5-B0vcLJe1s";

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String displayHomePage(Model model) {
        return "index";
    }

    @RequestMapping(value = "/shortenUrl", method = RequestMethod.POST)
    public String getUrlAndShorten(Model model, HttpServletRequest request) {
        String longURL = request.getParameter("link");
        String data = "{\"longUrl\": \"" + longURL + "\"}";
        try {
            URL url = new URL(GOOGLE_URL_SHORTENER + API_KEY);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("User-Agent", "toolbar");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");

            OutputStreamWriter output = new OutputStreamWriter(connection.getOutputStream());
            output.write(data);
            output.flush();

            BufferedReader response = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String result = "";
            String line;
            while ((line = response.readLine()) != null) {
                result += line;
            }

            ObjectMapper mapper = new ObjectMapper();
            Map map = mapper.readValue(result, Map.class);

            output.close();
            response.close();
            String shortURL = (String) map.get("id");
            
            model.addAttribute("shortURL", shortURL);
            return "index";

        } catch (Exception e) {
            model.addAttribute("view-shortened-url", "We are sorry an error has occured"
                    + e.getMessage());
            return "redirect:/";
        }

    }
}

/*
String longURL = request.getParameter("shortenUrl");
        
        String map = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder tinyUrl = new StringBuilder();
        while (id > 0) {
            tinyUrl.append(map.charAt(id % 62));
            id /= 62;
        }
        return tinyUrl.reverse().toString();

        //URL googleAPI = new URL("https://www.googleapis.com/auth/urlshortener?key=");
        // model.addAttribute(); add shortened URL here
        return "index";
 */
