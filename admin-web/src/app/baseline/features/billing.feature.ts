import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const billingFeature: AdminFeatureManifest = {
  key: 'billing',
  navigation: [
    {
      label: 'menu.billing',
      icon: 'pi pi-wallet',
      route: '/billing',
      permission: 'billing-subscription:list',
      roleCapabilityKey: 'billing.subscription',
      children: [
        // { label: '订阅概览', icon: 'pi pi-id-card', route: '/billing', permission: 'billing-subscription:list' },
        {
          label: 'billing.usage',
          icon: 'pi pi-chart-bar',
          route: '/billing/usage',
          permission: 'billing-usage:list',
          roleCapabilityKey: 'billing.subscription'
        },
        {
          label: 'billing.orders',
          icon: 'pi pi-receipt',
          route: '/billing/orders',
          permission: 'billing-order:list',
          roleCapabilityKey: 'billing.subscription'
        }
      ]
    }
  ],
  protectedRoutes: [
    {
      path: 'billing',
      loadComponent: () =>
        import('../../features/billing/subscriptions/billing-subscriptions-page.component').then(
          m => m.BillingSubscriptionsPageComponent
        ),
      title: 'menu.billing',
      data: {
        title: 'menu.billing',
        description: 'billing.pageDescription',
        permission: 'billing-subscription:list',
        roleCapabilityKey: 'billing.subscription'
      }
    },
    {
      path: 'billing/usage',
      loadComponent: () =>
        import('../../features/billing/usage/billing-usage-page.component').then(m => m.BillingUsagePageComponent),
      title: 'billing.usage',
      data: {
        title: 'billing.usage',
        permission: 'billing-usage:list',
        roleCapabilityKey: 'billing.subscription'
      }
    },
    {
      path: 'billing/orders',
      loadComponent: () =>
        import('../../features/billing/orders/billing-orders-page.component').then(m => m.BillingOrdersPageComponent),
      title: 'billing.orders',
      data: {
        title: 'billing.orders',
        permission: 'billing-order:list',
        roleCapabilityKey: 'billing.subscription'
      }
    }
  ]
};
