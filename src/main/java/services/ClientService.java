package services;

import api.model.Client.ClientResponse;
import api.model.Project.ProjectResponse;
import com.crowdar.api.rest.APIManager;
import com.crowdar.api.rest.Response;
import com.crowdar.core.PropertyManager;
import junit.framework.Assert;

import java.util.*;

public class ClientService extends BaseService{
    public static Response get(String jsonName) {
        return get(jsonName, ClientResponse[].class,setParams());
    }
    public static Response post(String jsonName) {
        return post(jsonName,ClientResponse.class,setParams());
    }
    public static Response delete(String jsonName){
        return delete(jsonName, ClientResponse.class,setParams());
    }

    private static Map<String, String> setParams() {
        Map<String, String> params = new HashMap<String, String>();

        params.put("base.url", PropertyManager.getProperty("base.api.url"));
        params.put("api-key",X_API_KEY.get());
        params.put("workspace-id",WORKSPACE_ID.get());
        if (CLIENT_ID.get() != null && !CLIENT_ID.get().isEmpty()) {
            params.put("client-id", CLIENT_ID.get());}

        return params;
    }


    public static boolean validarNombreCLienteLista(String name){
        ClientResponse[] clientResponse = (ClientResponse[]) APIManager.getLastResponse().getResponse();
        List<ClientResponse> array = Arrays.asList(clientResponse);
        boolean existe = false;

        for (ClientResponse cr : array){
            if (cr.name.equalsIgnoreCase(name)) existe = true;

        }
        return existe;
    }



    public static void obtenerClientId() {
        ClientResponse[] listaClientes = (ClientResponse[]) APIManager.getLastResponse().getResponse();
        if (listaClientes.length > 0) {
            CLIENT_ID.set(listaClientes[0].getId());
            System.out.println("Client ID obtenido: " + CLIENT_ID.get());
        } else {
            System.out.println("No hay clientes en la lista");
        }
    }
}
