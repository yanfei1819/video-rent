package org.video.service;

import org.apache.ibatis.annotations.Param;
import org.video.entity.Video;

import java.util.List;

/**
 * Created by Administrator on 2018/4/28.
 */
public interface VideoService {

    List<Video> findAll();
    List<Video> findAllByCondition(String condition);

    Video findById(@Param("videoId") int videoId);

    int add(Video video);

    int update(Video video);

    int deleteById(int videoId);
}
