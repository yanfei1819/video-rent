package org.video.util;

/**
 * Created by shiyanfei on 2018-04-27.
 */
public class Util {

    public static String getMeun(String type){

        if("userManger".equals(type)){
            return "userManger";
        }else if("goodsManger".equals(type)){

            return "homewear";
        }else if("orderManger".equals(type)){
            return "order";
        }else{
            return "";
        }
    }
}
