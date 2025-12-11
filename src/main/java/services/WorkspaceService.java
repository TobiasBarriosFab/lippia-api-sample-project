package services;

import api.model.Workspace.WorkspaceResponse;
import com.crowdar.api.rest.APIManager;
import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;

import java.util.HashMap;
import java.util.Map;

public class WorkspaceService extends BaseService{

    public static Response get(String jsonName) {
        return get(jsonName, WorkspaceResponse[].class,setParams());
    }

    private static Map<String, String> setParams() {
        Map<String, String> params = new HashMap<String, String>();
        params.put("base.url", PropertyManager.getProperty("base.api.url"));
        params.put("api-key",X_API_KEY.get());
        return params;
    }
    public static void obtenerWorkspaceId(){
        WorkspaceResponse[] workspacesResponses = (WorkspaceResponse[]) APIManager.getLastResponse().getResponse();
        WORKSPACE_ID.set(workspacesResponses[0].getId());
    }

}
