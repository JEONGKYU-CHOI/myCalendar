<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	var title="${schedule.scheduleTitle}";
	var start="${schedule.start}";
	var end="${schedule.end}";
	
	var startDate=start.replace("T", "-");
	var startDateRs=startDate.replace(":", "-");
	var endDate=end.replace("T", "-");	
	var endDateRs=endDate.replace(":", "-");
	var startDateArr=startDateRs.split('-');
	var endDateArr=endDateRs.split('-');
	var startDateCompare=new Date(startDateArr[0], (startDateArr[1])-1, startDateArr[2], startDateArr[3], startDateArr[4], 0, 0, 0);
	var endDateCompare=new Date(endDateArr[0], (endDateArr[1])-1, endDateArr[2], endDateArr[3], endDateArr[4], 0, 0, 0);
	
	var startDateFinal=startDateCompare.getFullYear()+"년 "+(startDateCompare.getMonth()+1)+"월 "+startDateCompare.getDate()+"일 "+startDateCompare.getHours()+"시 "+startDateCompare.getMinutes()+"분";
	var endDateFinal=endDateCompare.getFullYear()+"년 "+(endDateCompare.getMonth()+1)+"월 "+endDateCompare.getDate()+"일 "+endDateCompare.getHours()+"시 "+endDateCompare.getMinutes()+"분";

	var text="일정 이름: "+title+", 시작 시간: "+startDateFinal+", 종료 시간: "+endDateFinal;
</script>
</head>
<body>
	<h3>나에게 보내시려면 아래의 아이콘을 클릭해 주세요.</h3>
	<a href="javascript:;" id="kakao-link-btn">
	<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA3MTRfMjI5%2FMDAxNTk0NzI5NzcyMDMz.X2YVWOeE6fwrOSnUiARthmNM9a4mfRnneetw1hTtyHIg.1Tqwf_4qgAqc1v3jE6xbzobcrV3X6yN8JVUVwjlRGkog.JPEG.xuni1021%2F%25C4%25AB%25C4%25AB%25BF%25C0%25C5%25E5-%25B7%25CE%25B0%25ED-ai-3.jpg&type=sc960_832" width="70px" />
	</a><br>
</body>
<script type="text/javascript">
  //<![CDATA[
    // JavaScript 키 설정
    Kakao.init('c6984e5b896e9aec87174fe553196f6f');
    // 카카오링크 버튼 생성
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'text',
      text: text,
      link: {
            webUrl: "http://localhost:8080/testCalendar/"
      },
      buttons: [
        {
          title: '사이트 열기',
          link: {
            webUrl: "http://localhost:8080/testCalendar/"
          }
        }  
      ]
    });
  //]]>
</script>
</html>