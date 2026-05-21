namespace AiAdmin.Controllers;

public record DeviceStatusRequest(string MacAddress, bool IsOnline);
