package org.video.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.video.entity.User;
import org.video.entity.Video;

import java.util.List;

/**
 * Created by Administrator on 2018/4/28.
 */
@Repository(value = "VideoDao")
@Mapper
public interface VideoDao {

    List<Video> findAll();

    List<Video> findAllByCondition(@Param("condition")String condition);

    Video findById(@Param("videoId") int videoId);

    int add(Video video);

    int update(Video video);

    int deleteById(int videoId);
}
