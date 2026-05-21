namespace AiAdmin.Services.Rbac.Dtos;

/// <summary>菜单树形结构DTO</summary>
public class MenuTreeDto
{
    /// <summary>菜单ID</summary>
    public long Id { get; set; }
    /// <summary>父菜单ID</summary>
    public long? ParentId { get; set; }
    /// <summary>菜单名称</summary>
    public string Name { get; set; } = string.Empty;
    /// <summary>菜单代码</summary>
    public string Code { get; set; } = string.Empty;
    /// <summary>类型</summary>
    public short Type { get; set; }
    /// <summary>排序</summary>
    public int Sort { get; set; }
    /// <summary>子菜单列表</summary>
    public List<MenuTreeDto> Children { get; set; } = [];
}

