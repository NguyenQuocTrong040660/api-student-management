package com.system.api.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.system.api.entity.Dates;
import com.system.api.response.DateResponseByWeek;
import com.system.api.response.checkVPByWeek;

public interface DatesRepository extends JpaRepository<Dates, Integer> {
	
	
	//@Query(value ="select a.date_id as id,a.entry_date as entryDate,a.week_year as week,a.name_day as nameDay from dbo.dates as a join dbo.checkvp as b on a.date_id=b.id ",nativeQuery = true)
	//Check VP
	@Query(value ="select a.date_id AS id,a.entry_date AS entryDate,a.week_year AS week ,a.name_day AS nameDay, b.offence_id AS offenceId,"
			+ "b.student_id AS studentId ,s.name_student AS nameStudent from dbo.dates as a left join dbo.checkvp as b on a.date_id=b.date_id join dbo.student as s on b.student_id=s.id WHERE a.week_year=:week",nativeQuery = true)
	List<checkVPByWeek> checkVPByWeekYear(Integer week );
	
	//Get nowDate => CheckVP
	@Query(value =" SELECT * FROM dbo.dates as d WHERE d.entry_date=:entryDate",nativeQuery = true)
	Dates findByEntryDate( String entryDate);
	
	//get Weeks =>Lecture
	@Query(value ="Select distinct a.week_year as weekYear from dbo.dates as a",nativeQuery = true)
	List<DateResponseByWeek> findDistinctByWeek();
	
	//Get Date Where Week =>Lecture
	List<Dates> findByWeek(Integer week);
	
	
	
	

}
