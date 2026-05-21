import { CommonModule } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { forkJoin } from 'rxjs';
import { finalize } from 'rxjs/operators';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { TreeModule } from 'primeng/tree';
import { TreeNode } from 'primeng/api';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { MenuTreeItem } from '../../../../core/auth/rbac.models';
import { RoleService } from '../shared/role.service';
import { PageToolbarComponent } from '../../../../shared/components/page-toolbar.component';

@Component({
  selector: 'app-role-permissions-page',
  standalone: true,
  imports: [PageToolbarComponent, CommonModule, ButtonModule, CardModule, TreeModule, FeedbackMessageComponent, TranslatePipe],
  templateUrl: './role-permissions-page.component.html',
  styleUrl: './role-permissions-page.component.css'
})
export class RolePermissionsPageComponent implements OnInit {
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly roleService = inject(RoleService);
  private readonly i18n = inject(I18nService);

  readonly roleId = signal(0);
  readonly loading = signal(false);
  readonly submitting = signal(false);
  readonly feedbackMessage = signal('');
  readonly treeNodes = signal<TreeNode[]>([]);
  readonly selectedNodes = signal<TreeNode[]>([]);

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.roleId.set(id);
    this.loadData(id);
  }

  private loadData(roleId: number): void {
    this.loading.set(true);

    forkJoin({
      menuTree: this.roleService.getMenuTree(),
      roleMenus: this.roleService.getRoleMenus(roleId)
    })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: ({ menuTree, roleMenus }) => {
          if (menuTree.code !== 0 || !menuTree.data) {
            this.feedbackMessage.set(this.localize('菜单树加载失败'));
            return;
          }
          const checkedIds = new Set(roleMenus.data ?? []);
          const nodes = this.toTreeNodes(menuTree.data);
          this.treeNodes.set(nodes);

          const selected: TreeNode[] = [];
          this.collectSelected(nodes, checkedIds, selected);
          this.selectedNodes.set(selected);
        },
        error: () => this.feedbackMessage.set(this.localize('数据加载失败'))
      });
  }

  save(): void {
    const selected = this.selectedNodes();
    const menuIds = this.collectAllIds(selected);

    this.feedbackMessage.set('');
    this.submitting.set(true);

    this.roleService
      .assignMenus(this.roleId(), menuIds)
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: res => {
          if (res.code === 0) {
            void this.router.navigate(['/users/roles']);
          } else {
            this.feedbackMessage.set(res.msg || this.localize('保存失败'));
          }
        },
        error: () => this.feedbackMessage.set(this.localize('保存请求失败'))
      });
  }

  cancel(): void {
    void this.router.navigate(['/users/roles']);
  }

  onSelectionChange(nodes: TreeNode[]): void {
    this.selectedNodes.set(nodes);
  }

  private toTreeNodes(items: MenuTreeItem[]): TreeNode[] {
    return items.map(item => ({
      key: String(item.id),
      label: item.name,
      data: item,
      icon: item.type === 2 ? 'pi pi-lock' : item.type === 0 ? 'pi pi-folder' : 'pi pi-file',
      children: item.children ? this.toTreeNodes(item.children) : [],
      selectable: true,
      leaf: !item.children || item.children.length === 0
    }));
  }

  private collectSelected(nodes: TreeNode[], checkedIds: Set<number>, result: TreeNode[]): void {
    for (const node of nodes) {
      if (node.children && node.children.length > 0) {
        this.collectSelected(node.children, checkedIds, result);
        // 父节点只在子节点全选时才勾选
        const allChildrenSelected = node.children.every(c => result.includes(c));
        if (allChildrenSelected) {
          result.push(node);
        }
      } else {
        const id = Number(node.key);
        if (checkedIds.has(id)) {
          result.push(node);
        }
      }
    }
  }

  private collectAllIds(nodes: TreeNode[]): number[] {
    const ids = new Set<number>();
    for (const node of nodes) {
      ids.add(Number(node.key));
      if (node.children) {
        for (const childId of this.collectAllIds(node.children)) {
          ids.add(childId);
        }
      }
    }
    // Also collect partially selected parent IDs
    this.addPartialParentIds(this.treeNodes(), ids);
    return Array.from(ids);
  }

  private addPartialParentIds(nodes: TreeNode[], ids: Set<number>): void {
    for (const node of nodes) {
      if (node.children && node.children.length > 0) {
        this.addPartialParentIds(node.children, ids);
        const hasSelectedChild = node.children.some(c => ids.has(Number(c.key)));
        if (hasSelectedChild) {
          ids.add(Number(node.key));
        }
      }
    }
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
