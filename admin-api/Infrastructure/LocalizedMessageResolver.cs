using System.Globalization;
using AiAdmin.Localization;
using Microsoft.Extensions.Localization;

namespace AiAdmin.Infrastructure;

public class LocalizedMessageResolver
{
    private static readonly Dictionary<string, string> PhraseMap = new()
    {
        ["智能体"] = "智能體",
        ["知识库"] = "知識庫",
        ["记忆库"] = "記憶庫",
        ["运行时"] = "執行時",
        ["用户"] = "使用者",
        ["设备"] = "設備",
        ["系统"] = "系統",
        ["订单"] = "訂單",
        ["待办"] = "待辦",
        ["工具"] = "工具",
        ["语音识别"] = "語音辨識",
        ["语音合成"] = "語音合成",
        ["图形验证码"] = "圖形驗證碼",
        ["短信验证码"] = "簡訊驗證碼",
        ["手机号"] = "手機號",
        ["用户名"] = "使用者名稱",
        ["客户端"] = "用戶端",
        ["服务端"] = "服務端",
        ["云平台"] = "雲平台",
        ["云端"] = "雲端",
        ["文件"] = "檔案",
        ["文档"] = "文件",
        ["暂无"] = "暫無",
        ["当前"] = "目前",
        ["默认"] = "預設",
        ["编辑"] = "編輯",
        ["删除"] = "刪除",
        ["确认"] = "確認",
        ["保存"] = "儲存",
        ["刷新"] = "重新整理",
        ["加载"] = "載入",
        ["请求"] = "請求",
        ["失败"] = "失敗",
        ["状态"] = "狀態",
        ["类型"] = "類型",
        ["详情"] = "詳情",
        ["配置"] = "設定",
        ["设置"] = "設定",
        ["筛选"] = "篩選",
        ["查询"] = "查詢",
        ["搜索"] = "搜尋",
        ["关键词"] = "關鍵字",
        ["更新时间"] = "更新時間",
        ["创建时间"] = "建立時間",
        ["名称"] = "名稱",
        ["说明"] = "說明",
        ["重置"] = "重設",
        ["处理中"] = "處理中",
        ["待处理"] = "待處理",
        ["严重"] = "嚴重",
        ["风险"] = "風險",
        ["会话"] = "會話",
        ["创建"] = "建立",
        ["金额"] = "金額",
        ["额度"] = "額度",
        ["支付"] = "付款",
        ["渠道"] = "通路",
        ["凭证"] = "憑證",
        ["绑定"] = "綁定",
        ["解绑"] = "解除綁定",
        ["对话"] = "對話",
        ["链路"] = "鏈路",
        ["阶段"] = "階段",
        ["检索"] = "檢索",
        ["上传"] = "上傳",
        ["导入"] = "匯入",
        ["规则"] = "規則",
        ["记录"] = "記錄",
        ["内容"] = "內容",
        ["音频"] = "音訊",
        ["声纹"] = "聲紋",
        ["开场"] = "開場",
        ["结束"] = "結束",
        ["开关"] = "開關",
        ["日志"] = "日誌",
        ["审计"] = "稽核",
        ["权限"] = "權限",
        ["菜单"] = "選單",
        ["页面"] = "頁面"
    };

    private static readonly Dictionary<char, char> CharMap = new()
    {
        ['欢'] = '歡', ['载'] = '載', ['户'] = '戶', ['账'] = '帳', ['号'] = '號', ['码'] = '碼', ['验'] = '驗', ['证'] = '證', ['发'] = '發', ['读'] = '讀', ['写'] = '寫', ['库'] = '庫', ['数'] = '數', ['据'] = '據', ['权'] = '權', ['问'] = '問', ['页'] = '頁', ['总'] = '總', ['条'] = '條', ['当'] = '當', ['显'] = '顯', ['详'] = '詳', ['览'] = '覽', ['说'] = '說', ['错'] = '錯', ['误'] = '誤', ['请'] = '請', ['试'] = '試', ['筛'] = '篩', ['选'] = '選', ['询'] = '詢', ['确'] = '確', ['认'] = '認', ['统'] = '統', ['设'] = '設', ['备'] = '備', ['语'] = '語', ['识'] = '識', ['别'] = '別', ['动'] = '動', ['检'] = '檢', ['测'] = '測', ['绑'] = '綁', ['编'] = '編', ['辑'] = '輯', ['删'] = '刪', ['启'] = '啟', ['择'] = '擇', ['对'] = '對', ['应'] = '應', ['参'] = '參', ['云'] = '雲', ['关'] = '關', ['键'] = '鍵', ['词'] = '詞', ['运'] = '運', ['现'] = '現', ['没'] = '沒', ['败'] = '敗', ['忆'] = '憶', ['规'] = '規', ['则'] = '則', ['义'] = '義', ['记'] = '記', ['录'] = '錄', ['与'] = '與', ['级'] = '級', ['审'] = '審', ['计'] = '計', ['结'] = '結', ['实'] = '實', ['体'] = '體', ['变'] = '變', ['细'] = '細', ['异'] = '異', ['资'] = '資', ['浏'] = '瀏', ['释'] = '釋', ['项'] = '項', ['类'] = '類', ['订'] = '訂', ['线'] = '線', ['扩'] = '擴', ['访'] = '訪', ['册'] = '冊', ['后'] = '後', ['开'] = '開', ['诉'] = '訴', ['档'] = '檔', ['态'] = '態', ['撑'] = '撐', ['迁'] = '遷', ['签'] = '簽', ['约'] = '約', ['单'] = '單', ['额'] = '額', ['创'] = '創', ['处'] = '處', ['严'] = '嚴', ['险'] = '險', ['务'] = '務', ['会'] = '會', ['缓'] = '緩', ['冲'] = '衝', ['输'] = '輸', ['频'] = '頻', ['链'] = '鏈', ['阶'] = '階', ['图'] = '圖', ['树'] = '樹', ['续'] = '續', ['触'] = '觸', ['联'] = '聯', ['调'] = '調', ['拟'] = '擬', ['仪'] = '儀', ['盘'] = '盤', ['节'] = '節', ['点'] = '點', ['绪'] = '緒', ['桥'] = '橋', ['稳'] = '穩', ['场'] = '場', ['势'] = '勢'
    };

    private readonly IStringLocalizer<AiAdminResource> _localizer;

    public LocalizedMessageResolver(IStringLocalizer<AiAdminResource> localizer)
    {
        _localizer = localizer;
    }

    public string Resolve(string? message)
    {
        return Resolve(message, null);
    }

    public string Resolve(string? message, IReadOnlyDictionary<string, object?>? parameters)
    {
        if (string.IsNullOrWhiteSpace(message) || message == "success")
        {
            return message ?? string.Empty;
        }

        var localized = _localizer[message];
        if (!localized.ResourceNotFound && !string.IsNullOrWhiteSpace(localized.Value))
        {
            return Format(localized.Value, parameters);
        }

        if (IsTraditionalChineseCulture() && ContainsChinese(message))
        {
            return Format(ToTraditional(message), parameters);
        }

        return Format(message, parameters);
    }

    private static string Format(string value, IReadOnlyDictionary<string, object?>? parameters)
    {
        if (parameters == null || parameters.Count == 0)
        {
            return value;
        }

        var result = value;
        foreach (var parameter in parameters)
        {
            result = result.Replace("{" + parameter.Key + "}",
                Convert.ToString(parameter.Value, CultureInfo.CurrentCulture) ?? string.Empty,
                StringComparison.Ordinal);
        }

        return result;
    }

    private static bool IsTraditionalChineseCulture()
    {
        var name = CultureInfo.CurrentUICulture.Name;
        return name.Equals("zh-TW", StringComparison.OrdinalIgnoreCase)
            || name.Equals("zh-Hant", StringComparison.OrdinalIgnoreCase)
            || name.StartsWith("zh-Hant-", StringComparison.OrdinalIgnoreCase);
    }

    private static bool ContainsChinese(string value)
    {
        return value.Any(c => c >= '\u4e00' && c <= '\u9fff');
    }

    private static string ToTraditional(string value)
    {
        var result = value;
        foreach (var item in PhraseMap)
        {
            result = result.Replace(item.Key, item.Value, StringComparison.Ordinal);
        }

        return new string(result.Select(c => CharMap.GetValueOrDefault(c, c)).ToArray());
    }
}
