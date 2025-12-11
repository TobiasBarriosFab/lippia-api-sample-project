package api.model.Client;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter

public class ClientResponse {
    public String address;
    public boolean archived;
    public String ccEmails;
    public String currencyCode;
    public String currencyId;
    public String email;
    public String id;
    public String name;
    public String note;
    public String workspaceId;
}
