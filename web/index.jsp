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
    <title>首页</title>
    <script type="text/javascript" src="./resource/tailwindcss.js"></script>
</head>
<body class="bg-sky-100">
<form action="Article" method="get" id="form"></form>
<c:if test="${Article==null}">
    <script>
        window.onload = function () {
            document.getElementById("form").submit();
        }
    </script>
</c:if>
<div>
    <c:import url="header.jsp"></c:import>
    <main class="py-4">
        <div class="container mx-auto">
            <div class="flex">
                <div class="w-2/3">
                    <h5 class="text-4xl mx-9 font-medium">精选图书</h5>
                    <c:forEach items="${Article}" var="a" varStatus="var">
                        <div class="container mx-auto h-36 w-11/12 m-3.5">
                            <div class="flex h-full">
                                <img class="w-1/5 h-full" src="${a.photo}"/>
                                <span class="flex flex-col flex-auto m-1.5 w-3/5">
                                    <span class="m-1.5 h-1/3"  onclick="window.location='findbyid.jsp?id=${a.article_id}'">${a.title}</span>
                                    <span class="m-1.5 h-1/3">${a.author}/${a.publisher}</span>
                                    <span class="m-1.5 h-1/3 flex w-full divide-x">
                                        <div class="w-1/2 text-center">
                                           <svg t="1698030823163" class="m-0 m-auto" viewBox="0 0 1024 1024"
                                                version="1.1"
                                                xmlns="http://www.w3.org/2000/svg" width="20" height="20"><path
                                                   d="M639.57 383.6h206.36a64.1 64.1 0 0 1 62.2 79.65L812 847.88a64.1 64.1 0 0 1-62.19 48.56H190.83a64.11 64.11 0 0 1-64.11-64.11V511.81a64.11 64.11 0 0 1 64.11-64.11H319l118.19-295.38a40 40 0 0 1 37.14-25.15h101.13a64.11 64.11 0 0 1 64.11 64.11z m-256.42 76.45v372.28h366.63l96.15-384.63H575.46V191.28h-84.81zM319 511.81H190.83v320.52H319z"></path>
                                           </svg>
                                            ${a.likes}
                                        </div>
                                        <div class="w-1/2 text-center">
                                             <svg t="1698031647902" class="m-0 m-auto" viewBox="0 0 1024 1024"
                                                  version="1.1"
                                                  xmlns="http://www.w3.org/2000/svg" width="20" height="20"><path
                                                     d="M512 64c259.2 0 469.333 200.576 469.333 448S771.2 960 512 960a484.48 484.48 0 0 1-232.725-58.88L162.88 951.765a42.667 42.667 0 0 1-58.517-49.002l29.76-125.014C76.629 703.403 42.667 611.477 42.667 512 42.667 264.576 252.8 64 512 64z m0 64c-224.512 0-405.333 172.587-405.333 384 0 79.573 25.557 155.435 72.554 219.285l5.526 7.318 18.709 24.192-26.965 113.237 105.984-46.08 27.477 15.019C370.859 878.229 439.979 896 512 896c224.512 0 405.333-172.587 405.333-384S736.512 128 512 128zM354.304 469.333a42.667 42.667 0 1 1 0 85.334 42.667 42.667 0 0 1 0-85.334z m159.019 0a42.667 42.667 0 1 1 0 85.334 42.667 42.667 0 0 1 0-85.334z m158.997 0a42.667 42.667 0 1 1 0 85.334 42.667 42.667 0 0 1 0-85.334z"
                                             ></path></svg>
                                                333
                                        </div>
                                    </span>
                                </span>
                                <div class="w-1/5">
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
                                <a href="/User?event=addDay&id=${User.id}&time=${User.daytime}">${User.day}</a>
                            </div>
                            <c:if test="${messageModel.msg != null}">
                                <script>
                                    window.alert("${messageModel.msg}")
                                </script>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>