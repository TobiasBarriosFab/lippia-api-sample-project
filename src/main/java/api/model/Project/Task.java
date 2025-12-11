package api.model.Project;

import api.model.Workspace.CostRate;

import java.util.ArrayList;

public class Task{
    public String assigneeId;
    public ArrayList<String> assigneeIds;
    public boolean billable;
    public int budgetEstimate;
    public CostRate costRate;
    public String estimate;
    public HourlyRate hourlyRate;
    public String id;
    public String name;
    public String projectId;
    public String status;
    public ArrayList<String> userGroupIds;
}
