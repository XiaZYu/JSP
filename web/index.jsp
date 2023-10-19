<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 25/9/2023
  Time: 上午2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <div>
    <div class="top-box">
      <div class="top-name">
        <div>lisi</div>
      </div>
      <div class="top-nav">
        <svg t="1697540822054" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1060" width="16" height="16"><path d="M771.2 384c0-160-128-288-288-288s-288 128-288 288c0 108.8 57.6 201.6 147.2 249.6-121.6 48-214.4 153.6-240 288-3.2 16 6.4 35.2 25.6 38.4h6.4c16 0 28.8-9.6 32-25.6 28.8-150.4 160-259.2 313.6-262.4h6.4c153.6 0 284.8-131.2 284.8-288z m-512 0c0-124.8 99.2-224 224-224s224 99.2 224 224c0 121.6-99.2 220.8-220.8 224H476.8c-121.6-6.4-217.6-105.6-217.6-224zM704 672c0 19.2 12.8 32 32 32h160c19.2 0 32-12.8 32-32s-12.8-32-32-32h-160c-16 0-32 12.8-32 32zM896 764.8h-249.6-3.2-3.2c-19.2 0-32 12.8-32 32s12.8 32 32 32h256c19.2 0 32-12.8 32-32s-12.8-32-32-32zM896 892.8h-246.4-3.2-3.2c-19.2 0-32 12.8-32 32s12.8 32 32 32H896c19.2 0 32-12.8 32-32s-16-32-32-32z" fill="#666666" p-id="1061"></path></svg>
        <svg t="1697540722385" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="805" width="16" height="16"><path d="M447.325002 129.919978c-178.868807 0-323.872319 145.003512-323.872319 323.874365s145.003512 323.874365 323.872319 323.874365c178.870854 0 323.874365-145.003512 323.874365-323.874365S626.195855 129.919978 447.325002 129.919978zM447.325002 713.712071c-143.31915 0-259.915681-116.598578-259.915681-259.917728s116.596532-259.917728 259.915681-259.917728 259.917728 116.598578 259.917728 259.917728S590.643128 713.712071 447.325002 713.712071z" fill="#040000" p-id="806"></path><path d="M891.573945 840.061734 748.236376 696.699606c-13.43601 16.625656-28.371164 31.91385-44.338834 46.099944l142.458549 142.481062c6.246261 6.246261 14.427594 9.368368 22.60995 9.368368s16.363689-3.123131 22.60995-9.368368C904.065444 872.789113 904.065444 852.553233 891.573945 840.061734z" fill="#040000" p-id="807"></path></svg>
      </div>
    </div>
    <div class="big-box">
      <div class="left-box">
        <c:forEach items="User">

        </c:forEach>
      </div>
      <div class="right-box">
        <img src="./resource/color.png" />
        <p>lisi</p>
        <div style="display: flex">
          <div style="flex: 1">
            <p>发帖数</p>
            <p>32</p>
          </div>
          <div style="flex: 1">
            <p>学习天数</p>
            <p>55</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  </body>
</html>
<style>
  body{
    margin: 0px;
    padding: 0px;
  }
  .top-box{
    height: 40px;
    width: 100%;
    background-color: rgba(229, 229, 229);
    display: flex;
    align-items: center;
  }
  .big-box{
    height: 100%;
    width: 100%;
    display: flex;
    background-color: #F5F7F9;
  }
  .left-box{
    height: 98%;
    flex:2;
    margin: 12px 10px 0 140px;
    border: 2px solid #D7DDE4;
    float: left;
  }
  .right-box{
    height: 50%;
    flex:0.6;
    margin: 12px 140px 0 10px;
    background-color: #E3E8EE;
    border: 2px solid #D7DDE4;
    border-radius: 0  24px 24px 24px;
    float: left;
  }
  .right-box img{
    border-radius: 50%;
    width: 120px;
    height: 120px;
    margin: 30px 0 0 80px;
  }
  .right-box p{
    text-align: center;
    font-size: 20pt;
    font-family: Microsoft Yahei;
    margin: 20px 0 10px 0;
  }
  .top-name{
    flex: 1;
    margin-left: 40px;
    font-size: 20pt;
    font-family: Microsoft Yahei;
  }
  .top-nav{
    flex: 1;
  }
  .icon{
    float: right;
    height: 100%;
    width: 35px;
    margin-right: 65px;
  }
</style>