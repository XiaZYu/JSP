<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 24/10/2023
  Time: 下午3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>PDF Reader</title>
    <script type="text/javascript" src="./resource/tailwindcss.js"></script>
    <script type="text/javascript" src="./resource/pdf.js/build/pdf.js"></script>
</head>
<body>
<div>
    <form action="Article" method="get" id="form">
        <input type="hidden" id="event" name="id">
    </form>
    <script>
        let id = <%=request.getParameter("id")%>;
        if (id != null) {
            window.onload = function () {
                document.getElementById("event").value = <%=request.getParameter("id")%>
                    document.getElementById("form").submit();
            }
        }
    </script>

    <c:import url="header.jsp"></c:import>
    <main class="py-4">
        <div class="container mx-auto">
            <div class="flex">
                <div class="w-1/4 border-4 border-gray-600">
                    <div class="h-2/3 divide-y-4">
                        <img src="${ArticleById[0].photo}" class="h-48 w-1/2 m-auto"/>
                        <div class="h-24 text-center">
                            <span class="h-1/3 w-full block">${ArticleById[0].title}</span>
                            <span class="h-1/3 w-full block">${ArticleById[0].author}/${ArticleById[0].publisher}</span>
                            简介：
                            <span class="h-1/3 w-full block">${ArticleById[0].describe}</span>
                        </div>
                    </div>
                    <div class="h-1/3 border-4 border-red-300">

                    </div>
                </div>
                <div class="w-3/4 grid justify-items-center border-4 border-gray-800" id="pdf-container"></div>
            </div>
        </div>
    </main>
</div>
</body>
<script>
    class PDFReader {
        constructor(config) {
            if (!config.container) {
                throw new Error('container is required.');
            }
            this.container = document.getElementById(config.container);
            this.pdf = null;
            this.canvas = null;
            this.currentPage = 1;
            this.currentPageView = null;
            this.totalPage = 0;
            this.totalPageView = null;
            this.prevBtn = null;
            this.nextBtn = null;
            this.scale = 1;
            this.magBtn = null;
            this.shriBtn = null;
            this._init()
        }

        _init() {
            this._initFileSelect();
            this._initActions();
            this._initPage();
        }

        // 初始化文件选择器
        _initFileSelect() {
            pdfjsLib.getDocument('${ArticleById[0].content_pdf}').promise.then(res => {
                console.log('PDF loaded');
                this.pdf = res;
                this.totalPage = this.pdf.numPages;
                this.totalPageView.innerText = '总页数：' + this.totalPage;
                this.currentPage = 1;
                this.currentPageView.innerText = '当前页数：' + this.currentPage;
                this.render();
            });
        }

        _initPage() {
            const pageCanvas = document.createElement('canvas');
            pageCanvas.classList.add('mb-4', 'relative', 'bottom-5');
            this.container.appendChild(pageCanvas);
            this.canvas = pageCanvas;
        }

        _initActions() {
            const actionsBox = document.createElement('div');
            actionsBox.classList.add('flex', 'gap-2', 'items-center', 'mt-4', 'relative', 'z-10', 'opacity-0', 'hover:opacity-100', 'top-5');


            const totalPageView = document.createElement('span');
            this.totalPageView = totalPageView;
            totalPageView.innerText = '总页数：' + this.totalPage;


            const currentPageView = document.createElement('span');
            currentPageView.innerText = '当前页数：' + this.currentPage;
            this.currentPageView = currentPageView;


            const prevBtn = document.createElement('button');
            this.prevBtn = prevBtn;
            prevBtn.innerText = '上一页';
            prevBtn.classList.add('bg-blue-500', 'hover:bg-blue-700', 'text-white', 'font-bold', 'py-2', 'px-4', 'rounded');
            prevBtn.addEventListener('click', () => {
                if (this.currentPage === 1) {
                    return;
                }
                this.changePage(this.currentPage - 1);
            });


            const nextBtn = document.createElement('button');
            this.nextBtn = nextBtn;
            nextBtn.innerText = '下一页';
            nextBtn.classList.add('bg-blue-500', 'hover:bg-blue-700', 'text-white', 'font-bold', 'py-2', 'px-4', 'rounded');
            nextBtn.addEventListener('click', () => {
                if (this.currentPage === this.totalPage) {
                    return;
                }
                this.changePage(this.currentPage + 1);
            });

            const magBtn = document.createElement('button');
            this.magBtn = magBtn;
            magBtn.innerText = '放大';
            magBtn.classList.add('bg-blue-500', 'hover:bg-blue-700', 'text-white', 'font-bold', 'py-2', 'px-4', 'rounded');
            magBtn.addEventListener('click', () => {
                if (this.scale > 2) {
                    return;
                }
                this.changeScale(this.scale + 0.1);
            });

            const shriBtn = document.createElement('button');
            this.shriBtn = shriBtn;
            shriBtn.innerText = '缩小';
            shriBtn.classList.add('bg-blue-500', 'hover:bg-blue-700', 'text-white', 'font-bold', 'py-2', 'px-4', 'rounded');
            shriBtn.addEventListener('click', () => {
                if (this.scale === 1) {
                    return;
                }
                this.changeScale(this.scale - 0.1);
            });

            actionsBox.appendChild(totalPageView);
            actionsBox.appendChild(currentPageView);
            actionsBox.appendChild(prevBtn);
            actionsBox.appendChild(nextBtn);
            actionsBox.appendChild(magBtn);
            actionsBox.appendChild(shriBtn);
            this.container.appendChild(actionsBox);
        }

        render() {
            const currentPage = this.currentPage
            this.pdf.getPage(currentPage).then(page => {
                const scale = this.scale;
                const viewport = page.getViewport({scale: scale});
                const canvas = this.canvas;
                const context = canvas.getContext('2d');
                canvas.height = viewport.height;
                canvas.width = viewport.width;
                const renderContext = {
                    canvasContext: context,
                    viewport: viewport
                };
                page.render(renderContext);
            });

        }

        changePage(page) {
            this.currentPage = page;
            this.currentPageView.innerText = '当前页数：' + this.currentPage;
            this.render();
        }

        changeScale(scale) {
            this.scale = scale;
            this.render();
        }
    }

    const pdfReader = new PDFReader({
        container: 'pdf-container'
    });
</script>
</html>
