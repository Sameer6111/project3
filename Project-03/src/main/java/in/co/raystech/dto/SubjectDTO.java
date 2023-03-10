package in.co.raystech.dto;

/**
 * SubjectDTO having attributes subjectName,courseName,courseId,description
 * 
 * @author sameer
 **/

public class SubjectDTO extends BaseDTO {
	
	private static final long serialVersionUID = 1L;
	private String subjectName;
	private String courseName;
	private int courseId;
	private String description;

public SubjectDTO() {
	// TODO Auto-generated constructor stub
}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKey() {
		return id+"";
	}

	public String getValue() {
		return subjectName+"";
	}



}

