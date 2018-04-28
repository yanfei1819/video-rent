package org.video.service.impl;

import org.springframework.stereotype.Service;
import org.video.dao.VideoDao;
import org.video.entity.Video;
import org.video.service.VideoService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/4/28.
 */
@Service
public class VideoServiceImpl implements VideoService {

    @Resource
    private VideoDao dao;

    @Override
    public List<Video> findAll() {
        return dao.findAll();
    }

    @Override
    public List<Video> findAllByCondition(String condition) {
        return dao.findAllByCondition(condition);
    }

    @Override
    public Video findById(int videoId) {
        return dao.findById(videoId);
    }

    @Override
    public int add(Video video) {
        return dao.add(video);
    }

    @Override
    public int update(Video video) {
        return dao.update(video);
    }

    @Override
    public int deleteById(int videoId) {
        return dao.deleteById(videoId);
    }
}
