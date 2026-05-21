import { InjectionToken } from '@angular/core';
import { Route } from '@angular/router';

export interface AdminNavigationItem {
  label: string;
  icon: string;
  route?: string;
  permission?: string;
  roleTabKey?: string;
  roleCapabilityKey?: string;
  children?: AdminNavigationItem[];
}

export interface AdminQuickAction {
  label: string;
  description: string;
  route: string;
  icon: string;
  permission?: string;
  roleTabKey?: string;
  roleCapabilityKey?: string;
  roleQuickActionKey?: string;
}

export interface AdminBranding {
  appName: string;
  shellSubtitle: string;
  shellVersion: string;
  headerTitle: string;
  headerDescription: string;
  loginBadge: string;
  loginTitle: string;
  loginDescription: string;
  registerBadge: string;
  registerTitle: string;
  registerDescription: string;
  retrievePasswordBadge: string;
  retrievePasswordTitle: string;
  retrievePasswordDescription: string;
  dashboardTag: string;
  dashboardTitle: string;
  dashboardDescription: string;
}

export interface AdminFeatureManifest {
  key: string;
  navigation?: AdminNavigationItem[];
  publicRoutes?: Route[];
  protectedRoutes?: Route[];
  dashboardQuickActions?: AdminQuickAction[];
}

export interface AdminAppManifest {
  appId: string;
  branding: AdminBranding;
  navigation: AdminNavigationItem[];
  publicRoutes: Route[];
  protectedRoutes: Route[];
  dashboardQuickActions: AdminQuickAction[];
  features: AdminFeatureManifest[];
}

export const ADMIN_APP_MANIFEST = new InjectionToken<AdminAppManifest>('ADMIN_APP_MANIFEST');
