import { AdminAppManifest } from '../core/microfrontends/admin-app.manifest';
import { composeAdminManifest } from '../core/microfrontends/compose-admin-manifest';
import { agentRolesFeature } from './features/agent-roles.feature';
import { bindingConfigsFeature } from './features/binding-configs.feature';
import { authFeature } from './features/auth.feature';
import { billingFeature } from './features/billing.feature';
import { dashboardFeature } from './features/dashboard.feature';
import { datasetsFeature } from './features/datasets.feature';
import { devicesFeature } from './features/devices.feature';
import { memoryLibrariesFeature } from './features/memory-libraries.feature';
import { errorsFeature } from './features/errors.feature';
import { mcpToolsFeature } from './features/mcp-tools.feature';
import { systemFeature } from './features/system.feature';
import { todosFeature } from './features/todos.feature';
import { usersFeature } from './features/users.feature';
import { voicesFeature } from './features/voices.feature';

const baselineBranding = {
  appName: 'AI',
  shellSubtitle: 'branding.shellSubtitle',
  shellVersion: '1.0',
  headerTitle: 'branding.headerTitle',
  headerDescription: 'branding.headerDescription',
  loginBadge: 'AI',
  loginTitle: 'branding.loginTitle',
  loginDescription: 'branding.loginDescription',
  registerBadge: 'AI',
  registerTitle: 'branding.registerTitle',
  registerDescription: 'branding.registerDescription',
  retrievePasswordBadge: 'AI',
  retrievePasswordTitle: 'branding.retrievePasswordTitle',
  retrievePasswordDescription: 'branding.retrievePasswordDescription',
  dashboardTag: 'Dashboard',
  dashboardTitle: 'branding.dashboardTitle',
  dashboardDescription: 'branding.dashboardDescription'
};

export const baselineAdminManifest: AdminAppManifest = composeAdminManifest({
  appId: 'ai_admin',
  branding: baselineBranding,
  features: [
    authFeature,
    dashboardFeature,
    devicesFeature,
    agentRolesFeature,
    bindingConfigsFeature,
    datasetsFeature,
    memoryLibrariesFeature,
    todosFeature,
    mcpToolsFeature,
    voicesFeature,
    billingFeature,
    usersFeature,
    systemFeature,
    errorsFeature
  ]
});
