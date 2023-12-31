<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 24/10/2023
  Time: 下午6:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
</head>
<body>
<header class="flex items-center h-16 bg-sky-300 text-white">
    <div class="container mx-auto">
        <div class="flex items-center justify-between py-2 px-8">
            <a href="/" class="brand text-2xl">
                研学
            </a>
            <div class="flex items-center gap-4">
                <%--        <button class="text-md hover:text-blue-500">--%>
                <%--          <svg class="h-5 w-5" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"--%>
                <%--               width="16" height="16" fill="currentColor">--%>
                <%--            <path d="M447.325002 129.919978c-178.868807 0-323.872319 145.003512-323.872319 323.874365s145.003512 323.874365 323.872319 323.874365c178.870854 0 323.874365-145.003512 323.874365-323.874365S626.195855 129.919978 447.325002 129.919978zM447.325002 713.712071c-143.31915 0-259.915681-116.598578-259.915681-259.917728s116.596532-259.917728 259.915681-259.917728 259.917728 116.598578 259.917728 259.917728S590.643128 713.712071 447.325002 713.712071z"></path>--%>
                <%--            <path d="M891.573945 840.061734 748.236376 696.699606c-13.43601 16.625656-28.371164 31.91385-44.338834 46.099944l142.458549 142.481062c6.246261 6.246261 14.427594 9.368368 22.60995 9.368368s16.363689-3.123131 22.60995-9.368368C904.065444 872.789113 904.065444 852.553233 891.573945 840.061734z"></path>--%>
                <%--          </svg>--%>
                <%--        </button>--%>
                <%-- 我的 --%>
                <div class="relative group">
                    <button class="text-md hover:text-blue-500">
                        <svg class="h-5 w-5" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"
                             width="16" height="16" fill="currentColor">
                            <path d="M771.2 384c0-160-128-288-288-288s-288 128-288 288c0 108.8 57.6 201.6 147.2 249.6-121.6 48-214.4 153.6-240 288-3.2 16 6.4 35.2 25.6 38.4h6.4c16 0 28.8-9.6 32-25.6 28.8-150.4 160-259.2 313.6-262.4h6.4c153.6 0 284.8-131.2 284.8-288z m-512 0c0-124.8 99.2-224 224-224s224 99.2 224 224c0 121.6-99.2 220.8-220.8 224H476.8c-121.6-6.4-217.6-105.6-217.6-224zM704 672c0 19.2 12.8 32 32 32h160c19.2 0 32-12.8 32-32s-12.8-32-32-32h-160c-16 0-32 12.8-32 32zM896 764.8h-249.6-3.2-3.2c-19.2 0-32 12.8-32 32s12.8 32 32 32h256c19.2 0 32-12.8 32-32s-12.8-32-32-32zM896 892.8h-246.4-3.2-3.2c-19.2 0-32 12.8-32 32s12.8 32 32 32H896c19.2 0 32-12.8 32-32s-16-32-32-32z"></path>
                        </svg>
                    </button>
                    <div class="absolute top-10 hidden group-hover:block p-4 bg-white border rounded  text-black divide-y-2 left-[-90px] w-64 ">
                            <p>我的id：${User.id}</p>
                            <p>用户名：${User.username}</p>
                            <p>邮箱:${User.email}</p>
                            <p>手机号:${User.phone}</p>
                    </div>
                </div>
                <button class="text-md hover:text-blue-500" onclick="window.location='logout.jsp'">
                    <svg class="h-5 w-5" viewBox="0 0 1024 1024" version="1.1"
                         xmlns="http://www.w3.org/2000/svg" width="16" height="16">
                        <path d="M556.8 512L832 236.8c12.8-12.8 12.8-32 0-44.8-12.8-12.8-32-12.8-44.8 0L512 467.2l-275.2-277.333333c-12.8-12.8-32-12.8-44.8 0-12.8 12.8-12.8 32 0 44.8l275.2 277.333333-277.333333 275.2c-12.8 12.8-12.8 32 0 44.8 6.4 6.4 14.933333 8.533333 23.466666 8.533333s17.066667-2.133333 23.466667-8.533333L512 556.8 787.2 832c6.4 6.4 14.933333 8.533333 23.466667 8.533333s17.066667-2.133333 23.466666-8.533333c12.8-12.8 12.8-32 0-44.8L556.8 512z"
                              fill="currentColor"></path>
                    </svg>
                </button>

            </div>
        </div>
    </div>
</header>
</body>
</html>
