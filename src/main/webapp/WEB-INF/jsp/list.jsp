<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <title>秒杀列表页</title>
    <%@include file="common/head.jsp"%>
  </head>
  <body>
    <div class="container">
      <div class="panel panel-default">
        <div class="panel panel-heading text-center">
          <h2>秒杀列表</h2>
        </div>
        <div class="panel panel-body">
          <table class="table table-hover">
            <tr>
              <th>名称</th>
              <th>库存</th>
              <th>开始时间</th>
              <th>结束时间</th>
              <th>创建时间</th>
              <th>详情页</th>
            </tr>

            <c:forEach var="sk" items="${list}">
            <tr>
                <td>${sk.name}</td>
                <td>${sk.number}</td>
                <td>
                  <fmt:formatDate value="${sk.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>
                  <fmt:formatDate value="${sk.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>
                  <fmt:formatDate value="${sk.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>
                  <a href="/seckill/${sk.seckillId}/detail" class="btn btn-info" target="_blank">详情</a>
                </td>
            </tr>
            </c:forEach>
          </table>
        </div>
      </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  </body>
</html>