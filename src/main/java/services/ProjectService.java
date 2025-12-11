package services;

import api.model.Project.ProjectResponse;
import api.model.Project.ProjectResponses;

import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;

import java.util.HashMap;
import java.util.Map;

public class ProjectService extends BaseService{
    public static Response get(String jsonName) {
        return get(jsonName, ProjectResponse[].class,setParams());
    }

    private static Map<String, String> setParams() {
        Map<String, String> params = new HashMap<String, String>();
        params.put("base.url", PropertyManager.getProperty("base.api.url"));
        params.put("api-key",X_API_KEY.get());
        params.put("workspace-id",WORKSPACE_ID.get());
        return params;
    }
    public static Response post(String jsonName) {
        return post(jsonName,ProjectResponse.class,setParams());
    }
    public static Response delete(String jsonName){
        return delete(jsonName, ProjectResponse.class,setParams());
    }

    public static Response getFind(String jsonName){
        return get(jsonName, ProjectResponses.class,setParams());
    }

}
