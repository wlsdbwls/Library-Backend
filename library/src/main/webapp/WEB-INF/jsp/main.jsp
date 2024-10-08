<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/popup.css"> <!-- 팝업 스타일 추가 -->
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>

    <!-- 페이지 콘텐츠 -->
    <div class="content">
        <!-- 추천 도서 섹션 -->
        <section id="recommendations">
            <h2>추천 도서</h2>
            <div class="books">
                <a href="path/to/book-detail1.html" class="book-item">
                    <img src="${pageContext.request.contextPath}/resources/images/book1.jpg" alt="추천 도서 1">
                    <p>도서 제목 1</p>
                </a>
                <a href="path/to/book-detail2.html" class="book-item">
                    <img src="${pageContext.request.contextPath}/resources/images/book2.jpg" alt="추천 도서 2">
                    <p>도서 제목 2</p>
                </a>
            </div>
        </section>

        <!-- 버튼으로 콘텐츠 토글 -->
        <div class="toggle-buttons">
            <button onclick="showSection('new-arrivals')">새로 들어온 도서</button>
            <button onclick="showSection('most-borrowed')">대출이 많은 도서</button>
        </div>

        <!-- 새로 들어온 도서 섹션 -->
        <section id="new-arrivals">
            <h2>새로 들어온 도서</h2>
            <div class="books">
                <a href="path/to/book-detail3.html" class="book-item">
                    <img src="${pageContext.request.contextPath}/resources/images/book3.jpg" alt="새로 들어온 도서 1">
                    <p>도서 제목 1</p>
                </a>
                <a href="path/to/book-detail4.html" class="book-item">
                    <img src="${pageContext.request.contextPath}/resources/images/book4.jpg" alt="새로 들어온 도서 2">
                    <p>도서 제목 2</p>
                </a>
            </div>
        </section>

        <!-- 대출이 많은 도서 섹션 -->
        <section id="most-borrowed" class="hidden">
            <h2>대출이 많은 도서</h2>
            <div class="books">
                <a href="path/to/book-detail5.html" class="book-item">
                    <img src="${pageContext.request.contextPath}/resources/images/book5.jpg" alt="대출이 많은 도서 1">
                    <p>도서 제목 1</p>
                </a>
                <a href="path/to/book-detail6.html" class="book-item">
                    <img src="${pageContext.request.contextPath}/resources/images/book6.jpg" alt="대출이 많은 도서 2">
                    <p>도서 제목 2</p>
                </a>
            </div>
        </section>
    </div>

    <!-- 푸터 영역 -->
    <%@ include file="/WEB-INF/jsp/footer.jsp" %>

    <!-- 팝업 영역 -->
    <div id="popup" class="popup">
        <h2 id="popupTitle"></h2>
        <p id="popupMessage"></p>
        <button onclick="closePopup()">확인</button>
    </div>
    <div id="overlay" class="overlay"></div>

    <script>
        function showSection(sectionId) {
            // 모든 섹션을 숨기기
            document.querySelectorAll('.content > section:not(#recommendations)').forEach(section => {
                section.classList.add('hidden');
            });

            // 클릭된 섹션만 보이게 하기
            const sectionToShow = document.getElementById(sectionId);
            if (sectionToShow) {
                sectionToShow.classList.remove('hidden');
            }
        }

        // 기본적으로 추천 도서와 새로 들어온 도서가 보이도록 설정
        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById('recommendations').classList.remove('hidden');
            document.getElementById('new-arrivals').classList.remove('hidden');
            document.getElementById('most-borrowed').classList.add('hidden');

            // JSP에서 전달된 메시지를 받음
            <% if (request.getAttribute("message") != null) { %>
                showPopup('대출 성공', '<%= request.getAttribute("message") %>');
            <% } else if (request.getAttribute("errorMessage") != null) { %>
                showPopup('대출 실패', '<%= request.getAttribute("errorMessage") %>');
            <% } %>
        });

        // 팝업 표시 함수
        function showPopup(title, message) {
            document.getElementById('popupTitle').innerText = title;
            document.getElementById('popupMessage').innerText = message;
            document.getElementById('popup').classList.add('show');
            document.getElementById('overlay').classList.add('show');
        }

        // 팝업 닫기 함수
        function closePopup() {
            document.getElementById('popup').classList.remove('show');
            document.getElementById('overlay').classList.remove('show');
            window.location.href = '${pageContext.request.contextPath}/main';  // 홈으로 리다이렉션
        }
    </script>
</body>
</html>
