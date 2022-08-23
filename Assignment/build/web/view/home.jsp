<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            table, th, td{
                text-align: center;
            }
        </style>
        <h3>Tên đơn vị: Công ty TNHH ABC</h3>
        <h1 style="text-align: center">BẢNG CHẤM CÔNG</h1>
        <h4 style="text-align: center">Tháng 8 năm 2022</h4>
        <jsp:useBean id="dt" class="Date.Datetime"/>
        <table border="1px">
            <tr>
                <th rowspan="2" style="background-color: greenyellow">Họ và tên</th>
<!--                <th rowspan="2" style="background-color: greenyellow">Chức vụ</th>-->
                <th colspan="31" style="background-color: greenyellow">Ngày trong tháng</th> 
                <th rowspan="2" style="background-color: greenyellow">Tổng cộng</th>
                <th colspan="3" style="background-color: greenyellow">Ngày nghỉ</th>
            </tr>
            <tr>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td
                        <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: yellow;"
                            </c:if>
                        >
                        <fmt:formatDate pattern = "dd" 
                                    value = "${d}" /> <br/>
                    <fmt:formatDate pattern = "EEE" 
                                    value = "${d}" />
                    </td>
                    </c:forEach>
                <td>Phép</td>
                <td>K phép</td>
                <td>Lễ</td>
            </tr>
            <c:forEach items="${requestScope.employees}" var="e">
                <tr>
                    <td>${e.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td 
                            <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: yellow;"
                            </c:if>
                                <c:if test="${dt.getDayOfMonth(d) eq 15}">
                                style="background-color: blueviolet;"
                            </c:if>    
                            >                           
                            <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    v
                                </c:if>    
                            </c:forEach>
                            <c:forEach items="${e.leaves}" var="l">
                                <c:if test="${e.getNumberOfWorkingDays() != -1 and dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                    CN
                                </c:if> 
                                <c:if test="${e.getNumberOfWorkingDays() != -1 and dt.getDayOfMonth(d) eq 15}">                             
                                    L
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                    <td>${e.getNumberOfWorkingDays()}</td>
                    <td>0</td>
                    <td></td>
                    <td>1</td>
                </tr>
                
            </c:forEach>
                

        </table>
        <h5>Ký hiệu chấm công:</h5>

    <table>
        <tr>
            <td>P</td>
            <td> Nghỉ có phép</td>           
        </tr>
        <tr>
            <td>K</td>
            <td>Nghỉ không lương</td>
        </tr>
        <tr>
            <td>Ô</td>
            <td>Ốm</td>
        </tr>
        <tr>
            <td>CÔ</td>
            <td>Con ốm</td>
        </tr>
        <tr>
            <td>TS</td>
            <td>Thai sản</td>
        </tr>
        <tr>
            <td>T</td>
            <td>Tai nạn</td>
        </tr>
        <tr>
            <td>1/2K</td>
            <td>Nghỉ nửa ngày không phép</td>
        </tr>
        <tr>
            <td>1/2P</td>
            <td>Nghỉ nửa ngày có phép</td>
        </tr>
        <tr>
            <td>CN</td>
            <td>Chủ nhật</td>
        </tr>
        <tr>
            <td>L</td>
            <td>Nghỉ lễ</td>
        </tr>
    </table>

    <table style="margin-left: 60%; border: none">
        <tr>
            <td style="margin-left: 50%; padding-right: 70px; border: none">Người chấm công</td>
            <td style="margin-left: 50%; padding-right: 70px; border: none">Phụ Trách bộ phận</td>
            <td style="margin-left: 50%; padding-right: 70px; border: none">Giám đốc</td>
        </tr>
    </table>
    <br/><br/><br/><br/>
    <h6 style="margin-left: 70%">Ngày 31 tháng 08 năm 2022</h6>
    </body>
</html>

