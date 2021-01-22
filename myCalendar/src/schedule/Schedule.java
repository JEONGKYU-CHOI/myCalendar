package schedule;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

public class Schedule {
	
	private int scheduleId;
	private int userId;
	private String scheduleTitle;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm", timezone="Asia/Seoul")
	private LocalDateTime start;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm", timezone="Asia/Seoul")
	private LocalDateTime end;
	private String color;
	
	public Schedule() {	}

	public Schedule(int scheduleId, int userId, String scheduleTitle, LocalDateTime start, LocalDateTime end,
			String color) {
		this.scheduleId = scheduleId;
		this.userId = userId;
		this.scheduleTitle = scheduleTitle;
		this.start = start;
		this.end = end;
		this.color = color;
	}

	public int getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	public LocalDateTime getStart() {
		return start;
	}

	public void setStart(LocalDateTime start) {
		this.start = start;
	}

	public LocalDateTime getEnd() {
		return end;
	}

	public void setEnd(LocalDateTime end) {
		this.end = end;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "Schedule [scheduleId=" + scheduleId + ", userId=" + userId + ", scheduleTitle=" + scheduleTitle
				+ ", start=" + start + ", end=" + end + ", color=" + color + "]";
	}
	
	
	
}
