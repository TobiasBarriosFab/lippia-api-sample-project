package ar.steps;

import com.crowdar.core.PageSteps;
import io.cucumber.java.en.And;
import services.ClientService;

public class ClientSteps extends PageSteps {


    @And("^tengo un cliente con el nombre (.*)$")
    public void tengoUnClienteConElNombre(String name) {
        ClientService.validarNombreCLienteLista(name);
    }

    @And("obtengo un client id")
    public void obtengoUnClientId() {
        ClientService.obtenerClientId();
    }

}
