import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/models/agent_role_models.dart';
import '../../shared/widgets/surface_card.dart';
import 'agent_role_controller.dart';

class AgentRoleScreen extends StatefulWidget {
  const AgentRoleScreen({super.key});

  @override
  State<AgentRoleScreen> createState() => _AgentRoleScreenState();
}

class _AgentRoleScreenState extends State<AgentRoleScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AgentRoleController>().loadRoles();
    });
  }

  Future<void> _refresh(BuildContext context) {
    return context.read<AgentRoleController>().loadRoles(force: true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AgentRoleController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('智能体角色')),
          body: RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                SurfaceCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '智能体角色目录',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '这里展示平台已发布并激活的智能体角色。设备绑定后会使用对应角色的模型、音色、记忆和应用配置。',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.82),
                            ),
                      ),
                      if (controller.statusMessage.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Text(controller.statusMessage),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (controller.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (controller.roles.isEmpty)
                  const SurfaceCard(
                    child: Column(
                      children: [
                        Icon(Icons.psychology_alt_outlined, size: 44),
                        SizedBox(height: 12),
                        Text('暂无可用智能体角色'),
                        SizedBox(height: 6),
                        Text('请在管理后台发布并激活智能体角色后再刷新'),
                      ],
                    ),
                  )
                else
                  ...controller.roles.map(
                    (role) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _AgentRoleCard(role: role),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AgentRoleCard extends StatelessWidget {
  const _AgentRoleCard({required this.role});

  final AgentRoleInfo role;

  @override
  Widget build(BuildContext context) {
    final description = role.description == null || role.description!.trim().isEmpty
        ? '已发布可绑定到设备'
        : role.description!;
    final version = role.currentVersion == null || role.currentVersion!.isEmpty
        ? '当前版本'
        : '版本 ${role.currentVersion}';

    return SurfaceCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Text(role.title.substring(0, 1)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(description),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(label: Text(version)),
                    if ((role.code ?? '').isNotEmpty) Chip(label: Text(role.code!)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
