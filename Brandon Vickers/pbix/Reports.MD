SQL ASSIGNMENT: https://app.powerbi.com/groups/b7a80268-ddf8-41c0-8ae4-344ccb981840/reports/b52a97f7-721e-453f-a0c9-1616f1b0fa1f?ctid=674d3e6c-45f7-42e9-938c-fcd01e3ff57c&pbi_source=linkShare
DAX ASSIGNMENT: https://app.powerbi.com/groups/b7a80268-ddf8-41c0-8ae4-344ccb981840/reports/11173536-8442-4c9c-990e-c3252d62c347?ctid=674d3e6c-45f7-42e9-938c-fcd01e3ff57c&pbi_source=linkShare
DAX USED: 
CoursesTaken = COUNTROWS(FILTER(
					RELATEDTABLE(StudentCourses), 
					StudentCourses[StudentID])
)

Total Units = 
SUMX(
    FILTER(
        ALL(Students),
        Students[StudentID] = EARLIER(Students[StudentID])
    ),
    SUMX(
        FILTER(
            StudentCourses,
            StudentCourses[StudentID] = EARLIER(Students[StudentID])
        ),
        StudentCourses[Units]
    )
)

TotalTuition = Students[Total Units] * 62.5

EnrollmentYear = YEAR(Students[EnrollmentDate])


Measure = CALCULATE(
			SUM(
			StudentCourses[Units]), 
			FILTER(ALL(StudentCourses), 
			StudentCourses[LastName] = "Taylor")
)

TuitionRevenueByYear = SUMX(
				CALCULATETABLE(
				'Students',
				'Students'[EnrollmentYear] = 2016),
 				[TotalTuition])




