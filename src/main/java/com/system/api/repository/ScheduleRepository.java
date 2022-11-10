package com.system.api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.system.api.entity.Schedule;
import com.system.api.model.ScheduleDTO;
import com.system.api.response.ResponseReportSDB;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
	
	
	List<Schedule> findByDatesWeekOrderByDateStartAscLessionAsc(Integer id);
	
	List<Schedule> findAllByOrderByDateStartAscLessionAsc();
	
	@Query(value="select a.id as idSchedule,c.id as idEvalue,b.name_day as nameDay,a.lession as lession,\r\n"
			+ "     a.lessionppct as lessionPPCT,d.subject_name as subjectName,\r\n"
			+ "	   a.subject_content as subjectContent,\r\n"
			+ "	   c.evaluate_note as evaluateNote,c.mark1 as mark1,c.mark2 as mark2,\r\n"
			+ "	   c.mark3 as mark3,c.home_work as homeWork,\r\n"
			+ "	   a.name_teacher as nameTeacher,b.entry_date as entryDate\r\n"
			+ "\r\n"
			+ "from dbo.schedule as a \r\n"
			+ "left join dbo.dates as b on a.date_id=b.date_id\r\n"
			+ "left join dbo.schedule_evaluate as c on a.id=c.schedule_id\r\n"
			+ "join dbo.subject as d on a.subject_id=d.id\r\n"
			+ "where b.week_year = :week_year\r\n"
			+ "and a.clazz_id=:idClazz",nativeQuery = true)
	List<ResponseReportSDB> responseReportSDB(Integer week_year,Integer idClazz);
    
	
}
