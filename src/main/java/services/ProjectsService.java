package services;


import api.model.Project.ProjectResponse;
import api.model.Project.ProjectResponses;
import com.crowdar.api.rest.APIManager;
import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;
import java.util.HashMap;
import java.util.Map;


public class ProjectsService extends BaseService {
    public static Response get(String jsonName) {
        return get(jsonName, ProjectResponse.class,setParams());
    }
    private static Map<String, String> setParams() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("base.url", PropertyManager.getProperty("base.api.url"));
    params.put("api-key",X_API_KEY.get());
    params.put("workspace-id",WORKSPACE_ID.get());
    params.put("projectId",PROJECT_ID.get());
    return params;

}

    public static void obtenerProjectId() {
        ProjectResponse[] listaProyectosResponses = (ProjectResponse[]) APIManager.getLastResponse().getResponse();
        PROJECT_ID.set(listaProyectosResponses[0].getId());
        System.out.println(listaProyectosResponses[0].getId());
    }
    public static Response put(String jsonName){
        return put(jsonName, ProjectResponses.class,setParams());

    }

}
