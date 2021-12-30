package bean;

public class UserRole {
    private Integer roleId;
    private String username;

    public UserRole(){}

    public UserRole(Integer roleId, String username) {
        this.roleId = roleId;
        this.username = username;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
