package org.video.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.video.entity.Video;
import org.video.service.VideoService;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

/**
 * Created by Administrator on 2018/4/28.
 */
@Controller
@RequestMapping("/video")
public class VideoController {

    @Autowired
    private VideoService  service;


    @ResponseBody
    @RequestMapping(value = "/findAll",method = RequestMethod.GET)
    public List<Video> findAll(){
        List<Video> list = service.findAll();
        return service.findAll();
    }

    @ResponseBody
    @RequestMapping(value = "/findAllByCondition",method = RequestMethod.GET)
    public  List<Video> findAllByCondition(String condition){
        String condition2 = "";
        try {
            condition2 = URLDecoder.decode(condition,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<Video>  list = service.findAllByCondition(condition2);
        return service.findAllByCondition(condition2);
    }

    @ResponseBody
    @RequestMapping(value = "/findVideoById",method = RequestMethod.GET)
    public Video findVideoById(int videoId){
        return service.findById(videoId);
    }

    @ResponseBody
    @RequestMapping(value = "/addVideo",method = RequestMethod.POST)
    public int addVideo(Video video){
        return service.add(video);
    }

    @ResponseBody
    @RequestMapping(value = "/updateVideo",method = RequestMethod.POST)
    public int updateVideo(Video video){
        return service.update(video);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteVideo",method = RequestMethod.GET)
    public int deleteVideo(int videoId){
        return service.deleteById(videoId);
    }

}
