export type ActionRuleType = 'todo' | 'reminder' | 'risk' | 'health_followup';

export interface ActionRuleItem {
  id: string;
  agentRoleId?: string;
  actionType: ActionRuleType;
  name: string;
  instruction?: string;
  isEnabled: number;
  creator?: number;
  createdAt?: string;
  updater?: number;
  updatedAt?: string;
}

export interface ActionRulePayload {
  actionType: ActionRuleType;
  name: string;
  instruction?: string;
  isEnabled?: number;
}

export const ACTION_RULE_TYPE_LABELS: Record<ActionRuleType, string> = {
  todo: '待办事项',
  reminder: '提醒事项',
  risk: '风险线索',
  health_followup: '健康线索'
};

export const ACTION_RULE_TYPE_DESCRIPTIONS: Record<ActionRuleType, string> = {
  todo: '用户明确交代的后续任务或安排，实时识别并确认。',
  reminder: '带时间线索或明确触达需求的提醒，实时识别并确认。',
  risk: '安全、情绪、照护、诈骗等需要后续处理的信号。',
  health_followup: '健康关注点、复诊、用药和回访线索。'
};
