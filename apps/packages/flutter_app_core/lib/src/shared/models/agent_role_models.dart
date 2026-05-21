class AgentRoleInfo {
  const AgentRoleInfo({
    required this.id,
    required this.code,
    required this.name,
    required this.displayName,
    required this.description,
    required this.status,
    required this.icon,
    required this.coverImage,
    required this.currentReleaseId,
    required this.currentVersion,
    required this.publishedAt,
    required this.sort,
  });

  final String? id;
  final String? code;
  final String? name;
  final String? displayName;
  final String? description;
  final String? status;
  final String? icon;
  final String? coverImage;
  final String? currentReleaseId;
  final String? currentVersion;
  final String? publishedAt;
  final int sort;

  String get title {
    final value = displayName ?? name ?? code ?? '未命名智能体角色';
    return value.trim().isEmpty ? '未命名智能体角色' : value;
  }

  factory AgentRoleInfo.fromJson(Map<String, dynamic> json) {
    return AgentRoleInfo(
      id: json['id']?.toString(),
      code: json['code']?.toString(),
      name: json['name']?.toString(),
      displayName: json['displayName']?.toString(),
      description: json['description']?.toString(),
      status: json['status']?.toString(),
      icon: json['icon']?.toString(),
      coverImage: json['coverImage']?.toString(),
      currentReleaseId: json['currentReleaseId']?.toString(),
      currentVersion: json['currentVersion']?.toString(),
      publishedAt: json['publishedAt']?.toString(),
      sort: (json['sort'] as num?)?.toInt() ?? 0,
    );
  }
}

class AgentRoleReleaseInfo {
  const AgentRoleReleaseInfo({
    required this.id,
    required this.roleId,
    required this.version,
    required this.status,
    required this.publishedAt,
  });

  final String? id;
  final String? roleId;
  final String? version;
  final String? status;
  final String? publishedAt;

  factory AgentRoleReleaseInfo.fromJson(Map<String, dynamic> json) {
    return AgentRoleReleaseInfo(
      id: json['id']?.toString(),
      roleId: json['roleId']?.toString(),
      version: json['version']?.toString(),
      status: json['status']?.toString(),
      publishedAt: json['publishedAt']?.toString(),
    );
  }
}
