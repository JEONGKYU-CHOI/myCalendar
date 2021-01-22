package schedule;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface ScheduleMapper {
	
	@Select("select schedule_id, user_id, schedule_title, start, end, color from schedule where user_id=#{num}")
	public List<Schedule> selectAll(int num);
	
	@Select("select schedule_id, user_id, schedule_title, start, end, color from schedule where schedule_id=#{id}")
	public Schedule selectScheduleById(int id);
	
	@Update("update schedule set schedule_title=#{scheduleTitle}, start=#{start}, end=#{end}, color=#{color} where schedule_id=#{scheduleId}")
	public int updateSchedule(Schedule schedule);
	
	@Delete("delete from schedule where schedule_id=#{scheduleId}")
	public int deleteSchedule(int id);
	
	@Insert("insert into schedule(user_id, schedule_title, start, end, color) values(#{userId}, #{scheduleTitle}, #{start}, #{end}, #{color})")
	public int insertSchedule(Schedule schedule);

}
