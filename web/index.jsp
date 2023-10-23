<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 25/9/2023
  Time: 上午2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
    <script type="text/javascript" src="./resource/tailwindcss.js"></script>
</head>
<body class="bg-sky-100">
<form action="Article" method="post" id="event" value="find"></form>
<c:if test="${Article==null}">
    <script>
        window.onload = function () {
            document.getElementById("event").submit();
        }
    </script>
</c:if>
<div>
    <header class="flex items-center h-16 bg-sky-300 text-white">
        <div class="container mx-auto">
            <div class="flex items-center justify-between py-2 px-8">
                <a href="/" class="brand text-2xl">
                    研学
                </a>
                <div class="flex items-center gap-4">
                    <button class="text-md hover:text-blue-500">
                        <svg class="h-5 w-5" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
                             width="16" height="16" fill="currentColor">
                            <path d="M447.325002 129.919978c-178.868807 0-323.872319 145.003512-323.872319 323.874365s145.003512 323.874365 323.872319 323.874365c178.870854 0 323.874365-145.003512 323.874365-323.874365S626.195855 129.919978 447.325002 129.919978zM447.325002 713.712071c-143.31915 0-259.915681-116.598578-259.915681-259.917728s116.596532-259.917728 259.915681-259.917728 259.917728 116.598578 259.917728 259.917728S590.643128 713.712071 447.325002 713.712071z"></path>
                            <path d="M891.573945 840.061734 748.236376 696.699606c-13.43601 16.625656-28.371164 31.91385-44.338834 46.099944l142.458549 142.481062c6.246261 6.246261 14.427594 9.368368 22.60995 9.368368s16.363689-3.123131 22.60995-9.368368C904.065444 872.789113 904.065444 852.553233 891.573945 840.061734z"></path>
                        </svg>
                    </button>
                    <button class="text-md hover:text-blue-500">
                        <svg class="h-5 w-5" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"
                             width="16" height="16" fill="currentColor">
                            <path d="M771.2 384c0-160-128-288-288-288s-288 128-288 288c0 108.8 57.6 201.6 147.2 249.6-121.6 48-214.4 153.6-240 288-3.2 16 6.4 35.2 25.6 38.4h6.4c16 0 28.8-9.6 32-25.6 28.8-150.4 160-259.2 313.6-262.4h6.4c153.6 0 284.8-131.2 284.8-288z m-512 0c0-124.8 99.2-224 224-224s224 99.2 224 224c0 121.6-99.2 220.8-220.8 224H476.8c-121.6-6.4-217.6-105.6-217.6-224zM704 672c0 19.2 12.8 32 32 32h160c19.2 0 32-12.8 32-32s-12.8-32-32-32h-160c-16 0-32 12.8-32 32zM896 764.8h-249.6-3.2-3.2c-19.2 0-32 12.8-32 32s12.8 32 32 32h256c19.2 0 32-12.8 32-32s-12.8-32-32-32zM896 892.8h-246.4-3.2-3.2c-19.2 0-32 12.8-32 32s12.8 32 32 32H896c19.2 0 32-12.8 32-32s-16-32-32-32z"></path>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </header>
    <main class="py-4">
        <div class="container mx-auto">
            <div class="flex">
                <div class="w-2/3">
                    <h5 class="text-4xl mx-9 font-medium">精选图书</h5>
                    <c:forEach items="${Article}" var="a">
                        <div class="container mx-auto h-36 w-11/12 m-3.5">
                            <div class="flex h-full">
                                <img class="flex-auto w-px h-full" src="${a.photo}"/>
                                <span class="flex flex-col flex-auto m-1.5 w-2/5">
                                    <span class="m-1.5 h-1/3">${a.title}</span>
                                    <span class="m-1.5 h-1/3">${a.author}/${a.publisher}</span>
                                    <span class="m-1.5 h-1/3 flex w-full divide-x">
                                        <div class="w-1/2 text-center">
                                           <svg t="1698030823163" class="m-0 m-auto" viewBox="0 0 1024 1024" version="1.1"
                                                xmlns="http://www.w3.org/2000/svg" width="20" height="20"><path
                                                   d="M639.57 383.6h206.36a64.1 64.1 0 0 1 62.2 79.65L812 847.88a64.1 64.1 0 0 1-62.19 48.56H190.83a64.11 64.11 0 0 1-64.11-64.11V511.81a64.11 64.11 0 0 1 64.11-64.11H319l118.19-295.38a40 40 0 0 1 37.14-25.15h101.13a64.11 64.11 0 0 1 64.11 64.11z m-256.42 76.45v372.28h366.63l96.15-384.63H575.46V191.28h-84.81zM319 511.81H190.83v320.52H319z"></path>
                                           </svg>
                                            333
                                        </div>
                                        <div class="w-1/2 text-center">
                                             <svg t="1698031647902" class="m-0 m-auto" viewBox="0 0 1024 1024" version="1.1"
                                                  xmlns="http://www.w3.org/2000/svg" width="20" height="20"><path
                                                     d="M512 64c259.2 0 469.333 200.576 469.333 448S771.2 960 512 960a484.48 484.48 0 0 1-232.725-58.88L162.88 951.765a42.667 42.667 0 0 1-58.517-49.002l29.76-125.014C76.629 703.403 42.667 611.477 42.667 512 42.667 264.576 252.8 64 512 64z m0 64c-224.512 0-405.333 172.587-405.333 384 0 79.573 25.557 155.435 72.554 219.285l5.526 7.318 18.709 24.192-26.965 113.237 105.984-46.08 27.477 15.019C370.859 878.229 439.979 896 512 896c224.512 0 405.333-172.587 405.333-384S736.512 128 512 128zM354.304 469.333a42.667 42.667 0 1 1 0 85.334 42.667 42.667 0 0 1 0-85.334z m159.019 0a42.667 42.667 0 1 1 0 85.334 42.667 42.667 0 0 1 0-85.334z m158.997 0a42.667 42.667 0 1 1 0 85.334 42.667 42.667 0 0 1 0-85.334z"
                                             ></path></svg>
                                                333
                                        </div>
                                    </span>
                                </span>
                                <div class="flex-auto">
                                        ${a.describe}
                                </div>
                            </div>
                        </div>
                        <p style=" border-bottom: 1px dashed #DDDDDD;" class="mr-9 mx-9"></p>
                    </c:forEach>
                </div>
                <div class="w-1/4">
                    <div class="py-6 flex flex-col gap-4 items-center border rounded-xl bg-sky-200">
                        <img class="rounded-full w-12 h-12 mb-4" src="${User.avatar}"/>
                        <p>${User.username}</p>
                        <div class="flex w-full divide-x">
                            <div class="w-1/2 text-center">
                                <p>发帖数</p>
                                <p>${User.article_numb}</p>
                            </div>
                            <div class="w-1/2 text-center">
                                <p>学习天数</p>
                                <p>${User.day}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>
<script>
</script>