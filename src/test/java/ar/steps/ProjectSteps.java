package ar.steps;

import com.crowdar.core.PageSteps;
import io.cucumber.java.en.And;
import services.ProjectsService;
import services.WorkspaceService;

public class ProjectSteps extends PageSteps {

    @And("Obtengo un workspace id")
    public void obtengoUnWorkspaceId() {
        WorkspaceService.obtenerWorkspaceId();
    }

    @And("obtengo un project id")
    public void obtengoUnProjectId() {
        ProjectsService.obtenerProjectId();
    }
}
