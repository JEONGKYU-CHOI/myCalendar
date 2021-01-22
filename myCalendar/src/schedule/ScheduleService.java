package schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	
	@Autowired
	ScheduleMapper scheduleMapper;
	
	public List<Schedule> getScheduleList(int num){
		return scheduleMapper.selectAll(num);
	}
	
	public Schedule getScheduleById(int id) {
		return scheduleMapper.selectScheduleById(id);
	}
	
	public int updateSchedule(Schedule schedule) {
		return scheduleMapper.updateSchedule(schedule);
	}
	
	public int deleteSchedule(int id) {
		return scheduleMapper.deleteSchedule(id);
	}
	
	public int insertSchedule(Schedule schedule) {
		return scheduleMapper.insertSchedule(schedule);
	}

}
